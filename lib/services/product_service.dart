import 'package:paywall/models/product/product_cargo_cost_define_request.dart';
import 'package:paywall/models/product/product_cargo_cost_request.dart';
import 'package:paywall/models/product/product_cargo_cost_response.dart';
import 'package:paywall/models/product/product_discount_request.dart';
import 'package:paywall/models/product/product_discount_response.dart';
import 'package:paywall/models/product/product_member_earning_increase_request.dart';
import 'package:paywall/models/product/product_member_earning_increase_response.dart';

import '../models/base_response.dart';
import '../models/product/product_list_request.dart';
import '../models/product/product_list_response.dart';
import '../utils/api_constants.dart';
import 'base_service.dart';

/// Service for product related operations
class ProductService extends BaseService {
  /// Retrieves the product list of a payment.
  /// Requires private API authentication headers.
  Future<BaseResponse<List<ProductListResponse>>> getProductList({
    required ProductListRequest request,
    required String apiKeyPrivate,
    required String apiClientPrivate,
  }) async {
    final response = await get(
      "${ApiConstants.baseUrl}/paywall/product",
      fromJsonT: (json) => (json as List).map((item) => ProductListResponse.fromJson(item)).toList(),
      headers: {'apikeyprivate': apiKeyPrivate, 'apiclientprivate': apiClientPrivate, ...request.toHeaders()},
    );

    return response;
  }

  /// Retrieves the cargo cost of a product by its productId.
  /// Requires private API authentication headers.
  Future<BaseResponse<ProductCargoCostResponse>> getProductCargoCost({
    required ProductCargoCostRequest request,
    required String apiKeyPrivate,
    required String apiClientPrivate,
  }) async {
    final response = await get(
      "${ApiConstants.baseUrl}/paywall/product/cargocost",
      fromJsonT: (json) => ProductCargoCostResponse.fromJson(json),
      headers: {'apikeyprivate': apiKeyPrivate, 'apiclientprivate': apiClientPrivate, ...request.toHeaders()},
    );

    return response;
  }
  /// Defines or updates the cargo cost for a product.
  /// Requires private API authentication headers.
  Future<BaseResponse<ProductCargoCostResponse>> defineProductCargoCost({
    required ProductCargoCostDefineRequest request,
    required String apiKeyPrivate,
    required String apiClientPrivate,
  }) async {
    final response = await post(
      "${ApiConstants.baseUrl}/paywall/product/cargocost",
      data: request.toJson(),
      fromJsonT: (json) => ProductCargoCostResponse.fromJson(json),
      headers: {'apikeyprivate': apiKeyPrivate, 'apiclientprivate': apiClientPrivate},
    );

    return response;
  }

  /// Retrieves the discount information of a product by its ProductId.
  /// Requires private API authentication headers.
  Future<BaseResponse<ProductDiscountResponse>> getProductDiscount({
    required int productId,
    required String apiKeyPrivate,
    required String apiClientPrivate,
  }) async {
    final response = await get(
      "${ApiConstants.baseUrl}/paywall/product/discount?productid=$productId",
      fromJsonT: (json) => ProductDiscountResponse.fromJson(json),
      headers: {'apikeyprivate': apiKeyPrivate, 'apiclientprivate': apiClientPrivate},
    );

    return response;
  }

  /// Defines a discount for a product.
  /// Requires private API authentication headers.
  Future<BaseResponse<ProductDiscountResponse>> defineProductDiscount({
    required ProductDiscountRequest request,
    required String apiKeyPrivate,
    required String apiClientPrivate,
  }) async {
    final response = await post(
      "${ApiConstants.baseUrl}/paywall/product/discount",
      data: request.toJson(),
      fromJsonT: (json) => ProductDiscountResponse.fromJson(json),
      headers: {'apikeyprivate': apiKeyPrivate, 'apiclientprivate': apiClientPrivate},
    );

    return response;
  }
  /// Increases the earning of a product for a member.
  /// Requires private API authentication headers.
  Future<BaseResponse<ProductMemberEarningIncreaseResponse>> increaseProductMemberEarning({
    required ProductMemberEarningIncreaseRequest request,
    required String apiKeyPrivate,
    required String apiClientPrivate,
  }) async {
    final response = await put(
      "${ApiConstants.baseUrl}/paywall/product/member/earning/increase",
      data: request.toJson(),
      fromJsonT: (json) => ProductMemberEarningIncreaseResponse.fromJson(json),
      headers: {'apikeyprivate': apiKeyPrivate, 'apiclientprivate': apiClientPrivate},
    );

    return response;
  }
  /// Decreases the earning of a product for a member.
  /// Requires private API authentication headers.
  Future<BaseResponse<ProductMemberEarningIncreaseResponse>> decreaseProductMemberEarning({
    required ProductMemberEarningIncreaseRequest request,
    required String apiKeyPrivate,
    required String apiClientPrivate,
  }) async {
    final response = await put(
      "${ApiConstants.baseUrl}/paywall/product/member/earning/decrease",
      data: request.toJson(),
      fromJsonT: (json) => ProductMemberEarningIncreaseResponse.fromJson(json),
      headers: {'apikeyprivate': apiKeyPrivate, 'apiclientprivate': apiClientPrivate},
    );

    return response;
  }

}
