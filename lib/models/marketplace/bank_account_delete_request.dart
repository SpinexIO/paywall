/// Request model for deleting a bank account method.
class BankAccountDeleteRequest {
  final int id; // Bank account Id in Paywall

  BankAccountDeleteRequest({required this.id});

  Map<String, dynamic> toJson() {
    return {"Id": id};
  }
}
