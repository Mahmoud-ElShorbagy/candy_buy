import 'package:candy_buy/models/candy_variables.dart';
import 'package:flutter/widgets.dart';
import '../candy_bar/view.dart';

class ScrollableCandyListView extends StatelessWidget {
  const ScrollableCandyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(
              candy.length,
              (index) => CandyBarView(
                    image: candy[index].imagesUrl,
                    width: candy[index].width,
                    height: candy[index].height,
                    index: index,
                  ))),
    );
  }
}
