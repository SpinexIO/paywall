import 'wallet_transaction_response.dart';

class WalletTransactionListResponse {
  final List<WalletTransactionResponseData> items;
  final int pageNumber;
  final int totalPages;
  final int totalCount;
  final bool hasPreviousPage;
  final bool hasNextPage;

  WalletTransactionListResponse({
    required this.items,
    required this.pageNumber,
    required this.totalPages,
    required this.totalCount,
    required this.hasPreviousPage,
    required this.hasNextPage,
  });

  factory WalletTransactionListResponse.fromJson(Map<String, dynamic> json) {
    return WalletTransactionListResponse(
      items: (json['Items'] as List<dynamic>).map((e) => WalletTransactionResponseData.fromJson(e)).toList(),
      pageNumber: json['PageNumber'],
      totalPages: json['TotalPages'],
      totalCount: json['TotalCount'],
      hasPreviousPage: json['HasPreviousPage'],
      hasNextPage: json['HasNextPage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Items': items.map((e) => e.toJson()).toList(),
      'PageNumber': pageNumber,
      'TotalPages': totalPages,
      'TotalCount': totalCount,
      'HasPreviousPage': hasPreviousPage,
      'HasNextPage': hasNextPage,
    };
  }
}
