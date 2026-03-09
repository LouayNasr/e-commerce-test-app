class Rating {
  final double rate;
  final int count;

  const Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.empty() {
    return const Rating(rate: 0, count: 0);
  }
}