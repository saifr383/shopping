import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'http_exception.dart';

class Auth with ChangeNotifier {
  String? _token;
 DateTime? _expiry;
  String? _userId;
  bool get isAuth {
    return token != null;
  }

  String? get token {
    if (_expiry != null &&
        _expiry!.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  Future<void> signup(String? email, String? pass) async {
    const url =
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBtwlJqke3sGg0va5d0AMCYgt4lipElemw";
    try {
      var response = await http.post(Uri.parse(url),
          body: json.encode(
              {'email': email, 'password': pass, 'returnSecureToken': true}));
      final responsedata=json.decode(response.body);
      if(responsedata['error']!=null)
        throw HttpException(responsedata['error']['message']);
      _token = responsedata['idToken'];
      _userId = responsedata['localId'];
      _expiry = DateTime.now().add(
        Duration(
          seconds: int.parse(
            responsedata['expiresIn'],
          ),
        ),
      );
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> signin(String? email, String? pass) async {
    const url =
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBtwlJqke3sGg0va5d0AMCYgt4lipElemw";
    try{
      var response = await http.post(Uri.parse(url),
          body: json.encode(
              {'email': email, 'password': pass, 'returnSecureToken': true}));
      final responsedata=json.decode(response.body);
      if(responsedata['error']!=null)
        throw HttpException(responsedata['error']['message']);
      _token = responsedata['idToken'];
      _userId = responsedata['localId'];
      _expiry = DateTime.now().add(
        Duration(
          seconds: int.parse(
            responsedata['expiresIn'],
          ),
        ),
      );
      notifyListeners();
    }catch(error){
      throw(error);
    }

  }
}
