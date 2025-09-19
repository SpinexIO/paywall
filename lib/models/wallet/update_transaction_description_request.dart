class UpdateTransactionDescriptionRequest {
  final String transactionId;
  final String description;

  UpdateTransactionDescriptionRequest({required this.transactionId, required this.description});

  Map<String, dynamic> toJson() {
    return {"TransactionId": transactionId, "Description": description};
  }
}
