/// Request model for Refund API.
class RefundRequest {
  final String date;
  final String merchantUniqueCode;
  final bool? completePartialRefund;
  final MarketPlaceRefund? marketPlace;

  RefundRequest({required this.date, required this.merchantUniqueCode, this.completePartialRefund, this.marketPlace});

  Map<String, dynamic> toJson() {
    return {
      'Date': date,
      'MerchantUniqueCode': merchantUniqueCode,
      if (completePartialRefund != null) 'CompletePartialRefund': completePartialRefund,
      if (marketPlace != null) 'MarketPlace': marketPlace!.toJson(),
    };
  }
}

class MarketPlaceRefund {
  final bool deleteExistingRecords;

  MarketPlaceRefund({required this.deleteExistingRecords});

  Map<String, dynamic> toJson() {
    return {'DeleteExistingRecords': deleteExistingRecords};
  }
}
