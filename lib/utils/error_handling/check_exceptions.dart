import 'package:dio/dio.dart';
import 'package:instagram_clone/utils/error_handling/app_exception.dart';
import 'package:instagram_clone/utils/resources/data_state.dart';

class CheckExceptions {
  static dynamic response(Response response) {
    switch (response.statusCode) {
      case 200:
        return response;
      case 400:
        throw BadRequestException(response: response);
      case 401:
        throw UnauthorizedException();
      case 404:
        throw NotFoundException();
      case 500:
        throw ServerException();
      default:
        throw FetchDataException(
            message: '${response.statusCode} fetch exception');
    }
  }

  static dynamic getError(AppException appException) async {
    switch (appException.runtimeType) {
      case BadRequestException:
        return DataFailed(appException.message);
      case ServerException:
        return DataFailed(appException.message);
      case NotFoundException:
        return DataFailed(appException.message);
      case UnauthorizedException:
        return DataFailed(appException.message);
      case FetchDataException:
        return DataFailed(appException.message);
    }
  }
}
