sealed class Belt {
  final String label;

  Belt({required this.label});

  @override
  String toString();

  int get powerLevel;
}

class KuBelt extends Belt {
  final int rank;

  KuBelt({required this.rank}) : super(label: "кю");

  @override
  String toString() => "$rank $label";

  @override
  int get powerLevel => -rank;
}

class DanBelt extends Belt {
  final int rank;

  DanBelt({required this.rank}) : super(label: "дан");

  @override
  String toString() => "$rank $label";

  @override
  int get powerLevel => rank;
}

class UndefinedBelt extends Belt {
  UndefinedBelt() : super(label: "не заполнено");

  @override
  String toString() => label;

  @override
  int get powerLevel => -1000;
}
