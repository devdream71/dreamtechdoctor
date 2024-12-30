class SendOtpResponse {
  final String message;
  final int otp;

  SendOtpResponse({required this.message, required this.otp});

  factory SendOtpResponse.fromJson(Map<String, dynamic> json) {
    return SendOtpResponse(
      message: json['message'],
      otp: json['otp'],
    );
  }
}