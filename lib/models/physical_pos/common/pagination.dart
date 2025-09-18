/// Common pagination model used in API responses
class Pagination {
  final int currentPage;
  final int pageCount;
  final int pageSize;
  final int totalCount;

  Pagination({required this.currentPage, required this.pageCount, required this.pageSize, required this.totalCount});

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      currentPage: json['CurrentPage'] ?? 0,
      pageCount: json['PageCount'] ?? 0,
      pageSize: json['PageSize'] ?? 0,
      totalCount: json['TotalCount'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {'CurrentPage': currentPage, 'PageCount': pageCount, 'PageSize': pageSize, 'TotalCount': totalCount};
}
