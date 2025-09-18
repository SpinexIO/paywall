/// Request model for fetching terminals with pagination.
class TerminalRequest {
  final int pageIndex;
  final int pageSize;

  TerminalRequest({required this.pageIndex, required this.pageSize});

  Map<String, dynamic> toJson() {
    return {"pageIndex": pageIndex, "pageSize": pageSize};
  }
}

/// Terminal item model representing a single terminal.
class TerminalItem {
  final String id;
  final String connectionId;
  final int brandId;
  final int providerId;
  final int regionId;
  final String connectionName;
  final String? sourceId;
  final String terminalId;
  final String serialNo;
  final String? sourceCreatedDate;
  final String? sourceUpdateDate;
  final String merchantId;

  TerminalItem({
    required this.id,
    required this.connectionId,
    required this.brandId,
    required this.providerId,
    required this.regionId,
    required this.connectionName,
    this.sourceId,
    required this.terminalId,
    required this.serialNo,
    this.sourceCreatedDate,
    this.sourceUpdateDate,
    required this.merchantId,
  });

  factory TerminalItem.fromJson(Map<String, dynamic> json) {
    return TerminalItem(
      id: json['Id'] as String,
      connectionId: json['ConnectionId'] as String,
      brandId: json['BrandId'] as int,
      providerId: json['ProviderId'] as int,
      regionId: json['RegionId'] as int,
      connectionName: json['ConnectionName'] as String,
      sourceId: json['SourceId'] as String?,
      terminalId: json['TerminalId'] as String,
      serialNo: json['SerialNo'] as String,
      sourceCreatedDate: json['SourceCreatedDate'] as String?,
      sourceUpdateDate: json['SourceUpdateDate'] as String?,
      merchantId: json['MerchantId'] as String,
    );
  }
}

/// Pagination metadata for terminal list response.
class TerminalPagination {
  final int currentPage;
  final int pageCount;
  final int pageSize;
  final int totalCount;

  TerminalPagination({required this.currentPage, required this.pageCount, required this.pageSize, required this.totalCount});

  factory TerminalPagination.fromJson(Map<String, dynamic> json) {
    return TerminalPagination(
      currentPage: json['CurrentPage'] as int,
      pageCount: json['PageCount'] as int,
      pageSize: json['PageSize'] as int,
      totalCount: json['TotalCount'] as int,
    );
  }
}

/// Response model for terminal list request.
class TerminalResponse {
  final List<TerminalItem> items;
  final TerminalPagination pagination;
  final bool failed;
  final bool succeeded;
  final String? message;
  final String? clientMessage;
  final int? errorCode;

  TerminalResponse({
    required this.items,
    required this.pagination,
    required this.failed,
    required this.succeeded,
    this.message,
    this.clientMessage,
    this.errorCode,
  });

  factory TerminalResponse.fromJson(Map<String, dynamic> json) {
    final result = json['Result'] as Map<String, dynamic>;
    return TerminalResponse(
      items: (result['Items'] as List<dynamic>).map((e) => TerminalItem.fromJson(e as Map<String, dynamic>)).toList(),
      pagination: TerminalPagination.fromJson(result['Pagination'] as Map<String, dynamic>),
      failed: json['Failed'] as bool,
      succeeded: json['Succeeded'] as bool,
      message: json['Message'] as String?,
      clientMessage: json['ClientMessage'] as String?,
      errorCode: json['ErrorCode'] as int?,
    );
  }
}
