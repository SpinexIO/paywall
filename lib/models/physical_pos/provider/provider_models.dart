/// Represents a single service parameter for a provider.
class ServiceParameter {
  final String name;
  final String type;
  final int groupType;
  final String desciption;
  final String length;
  final bool isRequired;
  final String? value;

  ServiceParameter({
    required this.name,
    required this.type,
    required this.groupType,
    required this.desciption,
    required this.length,
    required this.isRequired,
    this.value,
  });

  factory ServiceParameter.fromJson(Map<String, dynamic> json) {
    return ServiceParameter(
      name: json['Name'] as String,
      type: json['Type'] as String,
      groupType: json['GroupType'] as int,
      desciption: json['Desciption'] as String,
      length: json['Length'] as String,
      isRequired: json['IsRequired'] as bool,
      value: json['Value'] as String?,
    );
  }
}

/// Represents a provider.
class Provider {
  final int brand;
  final int provider;
  final int region;
  final bool isActive;
  final String name;
  final bool isReporting;
  final bool isAsyncPayment;
  final bool isSocketPayment;
  final List<ServiceParameter> serviceParameters;

  Provider({
    required this.brand,
    required this.provider,
    required this.region,
    required this.isActive,
    required this.name,
    required this.isReporting,
    required this.isAsyncPayment,
    required this.isSocketPayment,
    required this.serviceParameters,
  });

  factory Provider.fromJson(Map<String, dynamic> json) {
    return Provider(
      brand: json['Brand'] as int,
      provider: json['Provider'] as int,
      region: json['Region'] as int,
      isActive: json['IsActive'] as bool,
      name: json['Name'] as String,
      isReporting: json['IsReporting'] as bool,
      isAsyncPayment: json['IsAsyncPayment'] as bool,
      isSocketPayment: json['IsSocketPayment'] as bool,
      serviceParameters: (json['ServiceParameters'] as List<dynamic>).map((e) => ServiceParameter.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }
}

/// Represents a brand.
class Brand {
  final int id;
  final int brand;
  final String name;
  final bool isActive;

  Brand({required this.id, required this.brand, required this.name, required this.isActive});

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(id: json['Id'] as int, brand: json['Brand'] as int, name: json['Name'] as String, isActive: json['IsActive'] as bool);
  }
}

/// Represents a region.
class Region {
  final int id;
  final int region;
  final String name;
  final bool isActive;

  Region({required this.id, required this.region, required this.name, required this.isActive});

  factory Region.fromJson(Map<String, dynamic> json) {
    return Region(id: json['Id'] as int, region: json['Region'] as int, name: json['Name'] as String, isActive: json['IsActive'] as bool);
  }
}

/// Represents the full provider list response.
class ProviderResponse {
  final List<Provider> providers;
  final List<Brand> brands;
  final List<Region> regions;
  final int errorCode;
  final bool succeeded;
  final bool failed;
  final String message;
  final String clientMessage;

  ProviderResponse({
    required this.providers,
    required this.brands,
    required this.regions,
    required this.errorCode,
    required this.succeeded,
    required this.failed,
    required this.message,
    required this.clientMessage,
  });

  factory ProviderResponse.fromJson(Map<String, dynamic> json) {
    return ProviderResponse(
      providers: (json['Providers'] as List<dynamic>).map((e) => Provider.fromJson(e as Map<String, dynamic>)).toList(),
      brands: (json['Brands'] as List<dynamic>).map((e) => Brand.fromJson(e as Map<String, dynamic>)).toList(),
      regions: (json['Regions'] as List<dynamic>).map((e) => Region.fromJson(e as Map<String, dynamic>)).toList(),
      errorCode: json['ErrorCode'] as int? ?? 0,
      succeeded: json['Succeeded'] as bool? ?? false,
      failed: json['Failed'] as bool? ?? false,
      message: json['Message'] as String? ?? "",
      clientMessage: json['ClientMessage'] as String? ?? "",
    );
  }
}
