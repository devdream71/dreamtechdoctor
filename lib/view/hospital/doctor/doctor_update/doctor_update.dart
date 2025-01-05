import 'package:dream_tech_doctor/view/hospital/doctor/doctor_create/controller_doctor_create.dart';
import 'package:dream_tech_doctor/view/hospital/doctor/doctor_details_view/controller_doctor_details_view.dart';
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

        _selectedsymtomOption =
            _symtomOptions.contains(doctor.symptom) ? doctor.symptom : null;

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
                    const SizedBox(
                      height: 10,
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

                            debugPrint(" reg number ${regController.text}");
                            debugPrint(" name ${docNameController.text}");
                            debugPrint(" age ${ageController.text}");
                            debugPrint(" exp ${expController.text}");
                            debugPrint(" doc details ${doctorDetails.text}");
                            debugPrint(" reg number ${regController.text}");

                            debugPrint(" doc email ${doctorEmail.text}");
                            debugPrint(" age ${ageController.text}");

                            debugPrint(
                                " reg number ${doctorNumberController.text}");
                            debugPrint(
                                " prescription singnature  ${prescriptionSignatureCOntroller.text}");
                            debugPrint(
                                " appoint phone ${appointPhoneController.text}");

                            debugPrint(" selected gender ${_selectedGender}");
                            debugPrint(" selected depcat ${_selectedDepCat}");
                            debugPrint(
                                " selected symtom ${_selectedsymtomOption}");

                            //updateDoctor();

                            try {
                              updateDoctor();
                            } catch (e) {
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
