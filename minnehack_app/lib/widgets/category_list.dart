import 'package:flutter/cupertino.dart';
import 'package:minnehack_app/data/categories.dart';

import 'category_card.dart';

class CategoryList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
      CustomScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
            ),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2.44,
                crossAxisSpacing: 10,
                mainAxisSpacing: 12,
              ),
              delegate: SliverChildBuilderDelegate(
                  (context, index) => CategoryCard(
                    categories[index],
                    onPress: () => Navigator.of(context).pushNamed("/list"),
                  ),
                childCount: categories.length,
              ),

            ),
          )
        ],
      );

  }
}
