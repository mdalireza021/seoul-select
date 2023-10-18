class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;
  int? responseCode = 0;

  ApiResponse.empty() : status = Status.EMPTY;

  ApiResponse.loading([String? message, this.responseCode]) {
    this.message = message ?? 'Please wait';
    status = Status.LOADING;
  }

  ApiResponse.completed(this.data, {this.responseCode}) : status = Status.COMPLETED;

  ApiResponse.error(this.message, {this.responseCode}) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { EMPTY, LOADING, COMPLETED, ERROR }