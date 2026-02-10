abstract class Validator<T> {
  final String fieldName;

  const Validator({required this.fieldName});

  String? validate(T value);
}
