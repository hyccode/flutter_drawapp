import 'dart:convert';
import 'dart:io';

import 'package:common_utils/common_utils.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:yubeiapp/common/common.dart';
import 'package:yubeiapp/data/api/apis.dart';
import 'package:yubeiapp/data/protocol/request/base_req_entity.dart';
import 'package:yubeiapp/data/protocol/response/access_token_entity.dart';
import 'package:yubeiapp/data/protocol/response/base_entity.dart';
import 'package:yubeiapp/resources/shared_preferences_keys.dart';
import 'package:yubeiapp/utils/shared_preferences.dart';

import '../../entity_factory.dart';

/// 请求方法.
class Method {
  static final String get = "GET";
  static final String post = "POST";
  static final String put = "PUT";
  static final String head = "HEAD";
  static final String delete = "DELETE";
  static final String patch = "PATCH";
}

///Http配置.
class HttpConfig {
  /// constructor.
  HttpConfig({
    this.code,
    this.msg,
    this.data,
    this.options,
  });

  /// BaseResp [int code]字段 key, 默认：errorCode.
  String code;

  /// BaseResp [String msg]字段 key, 默认：errorMsg.
  String msg;

  /// BaseResp [T data]字段 key, 默认：data.
  String data;

  /// Options.
  Options options;
}

/// 单例 DioUtil.
/// debug模式下可以打印请求日志. DioUtil.openDebug().
/// dio详细使用请查看dio官网(https://github.com/flutterchina/dio).
class DioUtil {
  static final DioUtil _singleton = DioUtil._init();
  static Dio _dio;
  static ApiService apiService;

  /// Options.
  BaseOptions _options = getDefOptions();

  static ApiService getInstance() {
    if (_singleton == null) {
      new DioUtil();
    }
    if (apiService == null) {
      apiService = new ApiService(_dio);
    }
    return apiService;
  }

  //工厂构造函数(Factory constructors)
  //factory 关键字的功能，当实现构造函数但是不想每次都创建该类的一个实例的时候使用。
  factory DioUtil() {
    return _singleton;
  }

  DioUtil._init() {
    _dio = new Dio(_options);
    _dio.interceptors.add(_interceptorsWrapper);
    _dio.interceptors.add(LogInterceptor(
        responseBody: true, requestHeader: true, error: true)); //开启请求日志
    apiService = new ApiService(_dio);
  }

  /// get dio.
  static Dio getDio() {
    return _dio ?? new Dio();
  }

  /// get Def Options.
  static BaseOptions getDefOptions() {
    BaseOptions options = new BaseOptions(
      baseUrl: AppConfig.server_address,
      connectTimeout: 1000 * 10,
      receiveTimeout: 1000 * 10,
    );
    return options;
  }

  ///设置拦截器
  InterceptorsWrapper _interceptorsWrapper =
  InterceptorsWrapper(onRequest: (Options options) async {
    // 在请求被发送之前做一些事情
    // 判断userId是否为空
    if (apiService._userId == null) {
      SpUtil sp = await SpUtil.getInstance();
      apiService._userId = sp.getString(SharedPreferencesKeys.UserId);
      if (apiService._userId != null && options is RequestOptions) {
        options.queryParameters.update(
            "user_id", (value) => (apiService._userId),
            ifAbsent: () =>
            (apiService
                ._userId)); //key不存在  但有ifAbsent参数 返回ifAbsent函数的值  并添加到map中
      }
    }

    // 判断token是否为空
    if (apiService._accessToken == null) {
      SpUtil sp = await SpUtil.getInstance();
      apiService._accessToken = sp.getString(SharedPreferencesKeys.accessToken);
      if (options is RequestOptions) {
        options.queryParameters.update(
            "access_token", (value) => (apiService._accessToken),
            ifAbsent: () =>
            (apiService
                ._accessToken)); //key不存在  但有ifAbsent参数 返回ifAbsent函数的值  并添加到map中
      }
    }

    if (apiService._accessToken == null) {
      _dio.lock();
      //  dio instance to request token
      Dio tokenDio = Dio();
      tokenDio.options = _dio.options;

      Map<String, String> map = new Map();
      map["app_id"] = "appXaDBHn4E5888";
      map["secret_key"] = "Hqf3YUu6OGo5t7CabahAdm5ncHYto4Ex";
      map["grant_type"] = "client_credential";

      return tokenDio.get(Api.TOKEN, queryParameters: map).then((response) {
        if (response.statusCode == HttpStatus.ok ||
            response.statusCode == HttpStatus.created) {
          try {
            int _code = response.data["code"];
            String _msg = response.data["msg"];
            if (_code == 0) {
              var _data = response.data["data"];
              AccessTokenEntity accessTokenEntity =
              EntityFactory.generateOBJ<AccessTokenEntity>(_data);

              apiService._accessToken = accessTokenEntity.accessToken;

              setAccessToken(accessTokenEntity.accessToken);
            }
          } catch (e) {
            LogUtil.e(e.toString(), tag: "data parsing");
          }
        }
        if (options is RequestOptions) {
          options.queryParameters.update(
              "access_token", (value) => (apiService._accessToken),
              ifAbsent: () =>
              (apiService
                  ._accessToken)); //key不存在  但有ifAbsent参数 返回ifAbsent函数的值  并添加到map中
        }
        return options;
      }).whenComplete(() => _dio.unlock()); // unlock the dio
    } else {
      return options;
    }
  }, onResponse: (Response response) {
    if (response != null) {
      int _code = response.data["code"];
      if (_code == 2008) {
      SpUtil.instance.then((sp){
        sp.remove(SharedPreferencesKeys.accessToken);
      });
        apiService._accessToken = null;
      }
    }

    // 在返回响应数据之前做一些预处理
    return response; // continue
  }, onError: (DioError e) {
    // 当请求失败时做一些预处理
    return e; //continue
  });

