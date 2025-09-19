import 'wallet_detail_response.dart';

/// Wallet List Data
/// Hint: Represents a paginated list of wallets for a specific owner.
class WalletListData {
  final List<WalletDetailResponseData> items;
  final int pageNumber;
  final int totalPages;
  final int totalCount;
  final bool hasPreviousPage;
  final bool hasNextPage;

  WalletListData({
    required this.items,
    required this.pageNumber,
    required this.totalPages,
    required this.totalCount,
    required this.hasPreviousPage,
    required this.hasNextPage,
  });

  /// Creates [WalletListData] from JSON
  factory WalletListData.fromJson(Map<String, dynamic> json) {
    return WalletListData(
      items: (json['Items'] as List<dynamic>).map((e) => WalletDetailResponseData.fromJson(e)).toList(),
      pageNumber: json['PageNumber'] ?? 0,
      totalPages: json['TotalPages'] ?? 0,
      totalCount: json['TotalCount'] ?? 0,
      hasPreviousPage: json['HasPreviousPage'] ?? false,
      hasNextPage: json['HasNextPage'] ?? false,
    );
  }

  /// Converts [WalletListData] to JSON
  Map<String, dynamic> toJson() {
    return {
      "Items": items.map((e) => e.toJson()).toList(),
      "PageNumber": pageNumber,
      "TotalPages": totalPages,
      "TotalCount": totalCount,
      "HasPreviousPage": hasPreviousPage,
      "HasNextPage": hasNextPage,
    };
  }
}
