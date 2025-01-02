import 'dart:io';
import 'package:dream_tech_doctor/utils/images.dart';
import 'package:dream_tech_doctor/view/hospital/doctor/doctor_create/controller_doctor_create.dart';
import 'package:dream_tech_doctor/view/hospital/doctor/doctor_details_view/controller_doctor_details_view.dart';
import 'package:dream_tech_doctor/view/hospital/doctor/table_return.dart';
import 'package:dream_tech_doctor/view/hospital/doctor/table_return_room.dart';
import 'package:dream_tech_doctor/view/widgets/custom_dropdown.dart';
import 'package:dream_tech_doctor/view/widgets/custom_form_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HospitalDoctorUpdate extends StatefulWidget {
  const HospitalDoctorUpdate({super.key});

  @override
  HospitalDoctorUpdateState createState() => HospitalDoctorUpdateState();
}

class HospitalDoctorUpdateState extends State<HospitalDoctorUpdate> {
  final doctorDetailsController = Get.put(DoctorDetailsViewController());
  final doctorController = Get.put(DoctorController());

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

  final List<String> _genderOptions = [
    "Male",
    "Female",
  ];

  String? _selectedGender;

  final List<String> _depCatOptions = [
    "Cardiology",
    "Medicine",
    "Hypertention"
  ];

  String? _selectedDepCat;

  final List<String> _symtomOptions = ["Angina", "AS", "ASS"];

  String? _selectedsymtomOption;

  final List<String> _SpecialistOptions = [
    "Cardiology",
    "Medicine",
    "Hypertention"
  ];

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

  @override
  void initState() {
    super.initState();
    final doctorID = Get.arguments['doctorId'];
    doctorDetailsController.fetchDoctorDetails(doctorID).then((_) {
      final doctor = doctorDetailsController.doctor.value;
      if (doctor != null) {
       
        regController.text = doctor.regNum;
        docNameController.text = doctor.doctorName;
        ageController.text = doctor.age;
        expController.text = doctor.experience;
        doctorDetails.text = doctor.details;
        doctorEmail.text = doctor.email;
        ageController.text = doctor.age;
        doctorNumberController.text = doctor.mobile;
        prescriptionSignatureCOntroller.text =
            doctor.prescriptionSignatureStyle;
        appointPhoneController.text = doctor.appointmentMobile;
      
        _selectedGender =
            _genderOptions.contains(doctor.gender) ? doctor.gender : null;

        _selectedDepCat = _depCatOptions.contains(doctor.departmentCategory)
            ? doctor.departmentCategory
            : null;

        _selectedsymtomOption = _symtomOptions.contains(doctor.symptom)
            ? doctor.symptom
            : null;

        setState(() {});
      }
    });
  }

  Future<void> updateDoctor() async {
         //final doctorID = Get.arguments['doctorId']; 
          final doctorID = int.tryParse(Get.arguments['doctorId'].toString());

  // Ensure doctorID is not null before proceeding
  if (doctorID == null) {
    Get.snackbar("Error", "Invalid Doctor ID");
    return;
  }

    await doctorController.updateDoctor(
      doctorId: doctorID.toString(),
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
      ///specialist: _selectedSpecialist ?? '',
      symptom: _selectedsymtomOption ?? " ",
      // logoImagePath: _logoImageFile?.path,   //_logoImageFile
      // frontImagePath: _frontImageFile?.path,
    );
  }

