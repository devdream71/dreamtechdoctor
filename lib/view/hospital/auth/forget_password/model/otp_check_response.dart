class OtpCheckResponse {
  final String otpMessage;

  OtpCheckResponse({required this.otpMessage});

  factory OtpCheckResponse.fromJson(Map<String, dynamic> json) {
    return OtpCheckResponse(
      otpMessage: json['otpMessage'],
    );
  }
}