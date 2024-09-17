class NetworkResponse {
  final int statusCode;
  final bool isSuccess;
  dynamic responseData;
  String? errorMessage;

  NetworkResponse({
    required this.isSuccess,
    required this.statusCode,
    this.responseData,
    this.errorMessage = 'Something went wrong',
  });
}
