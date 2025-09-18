/// Receipt Options model
class ReceiptOptions {
  final bool topSupport;
  final ReceiptText? top;
  final bool bottomSupport;
  final ReceiptText? bottom;

  ReceiptOptions({required this.topSupport, this.top, required this.bottomSupport, this.bottom});

  Map<String, dynamic> toJson() => {
    'TopSupport': topSupport,
    if (top != null) 'Top': top!.toJson(),
    'BottomSupport': bottomSupport,
    if (bottom != null) 'Bottom': bottom!.toJson(),
  };

  factory ReceiptOptions.fromJson(Map<String, dynamic> json) {
    return ReceiptOptions(
      topSupport: json['TopSupport'],
      top: json['Top'] != null ? ReceiptText.fromJson(json['Top']) : null,
      bottomSupport: json['BottomSupport'],
      bottom: json['Bottom'] != null ? ReceiptText.fromJson(json['Bottom']) : null,
    );
  }
}

/// Nested text model for receipt options
class ReceiptText {
  final String text;
  final int fontSize;

  ReceiptText({required this.text, required this.fontSize});

  Map<String, dynamic> toJson() => {'Text': text, 'FontSize': fontSize};

  factory ReceiptText.fromJson(Map<String, dynamic> json) {
    return ReceiptText(text: json['Text'], fontSize: json['FontSize']);
  }
}
