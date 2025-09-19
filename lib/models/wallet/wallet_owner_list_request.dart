/// Wallet Owner List Request model
/// Hint: Defines query parameters for listing wallet owners.
class WalletOwnerListRequest {
  final int ownerType;
  final int pageNumber;
  final int pageSize;

  WalletOwnerListRequest({required this.ownerType, required this.pageNumber, required this.pageSize});

  /// Converts object into query string parameters
  Map<String, dynamic> toJson() {
    return {"OwnerType": ownerType, "PageNumber": pageNumber, "PageSize": pageSize};
  }
}
