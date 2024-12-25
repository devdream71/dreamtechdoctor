import 'dart:io';

import 'package:dream_tech_doctor/utils/colors.dart';
import 'package:dream_tech_doctor/utils/images.dart';
import 'package:dream_tech_doctor/view/hospital/doctor/table_return.dart';
import 'package:dream_tech_doctor/view/hospital/doctor/table_return_room.dart';
import 'package:dream_tech_doctor/view/widgets/custom_dropdown.dart';
import 'package:dream_tech_doctor/view/widgets/custom_form_textfield.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HospitalDoctorCreate extends StatefulWidget {
  const HospitalDoctorCreate({super.key});

  @override
  State<HospitalDoctorCreate> createState() => _HospitalDoctorCreateState();
}

class _HospitalDoctorCreateState extends State<HospitalDoctorCreate> {
  TextEditingController regController = TextEditingController();
  TextEditingController docNameController = TextEditingController();
  TextEditingController expController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController doctorDetails = TextEditingController();
  TextEditingController doctorSpecialist = TextEditingController();
  TextEditingController doctorSymptom = TextEditingController();
  TextEditingController doctorEmail = TextEditingController();
  TextEditingController doctorNumberController = TextEditingController();

  final List<String> _GenderOptions = [
    "Male",
    "Female",
  ];

  String? _selectedGender;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Doctor Create",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColor.primaryColor.withOpacity(0.7),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextFormField(
                labelText: 'Registration Number',
                isRequired: true,
                hintText: 'Enter Registration number',
                keyboardType: TextInputType.name,
                controller: regController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter registration number';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 5,
              ),
              CustomTextFormField(
                labelText: 'Doctor Name',
                isRequired: true,
                hintText: 'Enter Name',
                keyboardType: TextInputType.name,
                controller: docNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter name';
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      labelText: 'Age',
                      isRequired: true,
                      hintText: 'Enter your age',
                      keyboardType: TextInputType.name,
                      controller: ageController,
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
                      labelText: 'Experience',
                      isRequired: true,
                      hintText: 'Enter Experience',
                      keyboardType: TextInputType.number,
                      controller: expController,
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
              CustomDropdown(
                labelText: "Gender",
                isRequired: true,
                items: _GenderOptions,
                selectedItem: _selectedGender,
                //placeholder: "Select your division",
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
              ),
              CustomTextFormField(
                labelText: 'Doctor Details',
                isRequired: true,
                hintText: 'Enter details',
                keyboardType: TextInputType.name,
                controller: doctorDetails,
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter details';
                  }
                  return null;
                },
              ),
              CustomTextFormField(
                labelText: 'Specialist',
                isRequired: true,
                hintText: 'Enter specialist',
                keyboardType: TextInputType.name,
                controller: doctorSpecialist,
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter specialist';
                  }
                  return null;
                },
              ),
              CustomTextFormField(
                labelText: 'Symptom',
                isRequired: true,
                hintText: 'Enter symptom',
                keyboardType: TextInputType.name,
                controller: doctorSymptom,
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter symptom';
                  }
                  return null;
                },
              ),
              CustomTextFormField(
                labelText: 'Admin Email',
                isRequired: true,
                hintText: 'Enter admin email',
                controller: doctorEmail,
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
              CustomTextFormField(
                labelText: 'Doctor Phone Number',
                isRequired: true,
                hintText: 'Enter phone number',
                controller: doctorNumberController,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Doctor Phone Number';
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
              CustomTextFormField(
                labelText: 'For Appoint phone number',
                isRequired: true,
                hintText: 'Enter phone number',
                controller: doctorNumberController,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter appoint Phone Number';
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
              const SizedBox(
                height: 10,
              ),
              const ReturnTableScreen(),
              const SizedBox(
                height: 10,
              ),

              
                ReturnTable_RoomScreen(),
              const SizedBox(
                height: 10,
              ),

              const Row(
                children: [
                  Text(
                    "Doctor Image",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
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
                      style: const TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  ),
                ),
              SizedBox(
                height: 5,
              ),
              const Row(
                children: [
                  Text(
                    "Signature",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
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
                                image: FileImage(File(_frontImageFile!.path)),
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
                      style: const TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  ),
                ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
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
                      // Call the login function from the LoginController
                    },
                    child: const Text(
                      'Doctor Create',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
