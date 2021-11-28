import 'package:dio/dio.dart';
import 'package:test_project/helpers/api_requester.dart';
import 'package:test_project/helpers/catch_exceptions.dart';
import 'package:test_project/screens/user_screen/model/user_model.dart';

class UserProvider {
  Future<List<UserModel>> getUser() async {
    try {
      ApiRequester requester = ApiRequester();
      Response response = await requester.toGet("/users");
      if (response.statusCode == 200) {
        response.data.map((val) => print(val));
        return response.data
            .map<UserModel>((val) => UserModel.fromJson(val))
            .toList();
      }
      throw CatchExceptions.convertException(response);
    } catch (e) {
      print(e);
      throw CatchExceptions.convertException(e);
    }
  }
}
