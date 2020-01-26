import 'package:flutter/cupertino.dart';
import 'package:minnehack_app/data/categories.dart';

import 'category_card.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.44,
        crossAxisSpacing: 10,
        mainAxisSpacing: 12,
      ),
      padding: EdgeInsets.only(left: 28, right: 28, bottom: 58),
      itemCount: categories.length,
      itemBuilder: (context, index) => CategoryCard(
        categories[index],
        onPress: () => Navigator.of(context).pushNamed("/list"),
      ),
    );
  }
}
