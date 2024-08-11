import 'package:carnagef_alpha/core/constants/constants.dart';

enum Environment { dev, sit, uat, prod}

/// class for configure flavor / environment
/// such ass base API endpoints, title, etc.
abstract class AppEnvironment {

  static late Environment _environment;
  static late String baseApiUrl;
  static late String title;

  static Environment get environment => _environment;

  static setupEnv(Environment env){
    _environment = env;
    switch (env){
      case Environment.dev:
        {
          baseApiUrl = moviedbAPIBaseURLDEV;
          title = 'CarnageF_Alpha DEV';
          break;
        }
      case Environment.sit:
        {
          baseApiUrl = moviedbAPIBaseURLSIT;
          title = 'CarnageF_Alpha SIT';
          break;
        }
      case Environment.uat:
        {
          baseApiUrl = moviedbAPIBaseURLUAT;
          title = 'CarnageF_Alpha UAT';
          break;
        }
      case Environment.prod:
        {
          baseApiUrl = moviedbAPIBaseURLPROD;
          title = 'CarnageF_Alpha PROD';
          break;
        }
    }
  }
}