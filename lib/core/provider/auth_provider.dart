import 'package:flutter/material.dart';
import 'package:luwe/core/model/user_model.dart';
import 'package:luwe/core/repository/auth_repository.dart';
import 'package:luwe/core/storage/storage_manager.dart';
import 'package:luwe/core/utils/dialog_helper.dart';
import 'package:luwe/core/utils/navigation.dart';
import 'package:luwe/ui/components/dialog/loading.dart';
import 'package:luwe/ui/view/auth/login.dart';
import 'package:luwe/ui/view/dashboard.dart';
import 'package:luwe/ui/view/onboarding.dart';

class AuthProvider extends ChangeNotifier {
  User? user;

  Future register(Map<String, dynamic> request) async {
    DialogHelper.initDialog(const DialogLoading());
    var data = await AuthRepository.register(request);
    if (data != null) {
      StorageManager.store(data['token']);
      user = User.fromJson(data['user']);
      Navigation().goRemove(const Dashboard());
    } else {
      Navigation().goBack();
    }
  }

  Future checkAuth() async {
    var token = await StorageManager.getToken();
    if (token != null) {
      var data = await AuthRepository.getProfile();
      if (data != null) {
        user = User.fromJson(data['user']);
      } else {
        StorageManager.destroy();
      }
    }
    var onBoard = await StorageManager.onBoard();
    if (onBoard) {
      Navigation().goRemove(const Onboarding());
    } else {
      Navigation().goRemove(const Dashboard());
    }
  }

  Future login(Map<String, dynamic> request) async {
    DialogHelper.initDialog(const DialogLoading());
    var data = await AuthRepository.login(request);
    if (data != null) {
      StorageManager.store(data['token']);
      user = User.fromJson(data['user']);
      Navigation().goRemove(const Dashboard());
    } else {
      Navigation().goBack();
    }
  }

  Future logout() async {
    DialogHelper.initDialog(const DialogLoading());
    var data = await AuthRepository.logout();
    if (data != null) {
      StorageManager.destroy();
      Navigation().goRemove(const Login());
    } else {
      StorageManager.destroy();
      Navigation().goRemove(const Login());
    }
  }
}
