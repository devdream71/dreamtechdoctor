import 'package:dream_tech_doctor/view/hospital/doctor/doctor_details_view/model_doctor_details_view.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


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
         //isDoctorActive.value = doctor.value?.isActive ?? false;
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

   void toggleDoctorStatus() {
    isDoctorActive.value = !isDoctorActive.value;
    // You can add logic to update the status in the database or API as needed
  }
  
}
