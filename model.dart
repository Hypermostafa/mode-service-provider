class AccountModel {
  final String message;
  final bool status;

  AccountModel({
    required this.message,
    required this.status,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      // handle both spellings safely
      message: (json["message"] ?? json["messege"] ?? "No message").toString(),
      status: json["status"] ?? false,
    );
  }
}
