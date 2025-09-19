class PaginatedResponse<T> {
  final List<T> items;
  final int pageNumber;
  final int totalPages;
  final int totalCount;
  final bool hasPreviousPage;
  final bool hasNextPage;

  PaginatedResponse({
    required this.items,
    required this.pageNumber,
    required this.totalPages,
    required this.totalCount,
    required this.hasPreviousPage,
    required this.hasNextPage,
  });

  factory PaginatedResponse.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonT) {
    return PaginatedResponse<T>(
      items: (json['Items'] as List<dynamic>).map((item) => fromJsonT(item as Map<String, dynamic>)).toList(),
      pageNumber: json['PageNumber'],
      totalPages: json['TotalPages'],
      totalCount: json['TotalCount'],
      hasPreviousPage: json['HasPreviousPage'],
      hasNextPage: json['HasNextPage'],
    );
  }
}
