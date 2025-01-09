import 'package:dream_tech_doctor/utils/urls.dart';
import 'package:dream_tech_doctor/view/hospital/doctor/doctor_create/doctor_create_department/model_doctor_create_department.dart';
import 'package:dream_tech_doctor/view/hospital/doctor/doctor_create/doctor_create_experience/model_doctor_create_experience.dart';
import 'package:dream_tech_doctor/view/hospital/doctor/doctor_create/doctor_create_specialist/model_doctor_create_specialist.dart';
import 'package:dream_tech_doctor/view/hospital/doctor/doctor_create/doctor_create_symptom.dart/model_doctor_create_symptom.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SymptomController extends GetxController {
  // final String apiUrl = 'https://doctorapp.com.softservice.site/api/auth/symptoms';
  //final String apiUrl = 'https://doctorapp.com.softservice.site/api/auth/experience';

  final String apiUrl = AppURL.doctorCreateSymptom;
  final String apiUrl2 = AppURL.doctorCreateSpcialist;
  final String apiUrl3 = AppURL.doctorCreateExperience;
  final String apiUrl4 = AppURL.doctorCreateDepartment;

  RxList<DoctorCreateSymptom> symptoms = <DoctorCreateSymptom>[].obs;
  RxBool isLoading = false.obs;

  RxList<DoctorCreateSpecialist> specialists = <DoctorCreateSpecialist>[].obs;

  RxList<DoctorCreateExperience> experiences = <DoctorCreateExperience>[].obs;

  RxList<DoctorCreateDepartment> departments = <DoctorCreateDepartment>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchSymptoms();
    fetchSpecialists();
    fetchExperiences();
    fetchDepartments();
  }

  //===>symtoms
  void fetchSymptoms() async {
    isLoading.value = true;

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('access_token'); // Retrieve the token

      print("token");
      print(token);

      if (token == null) {
        Get.snackbar('Error', 'Access token not found');
        isLoading.value = false;
        return;
      }

      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $token', // Include the token in the header
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        symptoms.value =
            data.map((item) => DoctorCreateSymptom.fromJson(item)).toList();
      } else {
        Get.snackbar('Error', 'Failed to fetch symptoms');
        print(response.body);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  ///===>specialist
  void fetchSpecialists() async {
    isLoading.value = true;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('access_token');

      if (token == null) {
        Get.snackbar('Error', 'Access token not found');
        isLoading.value = false;
        return;
      }

      final response = await http.get(
        Uri.parse(apiUrl2),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        specialists.value =
            data.map((item) => DoctorCreateSpecialist.fromJson(item)).toList();
        print("Fetched specialists: $specialists");
      } else {
        Get.snackbar('Error', 'Failed to fetch specialists');
        print("Error response: ${response.body}");
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
      print("Error fetching specialists: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // ///===>experience
  void fetchExperiences() async {
    isLoading.value = true;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('access_token');

      if (token == null) {
        Get.snackbar('Error', 'Access token not found');
        isLoading.value = false;
        return;
      }

      final response = await http.get(
        Uri.parse(apiUrl3),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        experiences.value =
            data.map((item) => DoctorCreateExperience.fromJson(item)).toList();
        print(data);
        print(token);
      } else {
        Get.snackbar('Error', 'Failed to fetch experiences');
        print(response.body);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
  


  ////////====>department
  void fetchDepartments() async {
    isLoading.value = true;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('access_token');

      if (token == null) {
        Get.snackbar('Error', 'Access token not found');
        isLoading.value = false;
        return;
      }

      final response = await http.get(
        Uri.parse(apiUrl4),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        departments.value =
            data.map((item) => DoctorCreateDepartment.fromJson(item)).toList();
        print(data);
      } else {
        Get.snackbar('Error', 'Failed to fetch departments');
        print(response.body);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
      print(e);
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
