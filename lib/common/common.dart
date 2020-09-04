class Constant {
  static const int status_success = 0;


  static const String base_url = "https://api.xiaoe-tech.com/";
  static const String base_test_url = "https://api.xiaoe-tech.com/";

  static const int type_sys_update = 1;
  static const String key_theme_color = 'key_theme_color';
  static const String key_guide = 'key_guide';
  static const String key_splash_model = 'key_splash_models';
}

class AppConfig {
  static const bool kReleaseMode =
      bool.fromEnvironment('dart.vm.product', defaultValue: false);

  static String get appName => kReleaseMode ? '大塘小鱼' : '大塘小鱼(Debug)';

  static bool get isDebug => kReleaseMode;

  static String get server_address =>
      kReleaseMode ? Constant.base_url : Constant.base_test_url;
}
