import "package:flutter/foundation.dart";
import "package:flutter/widgets.dart";

class AuthVm extends ChangeNotifier {
  bool loginEye = true;
  bool registerEye = true;

    final fromKey = GlobalKey<FormState>();


  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController registerNameController = TextEditingController();

  void singInBUtton() {
    if (fromKey.currentState!.validate()) {
      notifyListeners();
    }else{
      
    }
  }

  void singInEyeFunction() {
    {
      registerEye = !registerEye;
      notifyListeners();
    }
  }

  void loginEyeFunction() {
    {
      loginEye = !loginEye;
      notifyListeners();
    }
  }
}
