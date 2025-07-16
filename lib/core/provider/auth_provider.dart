import 'package:flutter/material.dart';
import 'package:luwe/core/repository/auth_repository.dart';
import 'package:luwe/core/storage/storage_manager.dart';
import 'package:luwe/core/utils/log_helper.dart';
import 'package:luwe/core/utils/navigation.dart';
import 'package:luwe/ui/view/dashboard.dart';

class AuthProvider extends ChangeNotifier {
  Future login(Map<String, dynamic> request) async {
    // DialogHelper.initDialog(const DialogLoading());
    var data = await AuthRepository.login(request);
    // Log("data => $data");
    if (data != null) {
      // Log("data => $data");
      StorageManager.store(data['token']);
      // await StorageManager.getUser();
      // Log("token => ${data['token']}");
      Navigation().goRemove(const Dashboard());
    }
    // Future logout() async {
    //   DialogHelper.initDialog(const DialogLoading());
    //   var data = await AuthRepository.logout();
    //   if (data != null) {
    //     // print(data['message']);
    //     StorageManager.destroy();
    //     Navigation().goRemove(const Login());
    //   } else {
    //     Navigation().goBack();
    //     StorageManager.destroy();
    //     Navigation().goRemove(const Login());
    //   }
    // }
  }
}
