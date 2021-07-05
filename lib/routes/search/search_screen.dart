import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_a_m/cubit/search_cubit/search_cubit.dart';
import 'package:shop_app_a_m/shared/widgets/widgets.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var searchCubit = SearchCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: BuildTextFormField(
                    controller: searchController,
                    type: TextInputType.text,
                    onChange: (value) {
                      searchCubit.search(text: value);
                    },
                    onSubmit: (value) {
                      searchCubit.search(text: value);
                    },
                    validate: (value) {
                      if (value!.isEmpty) {
                        return '';
                      }
                      return null;
                    },
                    label: 'Search',
                    prefix: Icons.search,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                if (state is SearchLoadingState) LinearProgressIndicator(),
                SizedBox(
                  height: 10,
                ),
                state is SearchSuccessState
                    ? Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) =>
                              BuildProductsFavorites(
                            isSearch: true,
                            data: searchCubit.searchModel!.data!.data![index],
                          ),
                          separatorBuilder: (context, index) => Divider(),
                          itemCount:
                              searchCubit.searchModel!.data!.data!.length,
                        ),
                      )
                    : Container()
              ],
            ),
          );
        },
      ),
    );
  }
}