  static void setAccessToken(String accessToken) async {
    SpUtil instance = await SpUtil.getInstance();
    instance.putString(SharedPreferencesKeys.accessToken, accessToken);
  }
}

class ApiService {
  ApiService(this._dio);

  Dio _dio;

  //token必传
  String _accessToken;

  //非必传
  String _userId;

  /// BaseResp [int code]字段 key, 默认：errorCode.
  String _error_code = "code";

  /// BaseResp [String msg]字段 key, 默认：errorMsg.
  String _reason = "msg";

  /// BaseResp [T data]字段 key, 默认：data.
  String _result = "data";

  /// decode response data.
  Map<String, dynamic> _decodeData(Response response) {
    if (response == null ||
        response.data == null ||
        response.data
            .toString()
            .isEmpty) {
      return new Map();
    }
    return json.decode(response.data.toString());
  }

  /// Make http request with options.
  /// [method] The request method.
  /// [path] The url path.
  /// [data] The request data
  /// [options] The request options.
  /// <BaseResp<T> 返回 status code msg data .
  Future<BaseResp> request<T>(String method, String path,
      {data,
        Map<String, dynamic> params,
        CancelToken cancelToken,
        ProgressCallback onSendProgress}) async {
    _dio.options = checkOptions(method, _dio.options);
    Response response = await _dio.request(path,
        queryParameters:
        BaseReq(_accessToken, data: params, userId: _userId).toJson(),
        data: data,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress);
    int _code;
    String _msg;
    var _data;
    if (response.statusCode == HttpStatus.ok ||
        response.statusCode == HttpStatus.created) {
      try {
        if (response.data is Map) {
          _code = (response.data[_error_code] is String)
              ? int.tryParse(response.data[_error_code])
              : response.data[_error_code];
          _msg = response.data[_reason];
          _data = response.data[_result];
        } else {
          Map<String, dynamic> _dataMap = _decodeData(response);
          _code = (_dataMap[_error_code] is String)
              ? int.tryParse(_dataMap[_error_code])
              : _dataMap[_error_code];
          _msg = _dataMap[_reason];
          _data = _dataMap[_result];
        }
        if (_data is Map) {
          return new BaseResp(_code, _msg, EntityFactory.generateOBJ<T>(_data));
        } else {
          List<T> list;
          if (_data != null) {
            list = (_data as List)
                .map((value) => EntityFactory.generateOBJ<T>(value))
                .toList();
          }
          return new BaseResp(_code, _msg, list);
        }
      } catch (e) {
        LogUtil.e(e.toString(), tag: "data parsing");
        return new Future.error(new DioError(
          response: response,
          type: DioErrorType.RESPONSE,
        ));
      }
    }
    LogUtil.e("statusCode: $response.statusCode, service error",
        tag: "data parsing");
    return new Future.error(new DioError(
      response: response,
      type: DioErrorType.RESPONSE,
    ));
  }

  Observable post<T>(String url, {
    var params,
    data,
    ProgressCallback onSendProgress,
  }) =>
      Observable.fromFuture(
        request<T>(
          Method.post,
          url,
          params: params,
          data: data,
          onSendProgress: onSendProgress,
        ),
      ).asBroadcastStream();

  Observable get<T>(String url, {
    Map<String, dynamic> params,
  }) =>
      Observable.fromFuture(
        request<T>(
          Method.get,
          url,
          params: params,
        ),
      ).asBroadcastStream();

  BaseOptions checkOptions(method, options) {
    if (options == null) {
      options = Options();
    }
    options.method = method;
    return options;
  }
}
