enum LevelAlgorithm {
  addMarker(point: 10),
  addActivity(point: 3),
  noActivitiesForAWeek(point: -10),
  deleteMarker(point: -10);

  const LevelAlgorithm({
    required this.point,
  });

  final int point;
}

enum LevelStage {
  level0(level: 0, point: 0),
  level1(level: 1, point: 100),
  level2(level: 2, point: 300),
  level3(level: 3, point: 600),
  level4(level: 4, point: 1000),
  level5(level: 5, point: 1500);

  const LevelStage({
    required this.level,
    required this.point,
  });

  final int level;
  final int point;
}
