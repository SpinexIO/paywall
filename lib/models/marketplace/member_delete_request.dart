/// Request model for deleting a member.
/// Either [id] or [memberExternalId] must be provided.
class MemberDeleteRequest {
  final int? id;
  final String? memberExternalId;

  MemberDeleteRequest({this.id, this.memberExternalId}) : assert(id != null || memberExternalId != null, "Either id or memberExternalId must be provided.");

  Map<String, dynamic> toJson() {
    return {"Id": id, "MemberExternalId": memberExternalId};
  }
}
