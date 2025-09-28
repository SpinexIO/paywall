import 'package:paywall/models/wallet/campaign/create_campaign_response.dart';
import 'package:paywall/models/wallet/campaign/get_active_campaigns_request.dart';
import 'package:paywall/models/wallet/campaign/get_active_campaigns_response.dart';
import 'package:paywall/models/wallet/campaign/get_campaign_by_id_response.dart';
import 'package:paywall/models/wallet/campaign/get_campaign_by_name_request.dart';
import 'package:paywall/models/wallet/campaign/get_campaign_by_name_response.dart';
import 'package:paywall/models/wallet/campaign/update_campaign_request.dart';
import 'package:paywall/utils/api_constants.dart';

import '../../models/base_response.dart';
import '../../models/wallet/campaign/create_campaign_request.dart';
import '../../services/base_service.dart';

class CampaignService extends BaseService {

  /// Creates a new campaign.
  /// Hint: Calls POST /v1/campaign
  Future<BaseResponse<CampaignResponseData>> createCampaign({required CreateCampaignRequest request}) {
    return post<CampaignResponseData>(
      '${ApiConstants.baseUrl}/v1/campaign',
      data: request.toJson(),
      requiresAuth: true,
      fromJsonT: (dynamic json) => CampaignResponseData.fromJson(json as Map<String, dynamic>),
    );
  }
  /// Updates an existing campaign.
  /// Hint: Calls PUT /v1/campaign
  Future<BaseResponse<CampaignResponseData>> updateCampaign({required UpdateCampaignRequest request}) {
    return put<CampaignResponseData>(
      '${ApiConstants.baseUrl}/v1/campaign',
      data: request.toJson(),
      requiresAuth: true,
      fromJsonT: (dynamic json) => CampaignResponseData.fromJson(json as Map<String, dynamic>),
    );
  }
  /// Gets campaign records by name.
  /// Hint: Calls GET /v1/campaign/by/name
  Future<BaseResponse<CampaignByNameListData>> getCampaignByName({required GetCampaignByNameRequest request}) {
    return get<CampaignByNameListData>(
      '${ApiConstants.baseUrl}/v1/campaign/by/name',
      queryParameters: request.toQueryParams(),
      requiresAuth: true,
      fromJsonT: (dynamic json) => CampaignByNameListData.fromJson(json),
    );
  }

  /// Gets campaign details by Id.
  /// Hint: Calls GET /v1/campaign/{id}
  Future<BaseResponse<CampaignByIdResponseData>> getCampaignById({required String id}) {
    return get<CampaignByIdResponseData>(
      '${ApiConstants.baseUrl}/v1/campaign/$id',
      requiresAuth: true,
      fromJsonT: (dynamic json) => CampaignByIdResponseData.fromJson(json as Map<String, dynamic>),
    );
  }

  /// Deactivates a campaign.
  /// Hint: Calls PUT /v1/campaign/deactivate
  Future<BaseResponse<bool>> deactivateCampaign(String id) {
    return put<bool>(
      '${ApiConstants.baseUrl}/v1/campaign/deactivate',
      data: {"Id": id},
      requiresAuth: true,
      fromJsonT: (dynamic json) => (json as bool?) ?? false,
    );
  }
  /// Activates a campaign.
  /// Hint: Calls POST /v1/campaign/activate
  Future<BaseResponse<bool>> activateCampaign(String id) {
    return post<bool>(
      '${ApiConstants.baseUrl}/v1/campaign/activate',
      data: {"Id": id},
      requiresAuth: true,
      fromJsonT: (dynamic json) => (json as bool?) ?? false,
    );
  }
  /// Activates a campaign.
  /// Hint: Calls POST /v1/campaign
  Future<BaseResponse<bool>> deleteCampaign(String id) {
    return delete<bool>(
      '${ApiConstants.baseUrl}/api/v1/campaign',
      data: {"Id": id},
      requiresAuth: true,
      fromJsonT: (dynamic json) => (json as bool?) ?? false,
    );
  }
  /// Activates a campaign.
  /// Hint: Calls POST /v1/campaign
  Future<BaseResponse<bool>> deleteAllCampaign() {
    return delete<bool>(
      '${ApiConstants.baseUrl}/api/v1/campaign/all',
      requiresAuth: true,
      fromJsonT: (dynamic json) => (json as bool?) ?? false,
    );
  }
  /// Gets active campaigns with pagination.
  /// Hint: Calls GET /v1/campaign/active
  Future<BaseResponse<ActiveCampaignsListData>> getActiveCampaigns({required GetActiveCampaignsRequest request}) {
    return get<ActiveCampaignsListData>(
      '${ApiConstants.baseUrl}/v1/campaign/active',
      queryParameters: request.toQueryParams(),
      requiresAuth: true,
      fromJsonT: (dynamic json) => ActiveCampaignsListData.fromJson(json as Map<String, dynamic>),
    );
  }
}
