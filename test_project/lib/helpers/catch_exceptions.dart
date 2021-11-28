import 'package:dio/dio.dart';

class CatchExceptions {
  String? message;

  CatchExceptions({this.message});

  static CatchExceptions convertException(dynamic error) {
    if (error is DioError && error.error is CatchExceptions) {
      return error.error;
    }
    if (error is DioError) {
      print(error);
      if (error.type == DioErrorType.connectTimeout) {
        print('CONNECTION_ERROR');
        return CatchExceptions(
            message: 'Привышено время обработки запроса. Повторите позднее');
      } else if (error.type == DioErrorType.receiveTimeout) {
        print('RECIVE_ERROR');
        return CatchExceptions(
            message: 'Привышено время обработки запроса. Повторите позднее');
      } else if (error.response == null) {
        print('NO_INTERNET');
        return CatchExceptions(message: 'Нет интернет соеденения');
      } else if (error.response!.statusCode == 401) {
        print('401 - AUTH ERROR');
        return CatchExceptions(message: 'Ошибка обновления токена');
      } else if (error.response!.statusCode == 409) {
        return CatchExceptions(message: error.response!.data["message"]);
      } else {
        return CatchExceptions(message: 'Произошла системаная ошибка');
      }
    }
    if (error is CatchExceptions) {
      return error;
    } else {
      return CatchExceptions(message: 'Произошла системаная ошибка');
    }
  }
}

// import 'package:dio/dio.dart';

// class CatchExceptions {
//   String? message;

//   CatchExceptions({this.message});

//   static CatchExceptions catchError(dynamic error) {
//     if (error is DioError) {
//       if (error.type == DioErrorType.connectTimeout) {
//         return CatchExceptions(message: "Время ожидания истекло");
//       } else if (error.type == DioErrorType.response) {
//         return CatchExceptions(message: "Ошибка в системе");
//       }
//       else if(error.response!.statusCode == 404){
//         return CatchExceptions(message: "404");
//       }
//     } else {
//       return CatchExceptions(message: "Произошла системная ошибка");
//     }
//     return CatchExceptions(message: "Произошла ошибка");
//   }
// }
