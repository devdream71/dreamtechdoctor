import 'dart:io';
import 'package:dream_tech_doctor/utils/images.dart';
import 'package:dream_tech_doctor/view/hospital/auth/hospital_login/hospital_login.dart';
import 'package:dream_tech_doctor/view/hospital/auth/hospital_sign_up/ddu/division_controller.dart';
import 'package:dream_tech_doctor/view/hospital/auth/hospital_sign_up/hospital_sign_up.controller.dart';
import 'package:dream_tech_doctor/view/hospital/auth/sign_up_otp.dart';
import 'package:dream_tech_doctor/view/widgets/custom_dropdown.dart';
import 'package:dream_tech_doctor/view/widgets/custom_form_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HospitalSignUpPage extends StatefulWidget {
  const HospitalSignUpPage({super.key});

  @override
  HospitalSignUpPageState createState() => HospitalSignUpPageState();
}

class HospitalSignUpPageState extends State<HospitalSignUpPage> {
  final List<String> _CountryOptions = [
    "Bangladesh",
  ];

  final List<String> _DivisionOptions = [
    "Barisal",
    "Chittagong",
    "Dhaka",
    "Khulna",
    "Mymensingh",
    "Rajshahi",
    "Sylhet",
    "Rangpur"
  ];

  final List<String> _DistrictOptions = [
    "district 1 ",
    "district 2",
    "district 3",
    "district 4",
    "district 5",
    "district 6",
    "district 7",
    "district 8 "
  ];

  final List<String> _District = [];

  String? _selectedCountry;
  String? _selectedDivision;

  bool _isPasswordHidden = true;
  bool _isConformPasswordHidden = true;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConformController =
      TextEditingController();
  final TextEditingController hospitalNameController = TextEditingController();
  final TextEditingController regNumberController = TextEditingController();
  final TextEditingController estDateController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  //final TextEditingController divisionController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController upazilaController = TextEditingController();
  final TextEditingController currentrLocationDetailsController =
      TextEditingController();
  final TextEditingController hospitalPrimaryNumberController =
      TextEditingController();
  final TextEditingController hospitalSecondaryNumberController =
      TextEditingController();
  final TextEditingController hospitalEmailController = TextEditingController();
  final TextEditingController hospitaladminController = TextEditingController();
  final TextEditingController hospitalPhoneController = TextEditingController();
  final TextEditingController adminEmailontroller = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  XFile? _logoImageFile;
  XFile? _frontImageFile;
  String? _logoImageError;
  String? _frontImageError;

