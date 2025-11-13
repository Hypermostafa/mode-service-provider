
import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/accountmodel.dart';

class AuthService {
  static final Dio dio = Dio();

  static Future<AccountModel?> login(String email, String password) async {
    try {
      Response response = await dio.post(
        "https://elsewedyteam.runasp.net/api/Login/CheckUser",
        data: {"email": email, "password": password},
      );

      return AccountModel.fromJson(response.data);
    } on DioException catch (dioError) {
    

    } catch (otherException) {
     

      throw (otherException);
    }
  }

  static Future<AccountModel?> signup(
    String name,
    String email,
    String phone,
    String password,
  ) async {
    try {
      Response response = await dio.post(
        "https://elsewedyteam.runasp.net/api/Register/AddUser",
        data: {
          "name": name,
          "email": email,
          "phone": phone,
          "password": password,
        },
      );

      return AccountModel.fromJson(response.data);
    } on DioException catch (dioError) {
   

      if (dioError.response != null) {}
    } catch (otherException) {


      throw (otherException);
    }
  }
}
