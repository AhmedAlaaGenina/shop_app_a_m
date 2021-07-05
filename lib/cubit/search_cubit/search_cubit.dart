import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app_a_m/data/remote/dio_helper.dart';
import 'package:shop_app_a_m/model/search_model.dart';
import 'package:shop_app_a_m/shared/constants/constants.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? searchModel;

  void search({required String text}) {
    emit(SearchLoadingState());
    DioHelper.postData(
      url: SEARCH,
      token: token,
      data: {
        'text': text,
      },
    ).then((value) {
      searchModel = SearchModel.fromJson(value.data);
      print(searchModel!.status);
      emit(SearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SearchFailedState(error));
    });
  }
}
