const passwordRules = <String>[
  '※パスワードは少なくとも8文字以上である必要があります。',
  '※半角英数字を組み合わせてください。',
  '※推奨: 大文字英字、特殊文字を使うと、セキュリティが向上します',
];

const genderList = <String>[
  '男性',
  '女性',
  'その他',
  '回答しない',
];

enum OnBoardingSteps {
  // introductionFeatures(
  //   title: '機能紹介',
  //   description: 'My Faveの基本機能を紹介するよ！',
  // ),
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
