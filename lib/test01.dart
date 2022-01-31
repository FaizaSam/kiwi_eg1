import 'package:kiwi/kiwi.dart';

part 'test01.g.dart';

abstract class Injector {
  @Register.factory(Test)
  @Register.factory(Login)
  @Register.singleton(Login, name: 'display')
  void configure();
}

class Test {}

class Login {
  //int _value = 0;
  String userName = 'Faiz';
  String password = 'Faiz';

  Login(Test test);

  // int get value => _value;

  // void add() => _value++;
  bool check() {
    if (userName == password) {
      return true;
    } else {
      return false;
    }
  }
}

class Di {
  static void setup() {
    var injector = _$Injector();
    injector.configure();
  }
}
