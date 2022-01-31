import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:kiwi_eg2/test01.dart';

class WelcomeScreen extends StatelessWidget {
  //const WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text('Welcome'),

            Text('Welcome ${KiwiContainer().resolve<Login>().userName}'),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  print(KiwiContainer().resolve<Login>().userName);
                  KiwiContainer().clear();
                },
                child: Text('LogOut'))
          ],
        ),
      ),
    );
  }
}
