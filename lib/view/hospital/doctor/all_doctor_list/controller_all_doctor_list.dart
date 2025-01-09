import 'dart:convert';

import 'package:dream_tech_doctor/view/hospital/doctor/all_doctor_list/model_all_doctor_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AllDoctorGetController extends GetxController {
  RxList<Doctor> doctors = <Doctor>[].obs;
  RxBool isLoading = false.obs;

  //get doctor
  Future<void> fetchDoctors() async {
    isLoading.value = true;
    final uri = Uri.parse(
        'https://doctorapp.com.softservice.site/api/auth/hospital-doctor');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('access_token');

    try {
      final response = await http.get(
        uri,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // Check if the response contains the correct data key
        if (data is List) {
          doctors.value = GatAllDoctorResponse.fromJson(data).doctors;
        } else if (data['doctors'] != null) {
          doctors.value =
              GatAllDoctorResponse.fromJson(data['doctors']).doctors;
        } else {
          Get.snackbar('Error', 'No doctors data found.');
        }

        print("all doctor response == $data");
      } else {
        Get.snackbar('Error', 'Failed to load doctor data.');
        print(response.body);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  ///active doctor
  Future<void> fetchActiveDoctors() async {
    isLoading.value = true;
    final uri = Uri.parse(
        'https://doctorapp.com.softservice.site/api/auth/hospital-doctor/active-doctor');
    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // Check if the response contains the correct data key
        if (data is List) {
          doctors.value = GatAllDoctorResponse.fromJson(data).doctors;
        } else if (data['doctors'] != null) {
          doctors.value =
              GatAllDoctorResponse.fromJson(data['doctors']).doctors;
        } else {
          Get.snackbar('Error', 'No doctors data found.');
        }

        print("all doctor response == $data");
      } else {
        Get.snackbar('Error', 'Failed to load doctor data.');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  //deactive doctor
  Future<void> fetchDeactiveDoctors() async {
    isLoading.value = true;
    final uri = Uri.parse(
        'https://doctorapp.com.softservice.site/api/auth/hospital-doctor/dactive-doctor');
    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // Check if the response contains the correct data key
        if (data is List) {
          doctors.value = GatAllDoctorResponse.fromJson(data).doctors;
        } else if (data['doctors'] != null) {
          doctors.value =
              GatAllDoctorResponse.fromJson(data['doctors']).doctors;
        } else {
          Get.snackbar('Error', 'No doctors data found.');
        }

        print("all doctor response == $data");
      } else {
        Get.snackbar('Error', 'Failed to load doctor data.');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  ///delete doctor
  Future<void> deleteDoctor(String doctorId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('access_token');

    try {
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              'https://doctorapp.com.softservice.site/api/auth/hospital-doctor/delete-doctor'));
      request.fields.addAll({
        'doctorId': doctorId,
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        // Refresh the list of doctors after deletion
        fetchDoctors();
        Get.snackbar('Success', 'Doctor deleted successfully',
            backgroundColor: Colors.green, colorText: Colors.white);
      } else {
        print(response.reasonPhrase);
        Get.snackbar('Error', 'Failed to delete doctor',
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      print(e.toString());
      Get.snackbar('Error', 'Something went wrong');
    }
  }
}
