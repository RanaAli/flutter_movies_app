extension StringExtension<String> on String {
  orEmpty() {
    return this ?? "";
  }
}
