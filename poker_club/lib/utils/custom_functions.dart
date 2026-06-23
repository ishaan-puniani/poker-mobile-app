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
  return useAbbreviation ? abbreviateNumber(formattedCoins) : formattedCoins;
}

String abbreviateNumber(String number) {
  final numValue = double.tryParse(number.replaceAll(',', '')) ?? 0;
  if (numValue >= 1e9) {
    return '${(numValue / 1e9).toStringAsFixed(1)}B';
  } else if (numValue >= 1e6) {
    return '${(numValue / 1e6).toStringAsFixed(1)}M';
  } else if (numValue >= 1e3) {
    return '${(numValue / 1e3).toStringAsFixed(1)}K';
  } else {
    return number;
  }
}
