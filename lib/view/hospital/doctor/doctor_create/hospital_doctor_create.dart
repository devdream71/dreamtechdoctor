import 'dart:io';
import 'package:dream_tech_doctor/utils/images.dart';
import 'package:dream_tech_doctor/view/hospital/doctor/doctor_create/controller_doctor_create.dart';
import 'package:dream_tech_doctor/view/hospital/doctor/doctor_create/doctor_create_specialist/controller_doctor_create_specialist.dart';
import 'package:dream_tech_doctor/view/hospital/doctor/doctor_create/doctor_create_symptom.dart/controller_create_doctor_symptom.dart';
import 'package:dream_tech_doctor/view/hospital/doctor/table_return.dart';
import 'package:dream_tech_doctor/view/hospital/doctor/table_return_room.dart';
import 'package:dream_tech_doctor/view/widgets/custom_dropdown.dart';
import 'package:dream_tech_doctor/view/widgets/custom_form_textfield.dart';
import 'package:dream_tech_doctor/view/widgets/lebel_with_asterisk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HospitalDoctorCreate extends StatefulWidget {
  @override
  _HospitalDoctorCreateState createState() => _HospitalDoctorCreateState();
}

class _HospitalDoctorCreateState extends State<HospitalDoctorCreate> {
  final doctorController = Get.put(DoctorController());
  final SymptomController symptomController = Get.put(SymptomController());

  final TextEditingController regController = TextEditingController();
  final TextEditingController docNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController expController = TextEditingController();
  final TextEditingController doctorDetails = TextEditingController();
  final TextEditingController doctorEmail = TextEditingController();
  final TextEditingController doctorNumberController = TextEditingController();
  final TextEditingController appointPhoneController = TextEditingController();
  final TextEditingController prescriptionSignatureCOntroller =
      TextEditingController();

  final List<String> _GenderOptions = [
    "Male",
    "Female",
  ];

  final List<String> _DepCatOptions = [
    "Cardiology",
    "Medicine",
    "Hypertention"
  ];

  final List<String> _symtomOptions = ["Angina", "AS", "ASS"];

  final List<String> _SpecialistOptions = [
    "Cardiology",
    "Medicine",
    "Hypertention"
  ];

  String? _selectedGender;

  String? _selectedDepCat;

  String? _selectedsymtomOption;

  String? _selectedSpecialist;

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

