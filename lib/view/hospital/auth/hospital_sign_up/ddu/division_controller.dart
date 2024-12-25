
import 'package:dream_tech_doctor/view/hospital/auth/hospital_sign_up/ddu/division_model.dart';
import 'package:dream_tech_doctor/view/hospital/auth/hospital_sign_up/ddu/model_district.dart';
import 'package:dream_tech_doctor/view/hospital/auth/hospital_sign_up/ddu/model_upazila.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class DivisionController extends GetxController {
  var divisions = <Division>[].obs; // Observable list of divisions
  var districts = <District>[].obs; // Observable list of districts
  var upazilas = <Upazila>[].obs; // Observable list of upazilas
  var isLoading = false.obs; // Loading state
  var errorMessage = ''.obs; // Error message
  var selectedDivision = Rx<String?>(null); // Selected division
  var selectedDistrict = Rx<String?>(null); // Selected district
  var selectedUpazila = Rx<String?>(null); // Selected upazila

  @override
  void onInit() {
    super.onInit();
    fetchDivisions();
  }

  Future<void> fetchDivisions() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response =
          await http.get(Uri.parse('https://pykari.com/divisions'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        divisions.value = data.map((json) => Division.fromJson(json)).toList();
      } else {
        errorMessage.value =
            'Failed to fetch divisions. Server error: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage.value = 'An error occurred: $e';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchDistricts(int divisionId) async {
    isLoading.value = true;
    errorMessage.value = '';
    districts.clear(); // Clear previous districts
    selectedDistrict.value = null; // Reset selected district
    upazilas.clear(); // Clear previous upazilas
    selectedUpazila.value = null; // Reset selected upazila

    try {
      final response =
          await http.get(Uri.parse('https://pykari.com/districts/$divisionId'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        districts.value = data.map((json) => District.fromJson(json)).toList();
      } else {
        errorMessage.value =
            'Failed to fetch districts. Server error: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage.value = 'An error occurred: $e';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchUpazilas(int districtId) async {
    isLoading.value = true;
    errorMessage.value = '';
    upazilas.clear(); // Clear previous upazilas
    selectedUpazila.value = null; // Reset selected upazila

    try {
      final response =
          await http.get(Uri.parse('https://pykari.com/upazillas/$districtId'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        upazilas.value = data.map((json) => Upazila.fromJson(json)).toList();
      } else {
        errorMessage.value =
            'Failed to fetch upazilas. Server error: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage.value = 'An error occurred: $e';
    } finally {
      isLoading.value = false;
    }
  }

  void onDivisionChanged(String? divisionId) {
    selectedDivision.value = divisionId;
    if (divisionId != null) {
      fetchDistricts(int.parse(divisionId));
    } else {
      districts.clear();
      upazilas.clear();
      selectedDistrict.value = null;
      selectedUpazila.value = null;
    }
  }

  void onDistrictChanged(String? districtId) {
    selectedDistrict.value = districtId;
    if (districtId != null) {
      fetchUpazilas(int.parse(districtId));
    } else {
      upazilas.clear();
      selectedUpazila.value = null;
    }
  }
}



