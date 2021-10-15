// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:getdata/dio_client.dart';
import 'Shoes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DioClient _client = DioClient();
  List<Shoes>? list;
  // // late bool _loading;
  @override
  void initState() {
    super.initState();

    DioClient().getData().then((shoes) {
      setState(() {
        list = shoes;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shoes'),
      ),
      body: Center(
        child: FutureBuilder<List<Shoes>?>(
            future: _client.getData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                List<Shoes>? list = snapshot.data;
                return ListView.builder(
                    itemCount: list!.length,
                    itemBuilder: (BuildContext context, index) {
                      Shoes shoes = list[index];
                      return Column(
                        children: [
                          Image.network(shoes.imageUrl),
                          Text(shoes.productName),
                        ],
                      );
                    });
              }
            }),
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



// child: FutureBuilder<List<User>?>(
//           future: _client.getUser(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               List<User>? userInfo = snapshot.data;
//               if (userInfo != null) {
//                 // Data userData = userInfo.data;
//                 return ListView.builder(
//                     itemCount: null == userInfo ? 0 : userInfo.length,
//                     itemBuilder: (BuildContext context, index) {
//                       User user = userInfo[index];
//                       return ListTile(
//                         title: Text(user),
//                   subtitle: Text(user.email),
//                       )
//                     });
//               }
//             }
//             return CircularProgressIndicator();
//           },
//         ),