DateTime getTime([String string]) {
  if (string != null) return DateTime.parse(string);
  return DateTime.now();
}
