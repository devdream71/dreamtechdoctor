

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../doctor_details_view/model_doctor_details_view.dart';


class DoctorDetailsViewController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<Doctor?> doctor = Rx<Doctor?>(null);

  RxBool isDoctorActive = true.obs;

  Future<void> fetchDoctorDetails(int doctorId) async {
    isLoading.value = true;
    final uri = Uri.parse('https://doctorapp.com.softservice.site/api/auth/hospital-doctor/doctor-view/$doctorId');
    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        doctor.value = DoctorDetailsResponse.fromJson(data).doctor;
        print(data);
        
      } else {
        Get.snackbar('Error', 'Failed to load doctor details.');
        print(response.body);
      }
    } catch (e) {
      Get.snackbar('Error', 'Error occurred: $e');
      print(e);
    } finally {
      isLoading.value = false;
    } 
  }


  ///=============>update doctor.
  
  
}
