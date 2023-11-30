import 'package:email_validator/email_validator.dart';

class Validator {
  Validator._();

  /// 認証情報で扱う、emailのバリデーション
  static bool? email(String value) {
    if (!EmailValidator.validate(value)) {
      return false;
    }
    return true;
  }
}
