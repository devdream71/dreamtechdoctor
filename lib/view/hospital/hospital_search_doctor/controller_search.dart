import 'package:dream_tech_doctor/view/hospital/hospital_search_doctor/search_model/model_search_department.dart';
import 'package:dream_tech_doctor/view/hospital/hospital_search_doctor/search_model/model_search_hospital.dart';
import 'package:dream_tech_doctor/view/hospital/hospital_search_doctor/search_model/model_search_specialist.dart';
import 'package:dream_tech_doctor/view/hospital/hospital_search_doctor/search_model/model_search_symptoms.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SearchNewController extends GetxController {
  var isLoading = false.obs;
  var symptoms = <SearchSymptom>[].obs;

  var specialists = <SearchSpecialist>[].obs;

  var departments = <SearchDepartment>[].obs;

  var hospitalData = SearchHospitalData(hospitalNames: [], doctorDepartments: []).obs;


  @override
  void onInit() {
    super.onInit();
    fetchSearchSymptoms();
    fetchSearchSpecialists();
    fetchSearchDepartments();
    fetchSearchHospitalData();
  }

  ////===>symptom
  Future<void> fetchSearchSymptoms() async {
    isLoading.value = true;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('access_token');

    final uri =
        Uri.parse('https://doctorapp.com.softservice.site/api/home/symptoms');

    try {
      final response = await http.get(
        uri,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> responseData = json.decode(response.body);
        symptoms.value =
            responseData.map((data) => SearchSymptom.fromJson(data)).toList();
      } else {
        print('Failed to load symptoms');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  ///====>fetchSpecialists
  Future<void> fetchSearchSpecialists() async {
    isLoading.value = true;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('access_token');

    final uri =
        Uri.parse('https://doctorapp.com.softservice.site/api/home/specialist');

    try {
      final response = await http.get(
        uri,
        // headers: {
        //   'Authorization': 'Bearer $token',
        // },
      );

      if (response.statusCode == 200) {
        List<dynamic> responseData = json.decode(response.body);
        specialists.value = responseData
            .map((data) => SearchSpecialist.fromJson(data))
            .toList();
      } else {
        print('Failed to load specialists');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  ///department
  Future<void> fetchSearchDepartments() async {
    isLoading.value = true;
    try {
      final response = await http.get(
        Uri.parse('https://doctorapp.com.softservice.site/api/home/department'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        departments.value =
            data.map((json) => SearchDepartment.fromJson(json)).toList();
      } else {
        Get.snackbar('Error', 'Failed to fetch departments');
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong');
    } finally {
      isLoading.value = false;
    }
  }

   
  ///===>hospital  search 
   Future<void> fetchSearchHospitalData() async {
    isLoading.value = true;

    try {
      final response = await http.get(
        Uri.parse('https://doctorapp.com.softservice.site/api/home/hospital'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        hospitalData.value = SearchHospitalData.fromJson(data);
      } else {
        Get.snackbar('Error', 'Failed to fetch hospital data');
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong');
    } finally {
      isLoading.value = false;
    }
  }
}
