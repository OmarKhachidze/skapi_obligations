extension UppercaseFontExtension on String {
  String toGeorgianUpperCase() {
    const offset = 0x1C90 - 0x10D0;
    return String.fromCharCodes(
      runes.map((r) {
        if (r >= 0x10D0 && r <= 0x10F6) {
          return r + offset;
        }
        return r;
      }),
    );
  }
}
