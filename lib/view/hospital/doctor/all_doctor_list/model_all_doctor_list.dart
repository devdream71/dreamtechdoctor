class GatAllDoctorResponse {
  final List<Doctor> doctors;

  GatAllDoctorResponse({required this.doctors});

  factory GatAllDoctorResponse.fromJson(dynamic json) {
    return GatAllDoctorResponse(
      doctors: json is List ? json.map((doctor) => Doctor.fromJson(doctor)).toList() : [],
    );
  }
}

class Doctor {
  final int id;
  final String departmentCategory;
  final String regNum;
  final String doctorName;
  final String email;
  final String age;
  final String gender;
  final String details;
  final String experience;
  final List<String> specialist;
  final String schedule;
  final String symptom;
  final String mobile;
  final String mobileOptional;
  final String visitFee;
  final String secondDay;
  final String secondDayFee;
  final String thirdDay;
  final String thirdDayFee;
  final String paymentType;
  final String roomNumber;
  final String appointmentMobile;
  final String appointmentMobileOptional;
  final String doctorImage;
  final String signatureImage;
  final String prescriptionSignatureStyle;

  Doctor({
    required this.id,
    required this.departmentCategory,
    required this.regNum,
    required this.doctorName,
    required this.email,
    required this.age,
    required this.gender,
    required this.details,
    required this.experience,
    required this.specialist,
    required this.schedule,
    required this.symptom,
    required this.mobile,
    required this.mobileOptional,
    required this.visitFee,
    required this.secondDay,
    required this.secondDayFee,
    required this.thirdDay,
    required this.thirdDayFee,
    required this.paymentType,
    required this.roomNumber,
    required this.appointmentMobile,
    required this.appointmentMobileOptional,
    required this.doctorImage,
    required this.signatureImage,
    required this.prescriptionSignatureStyle,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      departmentCategory: json['deparment_category'] ?? "",
      regNum: json['regnum'] ?? "",
      doctorName: json['doctorName']?? "",
      email: json['email'] ?? "",
      age: json['age'] ?? "",
      gender: json['gender'] ?? "",
      details: json['details'] ?? "",
      experience: json['experience'] ?? "",
      // specialist: List<String>.from(json['Specialist'] ?? []),
      specialist: json['Specialist'] != null && json['Specialist'] is List
    ? List<String>.from(json['Specialist'])
    : [],
      schedule: json['Shedule'] ?? '',
      symptom: json['symptom'] ?? "",
      mobile: json['mobile'] ?? "",
      mobileOptional: json['mobile_optional'] ?? "",
      visitFee: json['visitfee'] ?? "",
      secondDay: json['second_day'] ?? "",
      secondDayFee: json['second_dayFee'] ?? "",
      thirdDay: json['thired_day'] ?? "",
      thirdDayFee: json['thired_dayFee'] ?? "",
      paymentType: json['payment_type'] ?? "",
      roomNumber: json['room_number'] ?? "",
      appointmentMobile: json['appoinment_mobile'] ?? "",
      appointmentMobileOptional: json['appoinment_mobileOptional'] ?? "",
      doctorImage: json['doctor_image'] ?? "",
      signatureImage: json['signature_image'] ?? "",
      prescriptionSignatureStyle: json['prescription_signature_style'] ?? "" ,
    );
  }
}
