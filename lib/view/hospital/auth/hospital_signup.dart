import 'package:dream_tech_doctor/utils/images.dart';
import 'package:dream_tech_doctor/view/auth/signup.dart';
import 'package:dream_tech_doctor/view/hospital/auth/hospital_login.dart';
import 'package:dream_tech_doctor/view/hospital/auth/sign_up_otp.dart';
import 'package:dream_tech_doctor/view/widgets/custom_dropdown.dart';
import 'package:dream_tech_doctor/view/widgets/custom_form_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HospitalSignUpPage extends StatefulWidget {
  @override
  _HospitalSignUpPageState createState() => _HospitalSignUpPageState();
}

class _HospitalSignUpPageState extends State<HospitalSignUpPage> {
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

  String? _selectedDivision;

  bool _isPasswordHidden = true;
  bool _isConformPasswordHidden = true;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConformController = TextEditingController();
  final TextEditingController hospitalNameController = TextEditingController();
  final TextEditingController regNumberController = TextEditingController();
  final TextEditingController estDateController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController divisionController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController upazilaController = TextEditingController();
  final TextEditingController currentrLocationDetailsController = TextEditingController();
  final TextEditingController hospitalPrimaryNumberController = TextEditingController();
  final TextEditingController hospitalSecondaryNumberController = TextEditingController();
  final TextEditingController hospitalEmailController = TextEditingController();
  final TextEditingController hospitaladminController = TextEditingController();
  final TextEditingController hospitalPhoneController = TextEditingController();
  

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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  Center(
                    child: Container(
                      height: 100,
                      width: 200,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppImages.hospitallogo),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Center(),
                  const SizedBox(height: 8),
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
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    labelText: 'Hospital Name',
                    isRequired: true,
                    hintText: 'Enter hospital name',
                    //controller: nameController,

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
                          labelText: 'Established Date',
                          isRequired: true,
                          hintText: 'Enter Established date',
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter established date';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomDropdown(
                          labelText: "Country",
                          isRequired: true,
                          items: _DivisionOptions,
                          selectedItem: _selectedDivision,
                          //placeholder: "Select your division",
                          onChanged: (value) {
                            setState(() {
                              _selectedDivision = value;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: CustomDropdown(
                          labelText: "Division",
                          isRequired: true,
                          items: _DivisionOptions,
                          selectedItem: _selectedDivision,
                          onChanged: (value) {
                            setState(() {
                              _selectedDivision = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomDropdown(
                          labelText: "District",
                          isRequired: true,
                          items: _DivisionOptions,
                          selectedItem: _selectedDivision,
                          onChanged: (value) {
                            setState(() {
                              _selectedDivision = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 8,),
                      Expanded(
                        child: CustomDropdown(
                          labelText: "Upazila",
                          isRequired: true,
                          items: _DivisionOptions,
                          selectedItem: _selectedDivision,
                          onChanged: (value) {
                            setState(() {
                              _selectedDivision = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  CustomTextFormField(
                    labelText: 'Current Location Details',
                    isRequired: true,
                    hintText: 'Enter location details',
                    //controller: nameController,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Location details';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 5),
                  
                  CustomTextFormField(
                    labelText: 'Hospital Primary Phone Number',
                    isRequired: true,
                    hintText: 'Enter primary phone number',
                    //controller: nameController,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Hospital Primary Phone Number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 5),
                  CustomTextFormField(
                    labelText: 'Hospital Secondary Phone Number',
                    isRequired: true,
                    hintText: 'Enter Secondary phone number',
                    //controller: nameController,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Hospital Secondary Phone Number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 5),
                  CustomTextFormField(
                    labelText: 'Hospital Email',
                    isRequired: true,
                    hintText: 'Enter hopital email',
                    //controller: nameController,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Hospital Email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 5),
                  CustomTextFormField(
                    labelText: 'Admin Name',
                    isRequired: true,
                    hintText: 'Enter admin name',
                    //controller: nameController,
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
                    //controller: nameController,
                    keyboardType: TextInputType.name,
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
                    //controller: nameController,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter admin email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 5),
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
                            : Icons.visibility,
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
                      return null;
                    },
                  ),
                  const SizedBox(height: 5),
                  CustomTextFormField(
                    isRequired: true,
                    labelText: 'Conform Password',
                    hintText: 'Enter your conform password',
                    controller: passwordConformController,
                    obscureText: _isConformPasswordHidden,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _isConformPasswordHidden = !_isConformPasswordHidden;
                        });
                      },
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        // Handle login action
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const HospitalSignUpOtp()));
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
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
          )),
    );
  }
}
