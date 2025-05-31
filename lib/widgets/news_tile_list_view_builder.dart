import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/news_tile_list_view.dart';

class NewsTileListViewBuilder extends StatefulWidget {
  const NewsTileListViewBuilder({
    super.key,
    required String category,
  });

  @override
  State<NewsTileListViewBuilder> createState() =>
      _NewsTileListViewBuilderState();
}

bool isLoading = true;

class _NewsTileListViewBuilderState extends State<NewsTileListViewBuilder> {
  List<ArticleModel> articles = [];
  @override
  void initState() {
    super.initState();
    getGeneralNews();
  }

  Future<void> getGeneralNews() async {
    articles = await NewsService(Dio(), 'general').getNews();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : NewsTileListView(
            category: 'general',
            articles: articles,
          );
  }
}


// class NewsTileListViewBuilder extends StatelessWidget {
//   const NewsTileListViewBuilder({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return NewsTileListView();
//   }
// }





// isLoading
//         ? const SliverFillRemaining(
//             hasScrollBody: false,
//             child: Center(
//               child: CircularProgressIndicator(),
//             ),
//           )
//         : 
