import 'package:dream_tech_doctor/utils/colors.dart';
import 'package:dream_tech_doctor/view/hospital/doctor/all_doctor_list/all_active_doctor.dart';
import 'package:dream_tech_doctor/view/hospital/doctor/all_doctor_list/all_deactive_doctor.dart';
import 'package:dream_tech_doctor/view/hospital/doctor/all_doctor_list/controller_all_doctor_list.dart';
import 'package:dream_tech_doctor/view/hospital/doctor/doctor_create/hospital_doctor_create.dart';
import 'package:dream_tech_doctor/view/hospital/doctor/doctor_details_view/doctor_details_view.dart';
import 'package:dream_tech_doctor/view/hospital/doctor/doctor_update/doctor_update.dart';
import 'package:dream_tech_doctor/view/hospital/hospital_search_doctor/hospital_search_doctor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AllDoctorGetController doctorController =
        Get.put(AllDoctorGetController());

    // Fetch the doctors when the screen is built
    doctorController.fetchDoctors();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Doctor Management',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColor.primaryColor.withOpacity(0.7),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text("Doctor Search"),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16)),
                      ),
                      builder: (context) => const HospitalSearchDoctor(),
                    );
                  },
                ),
              ],
            ),

            //const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5), // Square shape
                    ),
                    backgroundColor: Colors.green[400],
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HospitalDoctorCreate(),
                      ),
                    );
                  },
                  child: const Text(
                    '+ Create Doctor',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(5), // Square shape
                        ),
                      ),
                      onPressed: () {
                        Get.to(AllActiveDoctorScreen());
                      },
                      child: const Text(
                        'All Active',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(AllDeactiveDoctorScreen());
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(5), // Square shape
                          ),
                          backgroundColor: Colors.red),
                      child: const Text(
                        'All Inactive',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Filters
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Department/Category',
                      border: OutlineInputBorder(),
                    ),
                    items: ['Cardiology', 'Neurology', 'Pediatrics']
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Doctor',
                      border: OutlineInputBorder(),
                    ),
                    items: ['Dr. Jasim', 'Dr. Shakib', 'Dr. Meem']
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(
                () {
                  if (doctorController.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  } else if (doctorController.doctors.isEmpty) {
                    return Center(child: Text('No doctors available.'));
                  } else {
                    return ListView.builder(
                      itemCount: doctorController.doctors.length,
                      itemBuilder: (context, index) {
                        final doctor = doctorController.doctors[index];
                        final doctorID = doctorController.doctors[index].id;
                        print("doctor id ===>  $doctorID");

                        return InkWell(
                          onTap: () {
                            // Navigate to doctor details page
                            Get.to(() => DoctorDetailScreen(
                                doctorId: doctorController.doctors[index].id));
                          },
                          child: Card(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(doctor.doctorImage),
                              ),
                              title: Text(doctor.doctorName),
                              subtitle: Text(doctor.departmentCategory),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CircleAvatar(
                                    child: IconButton(
                                      icon: const Icon(Icons.edit,
                                          color: Colors.blue),
                                      onPressed: () {
                                        ///doctor update
                                        Get.to(const HospitalDoctorUpdate(),
                                            arguments: {'doctorId': doctor.id});
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  CircleAvatar(
                                    child: IconButton(
                                      icon: const Icon(Icons.delete,
                                          color: Colors.red),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text('Delete'),
                                              content: const Text(
                                                  'Are you sure you want to Delete the Doctor?'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    // Close the dialog
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text('Cancel'),
                                                ),
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor: Colors
                                                        .red, // Optional: Style the button
                                                  ),
                                                  onPressed: () async {
                                                    await doctorController
                                                        .deleteDoctor(doctorID
                                                            .toString());
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text(
                                                    'Delete',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