  Future<void> _createDoctor() async {
    await doctorController.createDoctor(
      regNum: regController.text,
      doctorName: docNameController.text,
      age: ageController.text,
      gender: _selectedGender ?? '',
      experience: expController.text,
      details: doctorDetails.text,
      email: doctorEmail.text,
      mobile: doctorNumberController.text,
      appointmentMobile: appointPhoneController.text,
      prescriptionSignature: prescriptionSignatureCOntroller.text,
      departmentCategory: _selectedDepCat ?? '',
      specialist: _selectedSpecialist ?? '',
      symptom: _selectedsymtomOption ?? " ",
      // logoImagePath: _logoImageFile?.path,   //_logoImageFile
      // frontImagePath: _frontImageFile?.path,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Hospital Doctor'),
      ),
      body: Obx(
        () => doctorController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /////====>department

                    Obx(() {
                      if (symptomController.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      final List<String> departmentOptions = symptomController
                          .departments
                          .map((department) => department.departmentCategory)
                          .toList();

                      String? selectedDepartment = departmentOptions.isNotEmpty
                          ? departmentOptions.first
                          : null;

                      return DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          labelText: 'Department',
                          border: OutlineInputBorder(),
                          isDense: true,
                        ),
                        value: selectedDepartment,
                        items: departmentOptions.map((String department) {
                          return DropdownMenuItem<String>(
                            value: department,
                            child: Text(department),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          selectedDepartment = newValue!;
                          print("Selected Department: $selectedDepartment");
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a department';
                          }
                          return null;
                        },
                      );
                    }),

                    const SizedBox(
                      height: 8,
                    ),
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
                    CustomTextFormField(
                      labelText: 'Doctor Email',
                      isRequired: true,
                      hintText: 'Enter Doctor email',
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
                      ],
                    ),

                    CustomDropdown(
                      labelText: "Gender",
                      isRequired: true,
                      items: _GenderOptions,
                      selectedItem: _selectedGender,
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value;
                        });
                      },
                    ),

                    const SizedBox(
                      height: 5,
                    ),
                    const LabelWithAsterisk(
                      labelText: "Experience",
                      isRequired: true,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ////===========>
                    Obx(() {
                      if (symptomController.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      // Convert experiences to a list of string values
                      final List<String> experienceOptions = symptomController
                          .experiences
                          .map((experience) => experience.experience)
                          .toList();

                      // Ensure there's at least one option available for the dropdown
                      String? selectedExperience = experienceOptions.isNotEmpty
                          ? experienceOptions.first
                          : null;

                      return DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          //labelText: 'Experience',
                          border: OutlineInputBorder(),
                          isDense: true,
                        ),
                        value: selectedExperience,
                        items: experienceOptions.map((String experience) {
                          return DropdownMenuItem<String>(
                            value: experience,
                            child: Text(experience),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          selectedExperience = newValue!;
                          print("Selected Experience: $selectedExperience");
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select an experience';
                          }
                          return null;
                        },
                      );
                    }),

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

                    const SizedBox(
                      height: 5,
                    ),
                    //Specialist
                    const LabelWithAsterisk(
                      labelText: "Specialist",
                      isRequired: true,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                     

                    Obx(() {
                      if (symptomController.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      // Map specialists to a list of strings
                      final List<String> specialistOptions = symptomController
                          .specialists
                          .map((specialist) => specialist.specialist)
                          .toList();

                      // Ensure `selectedItem` is not null by setting a default fallback value
                      String selectedSpecialist = specialistOptions.isNotEmpty
                          ? specialistOptions.first
                          : 'No Specialists Available';

                      return CustomDropdown(
                        labelText: "Specialist",
                        isRequired: true,
                        items: specialistOptions.isNotEmpty
                            ? specialistOptions
                            : [
                                'No Specialists Available'
                              ], // Fallback item if list is empty
                        selectedItem: selectedSpecialist,
                        onChanged: (value) {
                          print("Selected Specialist: $value");
                        },
                      );
                    }),

                   

                    const SizedBox(
                      height: 5,
                    ),

                    // const Text("Symptom"),
                    const LabelWithAsterisk(
                      labelText: "Symptom",
                      isRequired: true,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    //symtom
                    Obx(() {
                      if (symptomController.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      return DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                          //labelText: "Symptom",
                          border: OutlineInputBorder(),
                        ),
                        items: symptomController.symptoms.map((symptom) {
                          return DropdownMenuItem<String>(
                            value: symptom.symptom,
                            child: Text(symptom.symptom),
                          );
                        }).toList(),
                        onChanged: (value) {
                          // Handle selection
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a symptom';
                          }
                          return null;
                        },
                      );
                    }),
                    
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
                      controller: appointPhoneController,
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
                    CustomTextFormField(
                      labelText: 'Prescription Signature Style',
                      isRequired: true,
                      hintText: 'Enter Signature Style',
                      keyboardType: TextInputType.name,
                      controller: prescriptionSignatureCOntroller,
                      maxLines: 3,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Signature Style';
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
                    const ReturnTable_RoomScreen(),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: [
                        Text(
                          "Doctor Image",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
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
                      height: 5,
                    ),
                    const Row(
                      children: [
                        Text(
                          "Signature",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
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
                            debugPrint("depcat $_selectedDepCat");
                            debugPrint(
                                "reg number ${regController.toString()}");
                            debugPrint(
                                "doc name  ${docNameController.toString()}");
                            debugPrint(
                                "doctor email ${doctorEmail.toString()}");
                            debugPrint("age ${ageController.toString()}");
                            debugPrint("gender $_selectedGender");
                            debugPrint("exp ${expController.toString()}");
                            debugPrint(
                                "doctor details ${doctorDetails.toString()}");
                            debugPrint("doctor speci $_selectedSpecialist");
                            debugPrint("doctor symtom $_selectedsymtomOption");
                            debugPrint(
                                "doctor number ${doctorNumberController.toString()}");
                            debugPrint(
                                "apponit phone number ${appointPhoneController.toString()}");
                            debugPrint(
                                "signature style ${appointPhoneController.toString()}");
                            debugPrint(
                                "logo image ${_logoImageFile.toString()}");
                            debugPrint(
                                "front image ${_frontImageFile.toString()}");

                            _createDoctor();
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
