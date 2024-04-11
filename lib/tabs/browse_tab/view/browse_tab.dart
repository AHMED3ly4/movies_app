import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/shared/indicators/error_indicator.dart';
import 'package:movies_app/shared/indicators/loading_indicator.dart';
import 'package:movies_app/tabs/browse_tab/view/widgets/categories_list.dart';
import 'package:movies_app/tabs/browse_tab/view_model/browse_tab_states.dart';
import 'package:movies_app/tabs/browse_tab/view_model/browse_tab_view_model.dart';

class BrowseTab extends StatefulWidget {


  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  final viewModel =BrowseTabViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getCategories();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => viewModel,
      child: BlocBuilder<BrowseTabViewModel,BrowseTabStates>(
          builder: (context, state) {
            if(state is GetCategoriesLoading){
              return const LoadingIndicator();
            }
            else if(state is GetCategoriesSuccess){
              return SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15,),
                    Text(
                      'Browse categories',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 24
                      ),
                    ),
                    CategoriesList(categories: state.categories),
                  ],
                ),
              );
            }
            else if(state is GetCategoriesError){
              return ErrorIndicator(
                errorMessage: state.errorMessage,
              );
            }
            return const SizedBox();
          },
      ),
    );
  }
}
