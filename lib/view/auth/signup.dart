import 'package:dream_tech_doctor/utils/images.dart';
import 'package:dream_tech_doctor/view/auth/sign_up_otp.dart';
import 'package:dream_tech_doctor/view/auth/signin.dart';
import 'package:dream_tech_doctor/view/widgets/custom_dropdown.dart';
import 'package:dream_tech_doctor/view/widgets/custom_form_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  CreateAccountPageState createState() => CreateAccountPageState();
}

class CreateAccountPageState extends State<CreateAccountPage> {
  bool _isPasswordHidden = true;
  bool _isConformPasswordHidden = true;

  bool _isTermsAccepted = false;

  final List<String> _genderOptions = ["Male", "Female"];
  //final List<String> _religionOptions = ["Islam", "Christianity", "Hinduism"];
  final List<String> _bloodGroupOptions = ["A+", "B+", "AB+", "O+"];
  final List<String> _marriedOptions = [
    "Married",
    "Unmarried",
  ];

  final List<String> _divisionOptions = [
    "Barisal",
    "Chittagong",
    "Dhaka",
    "Khulna",
    "Mymensingh",
    "Rajshahi",
    "Sylhet",
    "Rangpur"
  ];

  String? _selectedGender;
  // String? _selectedReligion;
  String? _selectedBloodGroup;
  String? _selectedmarried;
  String? _selectedDivision;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConformController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController bloodGroupController = TextEditingController();
  final TextEditingController marriedController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController divisionController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController upazilaController = TextEditingController();
  final TextEditingController currentCountryController =
      TextEditingController();
  final TextEditingController currentDivisionController =
      TextEditingController();
  final TextEditingController currentDistrictController =
      TextEditingController();
  final TextEditingController currentUpazilaController =
      TextEditingController();
  final TextEditingController currentLocationDetailsController =
      TextEditingController();

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
              'Sign up',
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 40),
                  Center(
                    child: Container(
                      height: 100,
                      width: 200,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppImages.popup),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  const Center(
                    child: Text(
                      "Welcome back, you've been missed!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  CustomTextFormField(
                    labelText: 'Name',
                    isRequired: true,
                    hintText: 'Md. A ',
                    //controller: nameController,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Name';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 5),

                  CustomTextFormField(
                    labelText: 'Phone',
                    isRequired: true,
                    hintText: '+880 ',
                    //controller: nameController,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 5),

                  CustomTextFormField(
                    labelText: 'Email',
                    isRequired: true,
                    hintText: 'exp@gmail.com ',
                    //controller: nameController,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: CustomDropdown(
                          labelText: "Gender",
                          isRequired: true,
                          items: _genderOptions,
                          selectedItem: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: CustomTextFormField(
                          labelText: 'Age',
                          isRequired: true,
                          hintText: '27',
                          //controller: nameController,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Age';
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
                        child: CustomTextFormField(
                          labelText: 'Height',
                          isRequired: true,
                          hintText: '5.4"',
                          //controller: nameController,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Height';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: CustomTextFormField(
                          labelText: 'Weight',
                          isRequired: true,
                          hintText: '65 KG"',
                          //controller: nameController,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Weight';
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
                          labelText: "Blood Group",
                          isRequired: true,
                          items: _bloodGroupOptions,
                          selectedItem: _selectedBloodGroup,
                          onChanged: (value) {
                            setState(() {
                              _selectedBloodGroup = value;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: CustomDropdown(
                          labelText: "Married Status",
                          isRequired: true,
                          items: _marriedOptions,
                          selectedItem: _selectedmarried,
                          onChanged: (value) {
                            setState(() {
                              _selectedmarried = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  const Text(
                    'Location',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: CustomDropdown(
                          labelText: "Country",
                          isRequired: true,
                          items: _divisionOptions,
                          selectedItem: _selectedDivision,
                          onChanged: (value) {
                            setState(() {
                              _selectedDivision = value;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: CustomDropdown(
                          labelText: "Division",
                          isRequired: true,
                          items: _divisionOptions,
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
                          items: _divisionOptions,
                          selectedItem: _selectedDivision,
                          onChanged: (value) {
                            setState(() {
                              _selectedDivision = value;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: CustomDropdown(
                          labelText: "Upazila",
                          isRequired: true,
                          items: _divisionOptions,
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

                  const SizedBox(
                    height: 5,
                  ),

                  const Text(
                    'Current Location',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: CustomDropdown(
                          labelText: "Country",
                          isRequired: true,
                          items: _divisionOptions,
                          selectedItem: _selectedDivision,
                          onChanged: (value) {
                            setState(() {
                              _selectedDivision = value;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: CustomDropdown(
                          labelText: "Division",
                          isRequired: true,
                          items: _divisionOptions,
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
                          items: _divisionOptions,
                          selectedItem: _selectedDivision,
                          onChanged: (value) {
                            setState(() {
                              _selectedDivision = value;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: CustomDropdown(
                          labelText: "Upazila",
                          isRequired: true,
                          items: _divisionOptions,
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

                  const SizedBox(
                    height: 5,
                  ),

                  CustomTextFormField(
                    labelText: 'Current Location Details',
                    isRequired: true,
                    hintText: '',
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
                    controller: passwordController,
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
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Checkbox(
                        value: _isTermsAccepted,
                        onChanged: (value) {
                          setState(() {
                            _isTermsAccepted = value!;
                          });
                        },
                      ),
                      RichText(
                        text: const TextSpan(
                          text: 'Agree with ',
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: 'Terms & Condition',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  //Spacer(),
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
                        debugPrint('sign up');
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpOtp()));
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: const TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'Sign In',
                            style: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()),
                                );
                                debugPrint('Sign In clicked');
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
