const passwordRules =
    '※パスワードは少なくとも8文字以上である必要があります。\n ※大文字、小文字、数字、および特殊文字を含めてください。例: !@#\$%^&*()';

const genderList = <String>[
  '男性',
  '女性',
  'その他',
  '回答しない',
];

enum OnBoardingSteps {
  introductionFeatures(
    title: '機能紹介',
    description: 'My Faveの基本機能を紹介するよ！',
  ),
  addFavorites(
    title: '推しを追加',
    description: 'カバーになる写真だから一番良い写真を選んであげよう！',
  ),
  registerInformation(
    title: '情報入力',
    description: 'あなたが持っている必要な情報を入力しよう！',
  );

  const OnBoardingSteps({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;
}
