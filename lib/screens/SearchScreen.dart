import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:mshop/const/utils.dart';
import 'package:mshop/models/search_model.dart';
import 'package:mshop/provider/category_provider.dart';
import 'package:mshop/widgets/empty_category.dart';
import 'package:mshop/widgets/search_category_widget.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _searchTextController;
  late final FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    _searchTextController = TextEditingController();
    focusNode = FocusNode();
  }

  List<SearchModel>? searchList = [];
  bool isSearching = false;

  @override
  void dispose() {

    if(mounted){
      _searchTextController.dispose();
      focusNode.dispose();
    }
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    final searchProvider = Provider.of<CategoryProvider>(context);

    return  SafeArea(
      child: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
            body: Column(
              children :[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          focusNode.unfocus();
                          Navigator.pop(context);
                        },
                        child: const Icon(IconlyLight.arrowLeft2),
                      ),
                      Flexible(
                        child:  TextField(
                          focusNode: focusNode,
                          controller: _searchTextController,
                          style: TextStyle(
                            color: color,
                          ),
                          autofocus: true,
                          textInputAction: TextInputAction.search,
                          keyboardType: TextInputType.text,
                          onEditingComplete: () async{
                            searchList =  await searchProvider.searchItems(query: _searchTextController.text);
                            isSearching = true;
                            focusNode.unfocus();
                            setState(() {

                            });
                          },
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                bottom: 8 / 5,
                              ),
                              hintText: "Search",
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              suffix: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: GestureDetector(
                                  onTap: (){
                                    _searchTextController.clear();
                                    focusNode.unfocus();
                                    isSearching = false;
                                    searchList!.clear();
                                    setState(() {

                                    });
                                  },
                                  child:const Icon(
                                    Icons.close,
                                    size: 18,
                                    color: Colors.red,
                                  ),
                                ),
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10,),


                if(isSearching && searchList!.isEmpty)
                  const Expanded(
                    child: EmptyCategoryWidget(
                      text: "Oops! No Result",
                      imagePath: "assets/images/search.png",
                    ),
                  ),
                if(_searchTextController.text.isNotEmpty  && searchList!.isNotEmpty)
                  FutureBuilder<List<SearchModel>>(
                      future:searchProvider.searchItems(query: _searchTextController.text) ,
                      builder:  (context, snapshot){

                        if(snapshot.connectionState == ConnectionState.waiting) {
                          return const Expanded(child: Center(child:  CircularProgressIndicator()));
                        }
                        if(snapshot.hasError){
                          return Expanded(
                              child: EmptyCategoryWidget(
                                text: "an error occured ${snapshot.error}",
                                imagePath: "assets/images/no_data.png",
                              ));
                        }else if(snapshot.data == null){
                          return const Expanded(
                              child: EmptyCategoryWidget(
                                text: "No data found",
                                imagePath: "assets/images/no_data.png",
                              ));
                        }


                        return Expanded(
                          child: GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 3.0,
                            mainAxisSpacing:3.0,
                            shrinkWrap: true,
                            children: List.generate(snapshot.data!.length, (index) {
                              return ChangeNotifierProvider.value(
                                value : snapshot.data![index],
                                child: const SearchCategoryWidget(),
                              );
                            },),
                          ),
                        );
                      }),
              ],
            )
        ),
      ),
    );
  }
}