import 'package:email_validator/email_validator.dart';

class Validator {
  Validator._();

  /// 認証情報で扱う、emailのバリデーション
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'メールアドレスを入力してください';
    }
    if (!EmailValidator.validate(value)) {
      return 'メールアドレスの形式が正しくありません';
    }
    return null;
  }

  // /// 認証情報で扱う、passwordのバリデーション
  // static String? password(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'パスワードを入力してください';
  //   }
  //   // パスワードが8文字以上であることを確認
  //   if (value.length < 8) {
  //     return 'パスワードは少なくとも8文字以上である必要があります。';
  //   }

  //   // 大文字、小文字、数字、特殊文字が含まれているか確認
  //   if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).+$')
  //       .hasMatch(value)) {
  //     return '大文字、小文字、数字、特殊文字を含めてください。例: !@#\$%^&*()';
  //   }

  //   return null; // バリデーション成功
  // }

  /// 認証情報で扱う、passwordのバリデーション
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'パスワードを入力してください';
    }

    // パスワードが8文字以上であることを確認
    if (value.length < 8) {
      return 'パスワードは少なくとも8文字以上である必要があります';
    }

    // 大文字、小文字、数字、特殊文字が含まれているか確認
    // if (!RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).*$').hasMatch(value)) {
    if (!RegExp(r'^(?=.*[0-9])(?=.*[a-zA-Z]).*$').hasMatch(value)) {
      return 'パスワードは半角英数字を組み合わせてください';
    }

    return null; // バリデーション成功
  }

  /// 認証情報で扱う、確認用のpasswordのバリデーション
  static String? passwordConfirmation(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'パスワードを入力してください';
    } else if (value != password) {
      return 'パスワードが一致しません';
    }
    return null;
  }

  /// 通常情報入力時のバリデーション
  static String? common(String? value) {
    if (value == null || value.isEmpty) {
      return '情報を入力してください';
    }
    return null;
  }

  /// URL情報入力時のバリデーション
  static String? url(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    if (!Uri.tryParse(value)!.hasAbsolutePath) {
      return 'URLの形式が正しくありません';
    }
    return null;
  }
}
