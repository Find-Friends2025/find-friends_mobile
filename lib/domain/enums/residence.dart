enum Residence {
  SEOUL(alias: "서울특별시"),
  GYEONGI(alias: "경기도"),
  PUSAN(alias: "부산광역시"),
  DAEGU(alias: "대구광역시"),
  INCHEON(alias: "인천광역시"),
  GWANGJU(alias: "광주광역시"),
  DAEJEON(alias: "대전광역시"),
  ULSAN(alias: "울산광역시"),
  SEJONG(alias: "세종특별자치시"),
  GANGWON(alias: "강원특별자치도"),
  NORTHCC(alias: "충청북도"),
  SOUTHCC(alias: "충청남도"),
  NORTHJB(alias: "전라북도"),
  SOUTHJB(alias: "전라남도"),
  NORTHKB(alias: "경상북도"),
  SOUTHKB(alias: "경상남도"),
  JEJU(alias: "제주특별자치도");

  const Residence({required this.alias});
  final String alias;

}