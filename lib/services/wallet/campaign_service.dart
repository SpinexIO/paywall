import 'package:paywall/models/wallet/campaign/create_campaign_response.dart';
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
}