  @override
  Widget build(BuildContext context) {
    final doctorID = Get.arguments['doctorId'];
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospital Update Doctor ID:$doctorID'),
      ),
      body: Obx(
        () => doctorDetailsController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormField(
                      labelText: 'Registration Number',
                      isRequired: true,
                      hintText: 'Enter Registration number',
                      controller: regController,
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      labelText: 'Doctor Name',
                      isRequired: true,
                      hintText: 'Enter Name',
                      controller: docNameController,
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      labelText: 'Doctor Email',
                      isRequired: true,
                      hintText: 'Enter Email',
                      controller: doctorEmail,
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      labelText: 'Experience',
                      isRequired: false,
                      hintText: 'Enter Experience',
                      controller: expController,
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      labelText: 'Details',
                      isRequired: false,
                      hintText: 'Enter Details',
                      controller: doctorDetails,
                      maxLines: 4,
                    ),
                    CustomTextFormField(
                      labelText: 'Prescription Signature Controller',
                      isRequired: false,
                      hintText: 'Enter Details',
                      controller: prescriptionSignatureCOntroller,
                      maxLines: 4,
                    ),
                    CustomTextFormField(
                      labelText: 'Appoint Phone Controller',
                      isRequired: false,
                      hintText: 'Enter Details',
                      controller: appointPhoneController,
                      maxLines: 4,
                    ),
                    CustomTextFormField(
                      labelText: 'Doctor Number Controller',
                      isRequired: false,
                      hintText: 'Enter Details',
                      controller: doctorNumberController,
                      maxLines: 4,
                    ),
                    CustomTextFormField(
                      labelText: 'Age',
                      isRequired: false,
                      hintText: 'Enter Details',
                      controller: ageController,
                      maxLines: 4,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: "Gender",
                        border: OutlineInputBorder(),
                      ),
                      value:
                          _selectedGender, // Ensure it matches one of the items
                      items: _genderOptions.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: "Deparment Category",
                        border: OutlineInputBorder(),
                      ),
                      value:
                          _selectedDepCat, // Ensure it matches one of the items
                      items: _depCatOptions.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedDepCat = value;
                        });
                      },
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: "Deparment Category",
                        border: OutlineInputBorder(),
                      ),
                      value:
                          _selectedsymtomOption, // Ensure it matches one of the items
                      items: _symtomOptions.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedsymtomOption = value;
                        });
                      },
                    ),

                    const SizedBox(height: 10,),


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
                               
                               print(" reg number ${regController.text}");
                               print(" reg number ${docNameController.text}");
                               print(" reg number ${ageController.text}");
                               print(" reg number ${expController.text}");
                              print(" reg number ${doctorDetails.text}");
                               print(" reg number ${regController.text}");

                               print(" reg number ${doctorEmail.text}");
                               print(" reg number ${ageController.text}");

                               print(" reg number ${doctorNumberController.text}");
                               print(" reg number ${prescriptionSignatureCOntroller.text}");
                              print(" reg number ${appointPhoneController.text}");

                               print(" reg number ${_selectedGender}");
                               print(" reg number ${_selectedDepCat}");
                               print(" reg number ${_selectedsymtomOption}");



                               //updateDoctor();

                               try{
                                updateDoctor();
                               } 
                               catch(e){
                                print(e);
                               }
                          },
                          child: const Text(
                            'Update Doctor',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),


                    
                  ],
                ),
              ),

        // Obx(
        //   () => doctorController.isLoading.value
        //       ? const Center(child: CircularProgressIndicator())
        //       : SingleChildScrollView(
        //           padding: const EdgeInsets.all(16.0),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               CustomDropdown(
        //                 labelText: "Department/Category",
        //                 isRequired: true,
        //                 items: _DepCatOptions.isNotEmpty
        //                     ? _DepCatOptions
        //                     : [''], // Ensure list is not empty
        //                 selectedItem: _selectedDepCat,
        //                 onChanged: (value) {
        //                   setState(() {
        //                     _selectedDepCat = value;
        //                   });
        //                 },
        //               ),

        //               const SizedBox(
        //                 height: 8,
        //               ),
        //               CustomTextFormField(
        //                 labelText: 'Registration Number',
        //                 isRequired: true,
        //                 hintText: 'Enter Registration number',
        //                 keyboardType: TextInputType.name,
        //                 controller: regController,
        //                 validator: (value) {
        //                   if (value == null || value.isEmpty) {
        //                     return 'Please enter registration number';
        //                   }
        //                   return null;
        //                 },
        //               ),
        //               const SizedBox(
        //                 height: 5,
        //               ),
        //               CustomTextFormField(
        //                 labelText: 'Doctor Name',
        //                 isRequired: true,
        //                 hintText: 'Enter Name',
        //                 keyboardType: TextInputType.name,
        //                 controller: docNameController,
        //                 validator: (value) {
        //                   if (value == null || value.isEmpty) {
        //                     return 'Please enter name';
        //                   }
        //                   return null;
        //                 },
        //               ),
        //               CustomTextFormField(
        //                 labelText: 'Doctor Email',
        //                 isRequired: true,
        //                 hintText: 'Enter Doctor email',
        //                 controller: doctorEmail,
        //                 keyboardType: TextInputType.emailAddress,
        //                 validator: (value) {
        //                   if (value == null || value.isEmpty) {
        //                     return 'Please enter admin email';
        //                   }
        //                   if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
        //                       .hasMatch(value)) {
        //                     return 'Please enter a valid email address';
        //                   }
        //                   return null;
        //                 },
        //               ),
        //               Row(
        //                 children: [
        //                   Expanded(
        //                     child: CustomTextFormField(
        //                       labelText: 'Age',
        //                       isRequired: true,
        //                       hintText: 'Enter your age',
        //                       keyboardType: TextInputType.name,
        //                       controller: ageController,
        //                       validator: (value) {
        //                         if (value == null || value.isEmpty) {
        //                           return 'Please enter registration number';
        //                         }
        //                         return null;
        //                       },
        //                     ),
        //                   ),
        //                   const SizedBox(
        //                       width: 8), // Add spacing between the two fields
        //                 ],
        //               ),

        //               CustomDropdown(
        //                 labelText: "Gender",
        //                 isRequired: true,
        //                 items: _GenderOptions,
        //                 selectedItem: _selectedGender,
        //                 onChanged: (value) {
        //                   setState(() {
        //                     _selectedGender = value;
        //                   });
        //                 },
        //               ),

        //               CustomTextFormField(
        //                 labelText: 'Experience',
        //                 isRequired: true,
        //                 hintText: 'Enter Experience',
        //                 keyboardType: TextInputType.number,
        //                 controller: expController,
        //                 validator: (value) {
        //                   if (value == null || value.isEmpty) {
        //                     return 'Please enter established Year';
        //                   }
        //                   return null;
        //                 },
        //               ),
        //               CustomTextFormField(
        //                 labelText: 'Doctor Details',
        //                 isRequired: true,
        //                 hintText: 'Enter details',
        //                 keyboardType: TextInputType.name,
        //                 controller: doctorDetails,
        //                 maxLines: 3,
        //                 validator: (value) {
        //                   if (value == null || value.isEmpty) {
        //                     return 'Please enter details';
        //                   }
        //                   return null;
        //                 },
        //               ),

        //               CustomDropdown(
        //                 labelText: "Specialist",
        //                 isRequired: true,
        //                 items: _SpecialistOptions.isNotEmpty
        //                     ? _SpecialistOptions
        //                     : [''], // Ensure list is not empty
        //                 selectedItem: _selectedSpecialist,
        //                 onChanged: (value) {
        //                   setState(() {
        //                     _selectedSpecialist = value;
        //                   });
        //                 },
        //               ),

        //               CustomDropdown(
        //                 labelText: "Symptom",
        //                 isRequired: true,
        //                 items: _symtomOptions.isNotEmpty
        //                     ? _symtomOptions
        //                     : [''], // Ensure list is not empty
        //                 selectedItem: _selectedsymtomOption,
        //                 onChanged: (value) {
        //                   setState(() {
        //                     _selectedsymtomOption = value;
        //                   });
        //                 },
        //               ),

        //               CustomTextFormField(
        //                 labelText: 'Doctor Phone Number',
        //                 isRequired: true,
        //                 hintText: 'Enter phone number',
        //                 controller: doctorNumberController,
        //                 keyboardType: TextInputType.phone,
        //                 validator: (value) {
        //                   if (value == null || value.isEmpty) {
        //                     return 'Please enter Doctor Phone Number';
        //                   }
        //                   if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
        //                     return 'Please enter a valid phone number';
        //                   }
        //                   if (value.length != 11) {
        //                     // Adjust this length as per your requirement
        //                     return 'Phone number must be 10 digits';
        //                   }
        //                   return null;
        //                 },
        //               ),
        //               CustomTextFormField(
        //                 labelText: 'For Appoint phone number',
        //                 isRequired: true,
        //                 hintText: 'Enter phone number',
        //                 controller: appointPhoneController,
        //                 keyboardType: TextInputType.phone,
        //                 validator: (value) {
        //                   if (value == null || value.isEmpty) {
        //                     return 'Please enter appoint Phone Number';
        //                   }
        //                   if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
        //                     return 'Please enter a valid phone number';
        //                   }
        //                   if (value.length != 11) {
        //                     // Adjust this length as per your requirement
        //                     return 'Phone number must be 10 digits';
        //                   }
        //                   return null;
        //                 },
        //               ),
        //               CustomTextFormField(
        //                 labelText: 'Prescription Signature Style',
        //                 isRequired: true,
        //                 hintText: 'Enter Signature Style',
        //                 keyboardType: TextInputType.name,
        //                 controller: prescriptionSignatureCOntroller,
        //                 maxLines: 3,
        //                 validator: (value) {
        //                   if (value == null || value.isEmpty) {
        //                     return 'Please enter Signature Style';
        //                   }
        //                   return null;
        //                 },
        //               ),
        //               const SizedBox(
        //                 height: 10,
        //               ),
        //               const ReturnTableScreen(),
        //               const SizedBox(
        //                 height: 10,
        //               ),
        //               const ReturnTable_RoomScreen(),
        //               const SizedBox(
        //                 height: 10,
        //               ),
        //               const Row(
        //                 children: [
        //                   Text(
        //                     "Doctor Image",
        //                     style: TextStyle(
        //                         fontSize: 14, fontWeight: FontWeight.w600),
        //                   ),
        //                   Text(
        //                     "*",
        //                     style: TextStyle(
        //                         fontSize: 16,
        //                         fontWeight: FontWeight.w600,
        //                         color: Colors.red),
        //                   ),
        //                 ],
        //               ),
        //               Center(
        //                 child: Stack(
        //                   alignment: Alignment.bottomRight,
        //                   children: [
        //                     CircleAvatar(
        //                       radius: 60,
        //                       backgroundColor: Colors.green[100],
        //                       child: CircleAvatar(
        //                         radius: 55,
        //                         backgroundImage: _logoImageFile != null
        //                             ? FileImage(File(_logoImageFile!.path))
        //                             : const AssetImage(AppImages.splashLogo)
        //                                 as ImageProvider,
        //                       ),
        //                     ),
        //                     Positioned(
        //                       bottom: 4,
        //                       right: 4,
        //                       child: GestureDetector(
        //                         onTap: () {
        //                           _showImageSourceActionSheet(
        //                               context, true); // true for logo
        //                         },
        //                         child: Container(
        //                           decoration: const BoxDecoration(
        //                             shape: BoxShape.circle,
        //                             color: Colors.white,
        //                           ),
        //                           padding: const EdgeInsets.all(6),
        //                           child: const Icon(
        //                             Icons.camera_alt,
        //                             size: 20,
        //                             color: Colors.black,
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //               if (_logoImageError != null)
        //                 Padding(
        //                   padding: const EdgeInsets.only(top: 8.0),
        //                   child: Center(
        //                     child: Text(
        //                       _logoImageError!,
        //                       style: const TextStyle(
        //                           color: Colors.red, fontSize: 14),
        //                     ),
        //                   ),
        //                 ),
        //               const SizedBox(
        //                 height: 5,
        //               ),
        //               const Row(
        //                 children: [
        //                   Text(
        //                     "Signature",
        //                     style: TextStyle(
        //                         fontSize: 14, fontWeight: FontWeight.w600),
        //                   ),
        //                   Text(
        //                     "*",
        //                     style: TextStyle(
        //                         fontSize: 16,
        //                         fontWeight: FontWeight.w600,
        //                         color: Colors.red),
        //                   ),
        //                 ],
        //               ),
        //               const SizedBox(
        //                 height: 10,
        //               ),
        //               Center(
        //                 child: Stack(
        //                   alignment: Alignment.bottomRight,
        //                   children: [
        //                     Container(
        //                       width: 220,
        //                       height: 110,
        //                       decoration: BoxDecoration(
        //                         color: Colors.grey[200],
        //                         borderRadius: BorderRadius.circular(8),
        //                         image: _frontImageFile != null
        //                             ? DecorationImage(
        //                                 image: FileImage(
        //                                     File(_frontImageFile!.path)),
        //                                 fit: BoxFit.cover,
        //                               )
        //                             : null,
        //                       ),
        //                       child: _frontImageFile == null
        //                           ? const Center(
        //                               child: Icon(
        //                                 Icons.image,
        //                                 size: 40,
        //                                 color: Colors.grey,
        //                               ),
        //                             )
        //                           : null,
        //                     ),
        //                     Positioned(
        //                       bottom: 4,
        //                       right: 4,
        //                       child: GestureDetector(
        //                         onTap: () {
        //                           _showImageSourceActionSheet(
        //                               context, false); // false for front picture
        //                         },
        //                         child: Container(
        //                           decoration: const BoxDecoration(
        //                             shape: BoxShape.circle,
        //                             color: Colors.white,
        //                           ),
        //                           padding: const EdgeInsets.all(6),
        //                           child: const Icon(
        //                             Icons.camera_alt,
        //                             size: 20,
        //                             color: Colors.black,
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //               if (_frontImageError != null)
        //                 Padding(
        //                   padding: const EdgeInsets.only(top: 8.0),
        //                   child: Center(
        //                     child: Text(
        //                       _frontImageError!,
        //                       style: const TextStyle(
        //                           color: Colors.red, fontSize: 14),
        //                     ),
        //                   ),
        //                 ),
        //               const SizedBox(
        //                 height: 10,
        //               ),
        //               const SizedBox(
        //                 height: 15,
        //               ),
        //               Padding(
        //                 padding: const EdgeInsets.symmetric(horizontal: 24),
        //                 child: SizedBox(
        //                   width: double.infinity,
        //                   height: 48,
        //                   child: ElevatedButton(
        //                     style: ElevatedButton.styleFrom(
        //                       backgroundColor: Colors.blue,
        //                       shape: RoundedRectangleBorder(
        //                         borderRadius: BorderRadius.circular(12),
        //                       ),
        //                     ),
        //                     onPressed: () {
        //                       // Call the login function from the LoginController
        //                       debugPrint("depcat $_selectedDepCat");
        //                       debugPrint(
        //                           "reg number ${regController.toString()}");
        //                       debugPrint(
        //                           "doc name  ${docNameController.toString()}");
        //                       debugPrint(
        //                           "doctor email ${doctorEmail.toString()}");
        //                       debugPrint("age ${ageController.toString()}");
        //                       debugPrint("gender $_selectedGender");
        //                       debugPrint("exp ${expController.toString()}");
        //                       debugPrint(
        //                           "doctor details ${doctorDetails.toString()}");
        //                       debugPrint("doctor speci $_selectedSpecialist");
        //                       debugPrint("doctor symtom $_selectedsymtomOption");
        //                       debugPrint(
        //                           "doctor number ${doctorNumberController.toString()}");
        //                       debugPrint(
        //                           "apponit phone number ${appointPhoneController.toString()}");
        //                       debugPrint(
        //                           "signature style ${appointPhoneController.toString()}");
        //                       debugPrint(
        //                           "logo image ${_logoImageFile.toString()}");
        //                       debugPrint(
        //                           "front image ${_frontImageFile.toString()}");

        //                       _createDoctor();
        //                     },
        //                     child: const Text(
        //                       'Doctor Create',
        //                       style: TextStyle(color: Colors.white, fontSize: 16),
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        // ),
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
