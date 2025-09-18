/// Request model for fetching earnings by member Id.
class EarningByMemberRequest {
  final int memberId;
  final int start;
  final int length;
  final String sortValue; // "asc" or "desc"
  final String sortColumn; // only "Id" supported
  final DateTime? dateFrom;
  final DateTime? dateTo;

  EarningByMemberRequest({
    required this.memberId,
    required this.start,
    required this.length,
    required this.sortValue,
    required this.sortColumn,
    this.dateFrom,
    this.dateTo,
  });

  /// Converts request parameters into headers map.
  Map<String, String> toHeaders() {
    final headers = <String, String>{
      'memberid': memberId.toString(),
      'start': start.toString(),
      'length': length.toString(),
      'sortvalue': sortValue,
      'sortcolumn': sortColumn,
    };

    if (dateFrom != null) {
      headers['datefrom'] = dateFrom!.toIso8601String();
    }
    if (dateTo != null) {
      headers['dateto'] = dateTo!.toIso8601String();
    }

    return headers;
  }
}
