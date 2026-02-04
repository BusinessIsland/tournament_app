enum WeightCategory {
  u10(label: "10 кг", maxWeight: 10),
  u15(label: "15 кг", maxWeight: 15),
  u20(label: "20 кг", maxWeight: 20),
  u25(label: "25 кг", maxWeight: 25),
  u25g(label: "25+ кг", minWeight: 25, isOpen: true),

  u30(label: "30 кг", maxWeight: 30),
  u35(label: "35 кг", maxWeight: 35),
  u40(label: "40 кг", maxWeight: 40),
  u45(label: "45 кг", maxWeight: 45),
  u45g(label: "45+ кг", minWeight: 45, isOpen: true),
  u50(label: "50 кг", maxWeight: 50),
  u55(label: "55 кг", maxWeight: 55),
  u55g(label: "55+ кг", minWeight: 55, isOpen: true),

  u60(label: "60 кг", maxWeight: 60),
  u60g(label: "60+ кг", minWeight: 60, isOpen: true),
  u65(label: "65 кг", maxWeight: 65),
  u65g(label: "65+ кг", minWeight: 65, isOpen: true),

  u70(label: "70 кг", maxWeight: 70),
  u75(label: "75 кг", maxWeight: 75),
  u75g(label: "75+ кг", minWeight: 75, isOpen: true),
  u80(label: "80 кг", maxWeight: 80),
  u80g(label: "80+ кг", minWeight: 80, isOpen: true),
  u90(label: "90 кг", maxWeight: 90),
  u90g(label: "90+ кг", minWeight: 90, isOpen: true),
  absolute(label: "абсолютная", isOpen: true);

  final String label;
  final double? maxWeight;
  final double? minWeight;
  final bool isOpen;

  const WeightCategory({required this.label, this.maxWeight, this.minWeight, this.isOpen = false});
}
