import 'dart:convert';
import 'package:dream_tech_doctor/view/hospital/doctor/doctor_create/model_doctor_create.dart';
import 'package:dream_tech_doctor/view/hospital/hospital_bottom_nav.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DoctorController extends GetxController {
  final isLoading = false.obs;

  Future<void> createDoctor({
    required String regNum,
    required String doctorName,
    required String age,
    required String gender,
    required String experience,
    required String details,
    required String email,
    required String mobile,
    required String appointmentMobile,
    required String prescriptionSignature,
    required String departmentCategory,
    required String specialist,
    String? symptom,
    String? logoImagePath,
    String? frontImagePath,
  }) async {
    isLoading.value = true;
    final uri = Uri.parse(
        'https://doctorapp.com.softservice.site/api/auth/hospital-doctor/store');

    try {
      final request = http.MultipartRequest('POST', uri);

      // Add text fields
      request.fields['regnum'] = regNum;
      request.fields['doctorName'] = doctorName;
      request.fields['age'] = age;
      request.fields['gender'] = gender;
      request.fields['experience'] = experience;
      request.fields['details'] = details;
      request.fields['email'] = email;
      request.fields['mobile'] = mobile;
      request.fields['appoinment_mobile'] = appointmentMobile;
      request.fields['prescription_signature_style'] = prescriptionSignature;
      request.fields['deparment_category'] = departmentCategory;
      request.fields['specialist'] = specialist;

      // Handle symptom field (if null, use empty string)
      request.fields['symptom'] = symptom ?? ''; // Use empty string if null

      // Add images (only if the image paths are not null or empty)
      if (logoImagePath != null && logoImagePath.isNotEmpty) {
        request.files.add(
            await http.MultipartFile.fromPath('logo_image', logoImagePath));
      }
      if (frontImagePath != null && frontImagePath.isNotEmpty) {
        request.files.add(
            await http.MultipartFile.fromPath('front_image', frontImagePath));
      }

      final response = await request.send();
      final responseData = await response.stream.bytesToString();

      if (response.statusCode == 201) {
        final result = json.decode(responseData);
        final responseModel = DoctorResponse.fromJson(result);
        Get.snackbar('Success', responseModel.message);
        Get.to(const HospitalBottomNav());
        print(responseModel.message);
      } else {
        Get.snackbar('Error', 'Failed to create doctor. Please try again.');
        print(responseData);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

 

  Future<void> updateDoctor({
    required String regNum,
    required String doctorName,
    required String age,
    required String gender,
    required String experience,
    required String details,
    required String email,
    required String mobile,
    required String appointmentMobile,
    required String prescriptionSignature,
    required String departmentCategory,
    //required String specialist,
    required String doctorId, // Add doctorId as a required parameter
    String? symptom,
    String? logoImagePath,
    String? frontImagePath,
  }) async {
    isLoading.value = true;

    // Construct the URL with doctor_id in the path
    //final uri = Uri.parse('https://doctorapp.com.softservice.site/api/auth/hospital-doctor/update/doctor_id=$doctorId');
    final uri = Uri.parse(
        'https://doctorapp.com.softservice.site/api/auth/hospital-doctor/update?doctor_id=$doctorId');
    print("id=================>");
    print(doctorId);

    try {
      final request = http.MultipartRequest('POST', uri);

      // Add text fields
      request.fields['regnum'] = regNum;
      request.fields['doctorName'] = doctorName;
      request.fields['age'] = age;
      request.fields['gender'] = gender;
      request.fields['experience'] = experience;
      request.fields['details'] = details;
      request.fields['email'] = email;
      request.fields['mobile'] = mobile;
      request.fields['appoinment_mobile'] = appointmentMobile;
      request.fields['prescription_signature_style'] = prescriptionSignature;
      request.fields['deparment_category'] = departmentCategory;
      //request.fields['specialist'] = specialist;

      // Handle symptom field (if null, use empty string)
      request.fields['symptom'] = symptom ?? '';

      // Add images (only if the image paths are not null or empty)
      if (logoImagePath != null && logoImagePath.isNotEmpty) {
        request.files.add(
            await http.MultipartFile.fromPath('logo_image', logoImagePath));
      }
      if (frontImagePath != null && frontImagePath.isNotEmpty) {
        request.files.add(
            await http.MultipartFile.fromPath('front_image', frontImagePath));
      }

      final response = await request.send();
      final responseData = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        final result = json.decode(responseData);
        final responseModel = DoctorResponse.fromJson(result);
        Get.snackbar('Success', responseModel.message);
        print(responseModel.message);
      } else {
        Get.snackbar('Error', 'Failed to update doctor. Please try again.');
        print(responseData);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
