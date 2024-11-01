class ResponseModel<T> {
  final String requestId;
  final bool success;
  final String? message;
  final T? data;

  ResponseModel({
    required this.requestId,
    required this.success,
    this.message,
    this.data,
  });

  factory ResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) fromJsonT,
  ) {
    return ResponseModel<T>(
      requestId: json['request_id'] as String,
      success: json['success'] as bool,
      message: json['message'] as String?,
      data: json['data'] != null ? fromJsonT(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) {
    return {
      'request_id': requestId,
      'success': success,
      'message': message,
      'data': data != null ? toJsonT(data!) : null,
    };
  }
}
