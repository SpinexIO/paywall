/// API ile ilgili sabitler ve endpoint yolları.
///
/// İleride environment (prod, staging, test) bazlı yönetim
/// gerekiyorsa burada kolayca genişletilebilir.
class ApiConstants {
  /// Base URL - developer.paywall.one dokümantasyonuna göre güncellenmeli.
  static const String baseUrl = "https://developer.paywall.one/api";

  // Authentication
  static const String authToken = "/auth/token";

  // Örnek diğer endpoint placeholder’ları (şimdilik boş)
  static const String subscriptions = "/subscriptions";
  static const String entitlements = "/entitlements";
  static const String webhooks = "/webhooks";
  static const String reports = "/reports";
}
