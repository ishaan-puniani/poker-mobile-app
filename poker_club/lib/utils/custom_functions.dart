String formatCoins(double coins) {
  // Show 2 decimals only when there's a fractional part; otherwise show
  // a whole number (e.g. 20.99 -> "20.99", 20.00 -> "20").
  final hasFraction = coins % 1 != 0;
  return coins
      .toStringAsFixed(hasFraction ? 2 : 0)
      .replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match m) => '${m[1]},',
      );
}
