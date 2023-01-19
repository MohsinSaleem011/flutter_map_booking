import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  Rx<TextEditingController> phncontroller = TextEditingController().obs;
  RxString? user_id = ''.obs;
  RxString name = ''.obs;
  RxString username = ''.obs;
  RxString phonenumber = ''.obs;
  RxString email = ''.obs;
  RxString since = ''.obs;
  RxString dob = ''.obs;
  RxString picture = ''.obs;
}
