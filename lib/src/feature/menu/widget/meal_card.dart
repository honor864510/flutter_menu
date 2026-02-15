import 'package:flutter/material.dart';
import 'package:flutter_menu/src/common/constant/assets.gen.dart';

class MealCard extends StatelessWidget {
  const MealCard({super.key});

  @override
  Widget build(BuildContext context) => Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: Column(
      mainAxisAlignment: .spaceBetween,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Assets.images.food1.image(width: .infinity, fit: .cover),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            spacing: 8,
            crossAxisAlignment: .start,
            mainAxisAlignment: .spaceAround,
            children: [
              Text(
                'Название супер боюда',
                style: TextTheme.of(context).titleLarge?.copyWith(fontWeight: .bold),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text('100 TMT', style: TextTheme.of(context).labelLarge?.copyWith(fontWeight: .bold)),
                  IconButton.filledTonal(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    style: IconButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
