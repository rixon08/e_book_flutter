class ApiResponse<T> {
  final int count;
  final String? next;
  final String? previous;
  final T? data;
  final bool isSuccess; 

  ApiResponse({
    this.count = 0,
    this.next,
    this.previous,
    this.data,
    this.isSuccess = true
  });

  factory ApiResponse.fromJson(
      Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    return ApiResponse(
      count: json["count"] ?? 0,
      next: json["next"],
      previous: json["previous"],
      data: json["results"] != null ? fromJsonT(json["results"]) : null,
    );
  }

  bool get isLastData => next == null;
}