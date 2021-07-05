import 'package:shop_app_a_m/data/local/cash_helper.dart';
import 'package:shop_app_a_m/shared/enums/help_data_enum.dart';

String token = CashHelper.getData(key: HelpDataEnum.Token.toString()) ?? '';

/// Base Url For Api
const BASEURL = 'https://student.valuxapps.com/api/';

/// End Points For Login Api
const LOGIN = 'login';
const HOME = 'home';
const CATEGORIES = 'categories';
const FAVORITES = 'favorites';
const PROFILE = 'profile';
const REGISTER = 'register';
const UPDATE_PROFILE = 'update-profile';
const SEARCH = 'products/search';
