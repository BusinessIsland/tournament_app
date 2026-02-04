enum WeightCategory {
  u10("10 кг", maxWeight: 10),
  u15("15 кг", maxWeight: 15),
  u20("20 кг", maxWeight: 20),
  u25("25 кг", maxWeight: 25),
  u25g("25+ кг", minWeight: 25, isOpen: true),

  u30("30 кг", maxWeight: 30),
  u35("35 кг", maxWeight: 35),
  u40("40 кг", maxWeight: 40),
  u45("45 кг", maxWeight: 45),
  u45g("45+ кг", minWeight: 45, isOpen: true),
  u50("50 кг", maxWeight: 50),
  u55("55 кг", maxWeight: 55),
  u55g("55+ кг", minWeight: 55, isOpen: true),

  u60("60 кг", maxWeight: 60),
  u60g("60+ кг", minWeight: 60, isOpen: true),
  u65("65 кг", maxWeight: 65),
  u65g("65+ кг", minWeight: 65, isOpen: true),

  u70("70 кг", maxWeight: 70),
  u75("75 кг", maxWeight: 75),
  u75g("75+ кг", minWeight: 75, isOpen: true),
  u80("80 кг", maxWeight: 80),
  u80g("80+ кг", minWeight: 80, isOpen: true),
  u90("90 кг", maxWeight: 90),
  u90g("90+ кг", minWeight: 90, isOpen: true),
  absolute("абсолютная", isOpen: true);

  final String label;
  final double? maxWeight;
  final double? minWeight;
  final bool isOpen;

  const WeightCategory(this.label, {this.maxWeight, this.minWeight, this.isOpen = false});
}
