enum Gender {
  M(alias: "남자"), W(alias: "여자");

  const Gender({required this.alias});

  final String alias;
}