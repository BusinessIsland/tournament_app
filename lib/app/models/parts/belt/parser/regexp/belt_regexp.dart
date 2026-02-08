sealed class BeltRegexp {}

class KuBeltRegexp extends BeltRegexp {
  static final kuBelt = RegExp(
    r"^(?<rank>10|[1-9])\s+(?<label>кю)$",
    caseSensitive: false,
  );
}

class DanBeltRegexp extends BeltRegexp {
  static final danBelt = RegExp(
    r"^(?<rank>10|[1-9])\s+(?<label>дан)$",
    caseSensitive: false,
  );
}
