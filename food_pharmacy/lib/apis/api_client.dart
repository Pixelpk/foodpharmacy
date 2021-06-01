import 'dart:developer';
import 'dart:io';

import 'package:foodpharmacy/components/pref_manager.dart';
import 'package:foodpharmacy/models/coaching/diet_plan.dart';
import 'package:foodpharmacy/models/coaching/health_history.dart';
import 'package:foodpharmacy/models/coaching/payment_status.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../models/coaching/deposit_slip.dart';
import '../models/registration/login.dart';
import '../models/registration/sign_up.dart';

class ApiClient {
  ApiClient._();

  static final ApiClient apiClient = ApiClient._();
  var client = http.Client();

  String token;
  String userId;

  Future<void> getCredentials() async {
    token = await PrefManager.getToken();
    userId = await PrefManager.getUserId();
  }

  Future<SignUp> signUpApi(SignUp signUp) async {
    try {
      // print('${signUp.name} ${signUp.email} ${signUp.password} ${signUp.phone} ${signUp.city}');

      var url = Uri.parse('https://thefoodpharmacy.pk/api/auth/register');
      var response = await client.post(url, body: signUp.toJson());
      print('Sign Up: ' + response.body);
      if (response.body != null) {
        Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
        signUp = SignUp.fromJson(jsonResponse);
        return signUp;
      }
      return null;
    } on SocketException {
      return Future.error('Check your internet connection');
    } on http.ClientException {
      return Future.error('Check your internet connection');
    } catch (e) {
      print(e.toString());
      return Future.error('Server error');
    }
  }

  Future<Login> loginApi(Login login) async {
    try {
      // print('${login.email} ${login.password}');

      var url = Uri.parse('https://thefoodpharmacy.pk/api/auth/login');
      var response = await client.post(url, body: login.toJson());
      // print('Login: ' + response.body);
      if (response.body != null) {
        Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
        login = Login.fromJson(jsonResponse);
        return login;
      }
      return null;
    } on SocketException {
      return Future.error('Check your internet connection');
    } on http.ClientException {
      return Future.error('Check your internet connection');
    } catch (e) {
      print(e.toString());
      return Future.error('Server error');
    }
  }

  Future<DepositSlip> depositSlipApi(
      DepositSlip depositSlip, String token) async {
    print(token);
    try {
      // print(
      //     '${depositSlip.email} ${depositSlip.name} ${depositSlip.amount} ${depositSlip.package} ${depositSlip.userId} ${depositSlip.paymentSlip}');
      var url = Uri.parse('https://thefoodpharmacy.pk/api/auth/bank_slip');
      var response = await client.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: depositSlip.toJson(),
      );
      print('Deposit Slip: ' + response.body);
      print(response.statusCode);
      if (response.body != null) {
        Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
        depositSlip = DepositSlip.fromJson(jsonResponse);
        return depositSlip;
      }
      return null;
    } on SocketException {
      return Future.error('Check your internet connection');
    } on http.ClientException {
      return Future.error('Check your internet connection');
    } catch (e) {
      print(e.toString());
      return Future.error('Server error');
    }
  }

  Future<HealthHistory> healthHistoryApi(
      HealthHistory healthHistory, String token) async {
    // print(token);
    try {
      var url = Uri.parse('https://thefoodpharmacy.pk/api/auth/history');
      var response = await client.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: healthHistory.toJson(),
      );
      print('Health History: ' + response.body);
      if (response.body != null) {
        Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
        healthHistory = HealthHistory.fromJson(jsonResponse);
        return healthHistory;
      }
      return null;
    } on SocketException {
      return Future.error('Check your internet connection');
    } on http.ClientException {
      return Future.error('Check your internet connection');
    } catch (e) {
      print(e.toString());
      return Future.error('Server error');
    }
  }

  Future<DietPlan> dietPlanApi() async {
    await getCredentials();
    // print(userId);
    try {
      var url = Uri.parse('https://thefoodpharmacy.pk/api/auth/diet/$userId');
      var response = await client.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      print('Diet Plan: ' + response.body);
      if (response.body != null) {
        Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
        return DietPlan.fromJson(jsonResponse);
      }
      return null;
    } on SocketException {
      return Future.error('Check your internet connection');
    } on http.ClientException {
      return Future.error('Check your internet connection');
    } catch (e) {
      print(e.toString());
      return Future.error('Server error');
    }
  }

  Future<PaymentStatus> paymentStatusApi() async {
    await getCredentials();
    // print(userId);
    userId = '10';
    try {
      var url = Uri.parse('https://thefoodpharmacy.pk/api/auth/status/$userId');
      var response = await client.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      print('Payment Status: ' + response.body);
      if (response.body != null) {
        Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
        return PaymentStatus.fromJson(jsonResponse);
      }
      return null;
    } on SocketException {
      return Future.error('Check your internet connection');
    } on http.ClientException {
      return Future.error('Check your internet connection');
    } catch (e) {
      print(e.toString());
      return Future.error('Server error');
    }
  }
}
