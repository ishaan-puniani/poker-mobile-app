String formatCoins(double coins, [bool useAbbreviation = false]) {
  // Show 2 decimals only when there's a fractional part; otherwise show
  // a whole number (e.g. 20.99 -> "20.99", 20.00 -> "20").
  final hasFraction = coins % 1 != 0;
  final formattedCoins = coins
      .toStringAsFixed(hasFraction ? 2 : 0)
      .replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match m) => '${m[1]},',
      );
  print("Formatted coins: $formattedCoins");
  return useAbbreviation ? abbreviateNumber(formattedCoins) : formattedCoins;
}

String abbreviateNumber(String number) {
  final numValue = double.tryParse(number.replaceAll(',', '')) ?? 0;
  // 1000 -> 1K, 1000000 -> 1M, 1000000000 -> 1B
  // 1500 -> 1.5K, 1500000 -> 1.5M, 1500000000 -> 1.5B
  // Error: for 1000 it returns 1.0K instead of 1K, so we need to handle that case separately.
  const double thousand = 1000;
  const double million = 1000000;
  const double billion = 1000000000;
  const double trillion = 1000000000000;

  switch (numValue) {
    case >= trillion:
      if (numValue % trillion == 0) {
        return '${(numValue / trillion).toStringAsFixed(0)}T';
      }
      return '${(numValue / trillion).toStringAsFixed(1)}T';
    case >= billion:
      if (numValue % billion == 0) {
        return '${(numValue / billion).toStringAsFixed(0)}B';
      }
      return '${(numValue / billion).toStringAsFixed(1)}B';
    case >= million:
      if (numValue % million == 0) {
        return '${(numValue / million).toStringAsFixed(0)}M';
      }
      return '${(numValue / million).toStringAsFixed(1)}M';
    case >= thousand:
      if (numValue % thousand == 0) {
        return '${(numValue / thousand).toStringAsFixed(0)}K';
      }
      return '${(numValue / thousand).toStringAsFixed(1)}K';
    default:
      return numValue.toStringAsFixed(0);
  }
}
