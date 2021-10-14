import 'package:dio/dio.dart';
import 'Users.dart';

class DioClient {
  final Dio _dio = Dio();
  final _baseUrl = "https://reqres.in/api";

  Future<User?> getUser({required String id}) async {
    User? user;
    try {
      Response userData = await _dio.get(_baseUrl + '/users/$id');

      print('User Info: ${userData.data}');
      user = User.fromJson(userData.data);
      // print('User Info: ${user.data}');
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        print('Error sending request!');
        print(e.message);
      }
    }

    return user;
  }
}



// child: ListView.builder(
//               itemCount: null == _users ? 0 : _users!.length,
//               itemBuilder: (BuildContext context, index) {
//                 User user = _users![index];
//                 return ListTile(
//                   title: Text(user.name),
//                   subtitle: Text(user.email),
//                 );
//               }),