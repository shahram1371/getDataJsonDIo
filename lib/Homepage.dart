// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:getdata/dio_client.dart';
import 'Users.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DioClient _client = DioClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Info'),
      ),
      body: Center(
        child: FutureBuilder<User?>(
          future: _client.getUser(id: '1'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              User? userInfo = snapshot.data;
              if (userInfo != null) {
                Data userData = userInfo.data;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(userData.avatar),
                    SizedBox(height: 8.0),
                    Text(
                      '${userInfo.data.firstName} ${userInfo.data.lastName}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      userData.email,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                );
              }
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}



// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final DioClient _client = DioClient();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("User Info"),
//       ),
//       body: Center(
//         child: FutureBuilder<User?>(
//             future: _client.getUser(id: '1'),
//             builder: (BuildContext context, AsyncSnapshot snapshot) {
//               if (snapshot.hasData) {
//                 User? userInfo = snapshot.data;
//                 Data userData = userInfo!.data;
//                 return Column(
//                   children: [
//                     Image.network(userData.avatar),
//                     const SizedBox(
//                       height: 8.0,
//                     ),
//                     Text(
//                       "${userInfo.data.firstName} ${userInfo.data.lastName}",
//                       style: TextStyle(fontSize: 16.0),
//                     ),
//                     Text(
//                       userData.email,
//                       style: TextStyle(fontSize: 16.0),
//                     ),
//                   ],
//                 );
//               }
//               return CircularProgressIndicator();
//             }),
//       ),
//     );
//   }
// }
