import '../../common/customer.dart';
import '../../common/method.dart';
import '../../common/product.dart';
import '../../common/receipt_options.dart';

/// Sync Payment Sale Request model
class PaymentSyncSaleRequest {
  final String? terminalId;
  final String? terminalTagCode;
  final bool? sendNotificationDeviceDisconnected;
  final String merchantUniqueCode;
  final String? displayCode;
  final double amount;
  final int currencyId;
  final List<Method>? methods;
  final String? callbackAddress;
  final bool? splitPaymentSupport;
  final Customer? customer;
  final List<Product> products;
  final bool? skipPrintCustomer;
  final bool? skipPrintMerchant;
  final bool? skipPaymentOptionScreen;
  final ReceiptOptions? receiptOptions;

  PaymentSyncSaleRequest({
    this.terminalId,
    this.terminalTagCode,
    this.sendNotificationDeviceDisconnected,
    required this.merchantUniqueCode,
    this.displayCode,
    required this.amount,
    required this.currencyId,
    this.methods,
    this.callbackAddress,
    this.splitPaymentSupport,
    this.customer,
    required this.products,
    this.skipPrintCustomer,
    this.skipPrintMerchant,
    this.skipPaymentOptionScreen,
    this.receiptOptions,
  });

  Map<String, dynamic> toJson() => {
    if (terminalId != null) 'TerminalId': terminalId,
    if (terminalTagCode != null) 'TerminalTagCode': terminalTagCode,
    if (sendNotificationDeviceDisconnected != null) 'SendNotificationDeviceDisconnected': sendNotificationDeviceDisconnected,
    'MerchantUniqueCode': merchantUniqueCode,
    if (displayCode != null) 'DisplayCode': displayCode,
    'Amount': amount,
    'CurrencyId': currencyId,
    if (methods != null) 'Methods': methods!.map((m) => m.toJson()).toList(),
    if (callbackAddress != null) 'CallbackAddress': callbackAddress,
    if (splitPaymentSupport != null) 'SplitPaymentSupport': splitPaymentSupport,
    if (customer != null) 'Customer': customer!.toJson(),
    'Products': products.map((p) => p.toJson()).toList(),
    if (skipPrintCustomer != null) 'SkipPrintCustomer': skipPrintCustomer,
    if (skipPrintMerchant != null) 'SkipPrintMerchant': skipPrintMerchant,
    if (skipPaymentOptionScreen != null) 'SkipPaymentOptionScreen': skipPaymentOptionScreen,
    if (receiptOptions != null) 'ReceiptOptions': receiptOptions!.toJson(),
  };
}
