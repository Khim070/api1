import 'package:api_fetch/controller/json_placeholder_controller.dart';
import 'package:api_fetch/model/users_model.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Users> listUser = [];
  getUserMethod() async {
    await jsonplaceholderController().getUserController().then((value) {
      listUser = value;
      for (var temp in listUser) {
        print(temp.name);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserMethod();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.builder(
          itemCount: listUser.length,
          itemBuilder: (context, index) {
            var user = listUser[index];
            return Card(
              elevation: 0,
              color: Colors.deepPurple[100],
              child: ListTile(
                title: Text(user.name),
                subtitle: Text(user.address.city),
              ),
            );
          },
        ));
  }
}
