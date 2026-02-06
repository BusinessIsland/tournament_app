sealed class Belt {
  final String label;

  Belt({required this.label});

  String get stringify;
  int get powerLevel;
}

class KuBelt extends Belt {
  final int rank;

  KuBelt({required this.rank}) : super(label: "кю");

  @override
  String get stringify {
    return "$rank $label";
  }

  @override
  int get powerLevel {
    return -rank;
  }
}

class DanBelt extends Belt {
  final int rank;

  DanBelt({required this.rank}) : super(label: "дан");

  @override
  String get stringify {
    return "$rank $label";
  }

  @override
  int get powerLevel {
    return rank;
  }
}

class UndefinedBelt extends Belt {
  UndefinedBelt() : super(label: "не заполнено");

  @override
  String get stringify {
    return label;
  }

  @override
  int get powerLevel {
    return -1000;
  }
}
