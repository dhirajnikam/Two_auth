import 'package:get/get.dart';
import 'package:legal/controller/auth/login.dart';
import 'package:legal/model/lawyers/lawyerDetails.dart';
import 'package:legal/model/user/userDetails.dart';
import 'package:legal/services/database.dart';
import 'package:legal/view/lawyer/Lawyerprofile.dart';
import 'package:legal/view/user/Userprofile.dart';

class RegisterController extends GetxController {
  final login = Get.put(LoginController());
  Rx<UserModel> userModel = UserModel().obs;
  Rx<LawyerModels> lawyerModel = LawyerModels().obs;

  LawyerModels get lawyer => lawyerModel.value;

  UserModel get user => userModel.value;

  set lawyer(LawyerModels value) => this.lawyerModel.value = value;
  set user(UserModel value) => this.userModel.value = value;

  void createUser() async {
    try {
      UserModel _usermodel = UserModel(
        uid: login.uid.toString(),
        name: login.name.toString(),
        email: login.email.toString(),
        img: login.Pimg.toString(),
        phoneNumber: login.phone.toString(),
      );
      if (await FirebaseDb().addUser(_usermodel)) {
        user = _usermodel;
        Get.offAll( UserProfile());
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  void createLawyer() async {
    try {
      LawyerModels _lawyermodel = LawyerModels(
        uid: login.uid.toString(),
        name: login.name.toString(),
        email: login.email.toString(),
        img: login.Pimg.toString(),
        phoneNumber: login.phone.toString(),
      );
      if (await FirebaseDb().addLawyer(_lawyermodel)) {
        lawyer = _lawyermodel;
        Get.offAll( LawyerProfile());
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  void clearUser() {
    userModel.value = UserModel();
  }

  void clearLawyer() {
    lawyerModel.value = LawyerModels();
  }
}
