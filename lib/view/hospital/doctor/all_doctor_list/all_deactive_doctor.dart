import 'package:dream_tech_doctor/utils/colors.dart';
import 'package:dream_tech_doctor/view/hospital/doctor/all_doctor_list/controller_all_doctor_list.dart';
import 'package:dream_tech_doctor/view/hospital/doctor/doctor_details_view/doctor_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AllDeactiveDoctorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AllDoctorGetController doctorController =
        Get.find<AllDoctorGetController>();

    // Ensure data fetching is not called during the build phase
    WidgetsBinding.instance.addPostFrameCallback((_) {
      doctorController.fetchDeactiveDoctors();
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'All Deactive Doctor',
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
                    return const Center(child: CircularProgressIndicator());
                  } else if (doctorController.doctors.isEmpty) {
                    return const Center(
                        child: Text(
                      'No Deactive Doctors Available',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ));
                  } else {
                    return ListView.builder(
                      itemCount: doctorController.doctors.length,
                      itemBuilder: (context, index) {
                        final doctor = doctorController.doctors[index];
                        final doctorID = doctorController.doctors[index].id;

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
                                      onPressed: () {},
                                    ),
                                  ),
                                  const SizedBox(width: 2),
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
                                                  'Are you sure you want to delete the doctor?'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
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
