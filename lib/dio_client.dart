import 'package:dio/dio.dart';
import 'Shoes.dart';

class DioClient {
  final Dio _dio = Dio();
  final String url = "http://welearnacademy.ir/flutter/products_list.json";

  Future<List<Shoes>?> getData() async {
    List<Shoes>? shoelist = [];
    try {
      Response response = await Dio().get(url);
      if (response.statusCode == 200) {
        for (var item in response.data) {
          shoelist.add(Shoes.fromJson(item));
        }
        return shoelist;
      }
    } on DioError catch (e) {
      print(e);
    }

    return shoelist;
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


// class Services {
//   static const String url = "https://jsonplaceholder.typicode.com/users";
//   static Future<List<User>?> getUsers() async {
//     Response response;
//     List<User>? users = [];
//     try {
//       response = await Dio().get(url);
//       users = userFromJson(response.data);
//     } catch (e) {
//       print(e);
//     }
//     return users;
//   }
// }
