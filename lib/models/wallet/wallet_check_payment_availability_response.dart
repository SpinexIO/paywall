/// Wallet Check Payment Availability Response Model
class WalletCheckPaymentAvailabilityResponseData {
  final bool isAvailable;
  final String reasonIfUnavailable;
  final double maxAvailableAmount;
  final double walletBalance;
  final double giftBalance;
  final double blockedBalance;
  final double availableBalance;

  WalletCheckPaymentAvailabilityResponseData({
    required this.isAvailable,
    required this.reasonIfUnavailable,
    required this.maxAvailableAmount,
    required this.walletBalance,
    required this.giftBalance,
    required this.blockedBalance,
    required this.availableBalance,
  });

  /// Creates a [WalletCheckPaymentAvailabilityResponseData] from JSON
  factory WalletCheckPaymentAvailabilityResponseData.fromJson(Map<String, dynamic> json) {
    return WalletCheckPaymentAvailabilityResponseData(
      isAvailable: json["IsAvailable"] ?? false,
      reasonIfUnavailable: json["ReasonIfUnavailable"] ?? "",
      maxAvailableAmount: (json["MaxAvailableAmount"] as num?)?.toDouble() ?? 0,
      walletBalance: (json["WalletBalance"] as num?)?.toDouble() ?? 0,
      giftBalance: (json["GiftBalance"] as num?)?.toDouble() ?? 0,
      blockedBalance: (json["BlockedBalance"] as num?)?.toDouble() ?? 0,
      availableBalance: (json["AvailableBalance"] as num?)?.toDouble() ?? 0,
    );
  }
}
