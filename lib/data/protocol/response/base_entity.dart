/// <BaseResp<T> 返回 status code msg data.
class BaseResp<T> {
  String msg;
  int code;
  T data;

  BaseResp(this.code, this.msg, this.data);
}
