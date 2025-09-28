class BlockBalanceRequest {
  final double amount;
  final String description;
  final String id;
  final String externalReference;

  BlockBalanceRequest({required this.amount, required this.description, required this.id, required this.externalReference});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{"Amount": amount, "Description": description, "Id": id, "ExternalReference": externalReference};
  }
}
