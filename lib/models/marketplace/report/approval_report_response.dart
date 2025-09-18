/// Response model for marketplace approval report.
class ApprovalReportResponse {
  final List<ApprovalReportItem> approved;
  final List<ApprovalReportItem> notApproved;

  ApprovalReportResponse({required this.approved, required this.notApproved});

  factory ApprovalReportResponse.fromJson(Map<String, dynamic> json) {
    return ApprovalReportResponse(
      approved: (json['Approved'] as List<dynamic>).map((e) => ApprovalReportItem.fromJson(e)).toList(),
      notApproved: (json['NotApproved'] as List<dynamic>).map((e) => ApprovalReportItem.fromJson(e)).toList(),
    );
  }
}

/// Item representing product approval status.
class ApprovalReportItem {
  final int productId;

  ApprovalReportItem({required this.productId});

  factory ApprovalReportItem.fromJson(Map<String, dynamic> json) {
    return ApprovalReportItem(productId: json['ProductId'] as int);
  }
}
