/// Request model for fetching connection list.
class ConnectionRequest {
  final int pageIndex;
  final int pageSize;

  ConnectionRequest({required this.pageIndex, required this.pageSize});

  Map<String, dynamic> toJson() {
    return {'pageIndex': pageIndex, 'pageSize': pageSize};
  }
}

/// Represents a single connection item.
class ConnectionItem {
  final String id;
  final String name;
  final String displayName;
  final int endOfDayId;
  final bool isReporting;
  final bool isAsyncPayment;
  final bool isSocketPayment;
  final int brandId;
  final int providerId;
  final int regionId;
  final bool isProd;
  final bool isConnected;

  ConnectionItem({
    required this.id,
    required this.name,
    required this.displayName,
    required this.endOfDayId,
    required this.isReporting,
    required this.isAsyncPayment,
    required this.isSocketPayment,
    required this.brandId,
    required this.providerId,
    required this.regionId,
    required this.isProd,
    required this.isConnected,
  });

  factory ConnectionItem.fromJson(Map<String, dynamic> json) {
    return ConnectionItem(
      id: json['Id'] as String,
      name: json['Name'] as String,
      displayName: json['DisplayName'] as String,
      endOfDayId: json['EndOfDayId'] as int,
      isReporting: json['IsReporting'] as bool,
      isAsyncPayment: json['IsAsyncPayment'] as bool,
      isSocketPayment: json['IsSocketPayment'] as bool,
      brandId: json['BrandId'] as int,
      providerId: json['ProviderId'] as int,
      regionId: json['RegionId'] as int,
      isProd: json['IsProd'] as bool,
      isConnected: json['IsConnected'] as bool,
    );
  }
}

/// Pagination details for connection list response.
class Pagination {
  final int currentPage;
  final int pageCount;
  final int pageSize;
  final int totalCount;

  Pagination({required this.currentPage, required this.pageCount, required this.pageSize, required this.totalCount});

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      currentPage: json['CurrentPage'] as int,
      pageCount: json['PageCount'] as int,
      pageSize: json['PageSize'] as int,
      totalCount: json['TotalCount'] as int,
    );
  }
}

/// The full result object containing items and pagination.
class ConnectionResult {
  final List<ConnectionItem> items;
  final Pagination pagination;

  ConnectionResult({required this.items, required this.pagination});

  factory ConnectionResult.fromJson(Map<String, dynamic> json) {
    return ConnectionResult(
      items: (json['Items'] as List<dynamic>).map((e) => ConnectionItem.fromJson(e as Map<String, dynamic>)).toList(),
      pagination: Pagination.fromJson(json['Pagination']),
    );
  }
}

/// Top-level connection list response.
class ConnectionResponse {
  final ConnectionResult result;
  final int? errorCode;
  final bool succeeded;
  final bool failed;
  final String? message;
  final String? clientMessage;

  ConnectionResponse({required this.result, this.errorCode, required this.succeeded, required this.failed, this.message, this.clientMessage});

  factory ConnectionResponse.fromJson(Map<String, dynamic> json) {
    return ConnectionResponse(
      result: ConnectionResult.fromJson(json['Result']),
      errorCode: json['ErrorCode'] as int?,
      succeeded: json['Succeeded'] as bool,
      failed: json['Failed'] as bool,
      message: json['Message'] as String?,
      clientMessage: json['ClientMessage'] as String?,
    );
  }
}