  Future<void> _pickImage(ImageSource source, bool isLogo) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);

    setState(() {
      if (isLogo) {
        _logoImageFile = pickedFile;
        _logoImageError = null;
      } else {
        _frontImageFile = pickedFile;
        _frontImageError = null;
      }
    });
  }

  bool _validateLogoImage() {
    if (_logoImageFile == null) {
      setState(() {
        _logoImageError = 'Please select a hospital logo';
      });
      return false;
    }
    return true;
  }

  bool _validateFrontImage() {
    if (_frontImageFile == null) {
      setState(() {
        _frontImageError = 'Please select a hospital front picture';
      });
      return false;
    }
    return true;
  }

  final SignupController signupController = Get.put(SignupController());
  final DivisionController divisionController = Get.put(DivisionController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            //centerTitle: true,
            title: const Text(
              'Hospital Sign up',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Center(
                      child: Container(
                        height: 80,
                        width: 200,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppImages.hospitallogo),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),

                    const Center(
                      child: Text(
                        "Welcome, you've been good time with us!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    CustomTextFormField(
                      labelText: 'Hospital Name',
                      isRequired: true,
                      hintText: 'Enter hospital name',
                      controller: hospitalNameController,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter hospital Name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            labelText: 'Registration Number',
                            isRequired: true,
                            hintText: 'Enter Registration number',
                            keyboardType: TextInputType.name,
                            controller: regNumberController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter registration number';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                            width: 8), // Add spacing between the two fields
                        Expanded(
                          child: CustomTextFormField(
                            labelText: 'Established Year',
                            isRequired: true,
                            hintText: 'Enter Established Year',
                            keyboardType: TextInputType.number,
                            controller: estDateController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter established Year';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 5),

                    Row(
                      children: [
                        Expanded(
                          child: CustomDropdown(
                            labelText: "Country",
                            isRequired: true,
                            items: _CountryOptions,
                            selectedItem: _selectedCountry,
                            //placeholder: "Select your division",
                            onChanged: (value) {
                              setState(() {
                                _selectedCountry = value;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        // Expanded(
                        //   child: CustomDropdown(
                        //     labelText: "Division",
                        //     isRequired: true,
                        //     items: _DivisionOptions,
                        //     selectedItem: _selectedDivision,
                        //     onChanged: (value) {
                        //       setState(() {
                        //         _selectedDivision = value;
                        //       });
                        //     },
                        //   ),
                        // ),
                        //division
                        Expanded(
                          child: Obx(() {
                            if (divisionController.isLoading.value) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }

                            if (divisionController.errorMessage.isNotEmpty) {
                              return Center(
                                child: Text(
                                  divisionController.errorMessage.value,
                                  style: TextStyle(color: Colors.red),
                                ),
                              );
                            }

                            return CustomDropdown(
                              labelText: "Division",
                              isRequired: true,
                              items: divisionController.divisions
                                  .map((division) => division.text)
                                  .toList(),
                              selectedItem:
                                  divisionController.selectedDivision.value,
                              onChanged: (value) {
                                divisionController.selectedDivision.value =
                                    value;

                                // Fetch districts for the selected division
                                final divisionId = divisionController.divisions
                                    .firstWhere(
                                        (division) => division.text == value)
                                    .id;
                                divisionController.fetchDistricts(divisionId);
                              },
                            );
                          }),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        // Expanded(
                        //   child: CustomDropdown(
                        //     labelText: "District",
                        //     isRequired: true,
                        //     items: _DivisionOptions,
                        //     selectedItem: _selectedDivision,
                        //     onChanged: (value) {
                        //       setState(() {
                        //         _selectedDivision = value;
                        //       });
                        //     },
                        //   ),
                        // ),
                        Expanded(
                          child: Obx(() {
                            if (divisionController.isLoading.value) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }

                            if (divisionController.errorMessage.isNotEmpty) {
                              return Center(
                                child: Text(
                                  divisionController.errorMessage.value,
                                  style: TextStyle(color: Colors.red),
                                ),
                              );
                            }

                            return CustomDropdown(
                              labelText: "District",
                              isRequired: true,
                              items: divisionController.districts
                                  .map((district) => district.text)
                                  .toList(),
                              selectedItem:
                                  divisionController.selectedDistrict.value,
                              onChanged: (value) {
                                divisionController.selectedDistrict.value =
                                    value;

                                // Fetch upazilas for the selected district
                                final districtId = divisionController.districts
                                    .firstWhere(
                                        (district) => district.text == value)
                                    .id;
                                divisionController.fetchUpazilas(districtId);
                              },
                            );
                          }),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        // Expanded(
                        //   child: CustomDropdown(
                        //     labelText: "Upazila",
                        //     isRequired: true,
                        //     items: _DivisionOptions,
                        //     selectedItem: _selectedDivision,
                        //     onChanged: (value) {
                        //       setState(() {
                        //         _selectedDivision = value;
                        //       });
                        //     },
                        //   ),
                        // ),
                        Expanded(
                          child: Obx(() {
                            if (divisionController.isLoading.value) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }

                            if (divisionController.errorMessage.isNotEmpty) {
                              return Center(
                                child: Text(
                                  divisionController.errorMessage.value,
                                  style: TextStyle(color: Colors.red),
                                ),
                              );
                            }

                            return CustomDropdown(
                              labelText: "Upazila",
                              isRequired: true,
                              items: divisionController.upazilas
                                  .map((upazila) => upazila.text)
                                  .toList(),
                              selectedItem:
                                  divisionController.selectedUpazila.value,
                              onChanged: (value) {
                                divisionController.selectedUpazila.value =
                                    value;

                                // Perform any additional action based on the selected upazila
                                print("Selected Upazila: $value");
                              },
                            );
                          }),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    CustomTextFormField(
                      labelText: 'Current Location Details',
                      isRequired: true,
                      hintText: 'Enter location details',
                      controller: currentrLocationDetailsController,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Location details';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    CustomTextFormField(
                      labelText: 'Hospital Primary Phone Number',
                      isRequired: true,
                      hintText: 'Enter primary phone number',
                      controller: hospitalPrimaryNumberController,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Hospital Primary Phone Number';
                        }
                        if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return 'Please enter a valid phone number';
                        }
                        if (value.length != 11) {
                          // Adjust this length as per your requirement
                          return 'Phone number must be 10 digits';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 5),

                    CustomTextFormField(
                      labelText: 'Hospital Secondary Phone Number',
                      hintText: 'Enter Secondary phone number',
                      controller: hospitalSecondaryNumberController,
                      keyboardType: TextInputType.number,
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Please enter Hospital Primary Phone Number';
                      //   }
                      //   if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      //     return 'Please enter a valid phone number';
                      //   }
                      //   if (value.length != 10) {
                      //     // Adjust this length as per your requirement
                      //     return 'Phone number must be 10 digits';
                      //   }
                      //   return null;
                      // },
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      labelText: 'Hospital Email',
                      isRequired: true,
                      hintText: 'Enter hopital email',
                      controller: hospitalEmailController,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Hospital Email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      labelText: 'Admin Name',
                      isRequired: true,
                      hintText: 'Enter admin name',
                      controller: hospitaladminController,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter admin Name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 5),
                    CustomTextFormField(
                      labelText: 'Admin Phone Number',
                      isRequired: true,
                      hintText: 'Enter admin phone number',
                      controller: hospitalPhoneController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter admin phone number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 5),
                    CustomTextFormField(
                      labelText: 'Admin Email',
                      isRequired: true,
                      hintText: 'Enter admin email',
                      controller: adminEmailontroller,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter admin email';
                        }
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 5),
                    ////===> password.
                    CustomTextFormField(
                      labelText: 'Password',
                      isRequired: true,
                      hintText: 'Enter your password',
                      controller: passwordController,
                      obscureText: _isPasswordHidden,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordHidden
                              ? Icons.visibility_off
                              : Icons.visibility, size: 18,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordHidden = !_isPasswordHidden;
                          });
                        },
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 5),

                    ///====>conform password.
                    CustomTextFormField(
                      isRequired: true,
                      labelText: 'Confirm Password',
                      hintText: 'Enter your confirm password',
                      controller: passwordConformController,
                      obscureText: _isConformPasswordHidden,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isConformPasswordHidden
                              ? Icons.visibility_off
                              : Icons.visibility, size: 18,
                        ),
                        onPressed: () {
                          setState(() {
                            _isConformPasswordHidden =
                                !_isConformPasswordHidden;
                          });
                        },
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your confirm password';
                        }
                        if (value != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    
                    const SizedBox(height: 30),

                    const Row(
                      children: [
                        Text(
                          "Hospital Front Picture",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "*",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.red),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            width: 220,
                            height: 110,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                              image: _frontImageFile != null
                                  ? DecorationImage(
                                      image: FileImage(
                                          File(_frontImageFile!.path)),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                            ),
                            child: _frontImageFile == null
                                ? const Center(
                                    child: Icon(
                                      Icons.image,
                                      size: 40,
                                      color: Colors.grey,
                                    ),
                                  )
                                : null,
                          ),
                          Positioned(
                            bottom: 4,
                            right: 4,
                            child: GestureDetector(
                              onTap: () {
                                _showImageSourceActionSheet(
                                    context, false); // false for front picture
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                padding: const EdgeInsets.all(6),
                                child: const Icon(
                                  Icons.camera_alt,
                                  size: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (_frontImageError != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Center(
                          child: Text(
                            _frontImageError!,
                            style: const TextStyle(
                                color: Colors.red, fontSize: 14),
                          ),
                        ),
                      ),

                    const SizedBox(
                      height: 10,
                    ),

                    const Row(
                      children: [
                        Text(
                          "Hospital Logo",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "*",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.red),
                        ),
                      ],
                    ),

                    Center(
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.green[100],
                            child: CircleAvatar(
                              radius: 55,
                              backgroundImage: _logoImageFile != null
                                  ? FileImage(File(_logoImageFile!.path))
                                  : const AssetImage(AppImages.splashLogo)
                                      as ImageProvider,
                            ),
                          ),
                          Positioned(
                            bottom: 4,
                            right: 4,
                            child: GestureDetector(
                              onTap: () {
                                _showImageSourceActionSheet(
                                    context, true); // true for logo
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                padding: const EdgeInsets.all(6),
                                child: const Icon(
                                  Icons.camera_alt,
                                  size: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (_logoImageError != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Center(
                          child: Text(
                            _logoImageError!,
                            style: const TextStyle(
                                color: Colors.red, fontSize: 14),
                          ),
                        ),
                      ),

                    const SizedBox(
                      height: 15,
                    ),

//                     Obx(() {
//   return SizedBox(
//     width: double.infinity,
//     height: 48,
//     child: ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.blue,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//       ),
//       onPressed: signupController.isLoading.value
//           ? null
//           : () async {
//               if (_formKey.currentState!.validate()) {
//                 await signupController.sendOtp(
//                     adminEmailontroller.text, context);

//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => HospitalSignUpOtp(
//                       adminemail: adminEmailontroller.text,
//                       otp: '123456',
//                       hospitalName: hospitalNameController.text,
//                       regNumber: regNumberController.text,
//                       establish: estDateController.text,
//                       country: _selectedDivision.toString(),
//                       division: _selectedDivision.toString(),
//                       district: _selectedDivision.toString(),
//                       subDistrict: _selectedDivision.toString(),
//                       locationDetails: currentrLocationDetailsController.text,
//                       mobileNumber1: hospitalPrimaryNumberController.text,
//                       mobileNumber2: hospitalSecondaryNumberController.text,
//                       email: hospitalEmailController.text,
//                       adminName: hospitaladminController.text,
//                       adminMobile: hospitalPhoneController.text,
//                       password: passwordController.text,
//                       logoPath: _logoImageFile.toString(),
//                       frontPicturePath: _frontImageFile.toString(),
//                     ),
//                   ),
//                 );
//               } else {
//                 Get.snackbar('Error', 'Please fill all fields correctly.');
//               }
//             },
//       child: signupController.isLoading.value
//           ? const CircularProgressIndicator(color: Colors.white)
//           : const Text('Sign up',
//               style: TextStyle(color: Colors.white, fontSize: 16)),
//     ),
//   );
// }),

                    ///==========>send otp

                    Obx(() {
                      return SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: signupController.isLoading.value
                              ? null
                              : () async {
                                  if (_formKey.currentState!.validate()) {
                                    print(
                                        "Admin email: ${adminEmailontroller.text}");

                                    // Call the OTP API
                                    // await signupController.sendOtp(
                                    //     adminEmailontroller.text, context);

                                    await signupController.sendOtp(
                                      adminEmailontroller.text,
                                      context,
                                      signupData: {
                                        'hospitalName':
                                            hospitalNameController.text,
                                        'regNumber': regNumberController.text,
                                        'establish': estDateController.text,
                                        'country': _selectedCountry.toString(),
                                        'division': divisionController
                                            .selectedDivision
                                            .toString(),
                                        'district': divisionController
                                            .selectedDistrict.value
                                            .toString(),
                                        'subDistrict': divisionController
                                            .selectedUpazila.value
                                            .toString(),
                                        'locationDetails':
                                            currentrLocationDetailsController
                                                .text,
                                        'mobileNumber1':
                                            hospitalPrimaryNumberController
                                                .text,
                                        'mobileNumber2':
                                            hospitalSecondaryNumberController
                                                .text,
                                        'email': hospitalEmailController.text,
                                        'adminName':
                                            hospitaladminController.text,
                                        'adminMobile':
                                            hospitalPhoneController.text,
                                        'adminEmail': adminEmailontroller.text,
                                        'password': passwordController.text,
                                        'logoPath': _logoImageFile.toString(),
                                        'frontPicturePath':
                                            _frontImageFile.toString(),
                                      },
                                    );

                                    ///call the sign up
                                    print(
                                        " Hospital Name ${hospitalNameController.text}");
                                    print(
                                        "Hospital Reg number ${regNumberController.text}");
                                    print("Est date ${estDateController.text}");
                                    print(
                                        "location deatils ${currentrLocationDetailsController.text}");
                                    print(
                                        "primary number ${hospitalPrimaryNumberController.text}");
                                    print(
                                        "2nd number ${hospitalSecondaryNumberController.text}");
                                    print(
                                        "hospital email ${hospitalEmailController.text}");
                                    print(
                                        "admin name${hospitaladminController.text}");
                                    print(
                                        "phone ${hospitalPhoneController.text}");
                                    print(
                                        "admin email ${adminEmailontroller.text}");
                                    print("logo ${_logoImageFile}");
                                    print("front image ${_frontImageFile}");

                                    print("Country ${_selectedDivision}");

                                    signupController.signup(
                                      hospitalName: hospitalNameController.text,
                                      regNumber: regNumberController.text,
                                      establish: estDateController.text,
                                      country: _selectedDivision.toString(),
                                      division: _selectedDivision.toString(),
                                      district: _selectedDivision.toString(),
                                      subDistrict: _selectedDivision.toString(),
                                      locationDetails:
                                          currentrLocationDetailsController
                                              .text,
                                      mobileNumber1:
                                          hospitalPrimaryNumberController.text,
                                      mobileNumber2:
                                          hospitalSecondaryNumberController
                                              .text,
                                      email: hospitalEmailController.text,
                                      adminName: adminEmailontroller.text,
                                      adminMobile: hospitalPhoneController.text,
                                      adminEmail: adminEmailontroller.text,
                                      password: passwordController.text,
                                      logoPath: _logoImageFile.toString(),
                                      frontPicturePath:
                                          _frontImageFile.toString(),
                                    );
                                  } else {
                                    Get.snackbar('Error',
                                        'Please fill all fields correctly.');
                                  }
                                },
                          child: signupController.isLoading.value
                              ? const CircularProgressIndicator(
                                  color: Colors.white)
                              : const Text('Sign up',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16)),
                        ),
                      );
                    }),

                    const SizedBox(height: 20),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'Already an account? ',
                          style: const TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: 'Sign in',
                              style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            HospitalLoginPage()),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  void _showImageSourceActionSheet(BuildContext context, bool isLogo) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.gallery, isLogo);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.camera, isLogo);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
