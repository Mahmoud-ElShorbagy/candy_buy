import 'package:candy_buy/views/view_candy/search/app_search_delegate.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_textform.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 280,
      margin: const EdgeInsets.only(
        top: 16,
      ),
      child: CustomTextField(
          enabled: false,
          onSearchPressed: () {
            showSearch(context: context, delegate: AppSearchDelegate());
          },
          width: 32,
          height: 32,
          hint: "Search Doki Doki",
          image: "assets/images/icons/search.png"),
    );
  }
}
