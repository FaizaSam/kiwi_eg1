import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:kiwi_eg2/WelcomeScreen.dart';

import 'test01.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // void initState() {
  //   super.initState();
  //   Di.setup();
  // }

  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                  labelText: 'UserName', icon: Icon(Icons.person)),
            ),
            TextFormField(
              obscureText: true,
              controller: _passwordController,
              decoration: const InputDecoration(
                  labelText: 'Password', icon: Icon(Icons.password)),
            ),
            ElevatedButton(
                onPressed: () {
                  //KiwiContainer().resolve<Counter>('display').value.toString()
                  KiwiContainer().resolve<Login>().userName =
                      _nameController.text;
                  KiwiContainer().resolve<Login>().password =
                      _passwordController.text;
                  print(KiwiContainer().resolve<Login>().userName);
                  print(KiwiContainer().resolve<Login>().password);

                  if (KiwiContainer().resolve<Login>().check()) {
                    print('Submitted Successfully');
                  } else {
                    print('Try Again');
                  }
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => WelcomeScreen()));
                  //KiwiContainer().clear();
                  clearText();
                },
                child: Text('Submit'))
          ],
        ),
      ),
    );
  }

  void clearText() {
    _nameController.clear();
    _passwordController.clear();
  }
}
