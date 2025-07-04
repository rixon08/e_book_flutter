import 'package:e_book_flutter/features/e_book/presentation/widgets/shimmer_item.dart';
import 'package:flutter/cupertino.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, pos) => ShimmerItem());
  }
}