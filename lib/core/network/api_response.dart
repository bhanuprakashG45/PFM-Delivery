import 'package:priya_freshmeats_delivery/core/network/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse({this.status, this.data, this.message});

  ApiResponse.loading([this.message]) : status = Status.loading;

  ApiResponse.completed(this.data) : status = Status.completed;

  ApiResponse.error([this.message]) : status = Status.error;

  @override
  String toString() {
    return 'Status: $status\nMessage: $message\nData: $data';
  }
}
