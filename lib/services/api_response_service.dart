// ignore_for_file: constant_identifier_names
enum Status { LOADING, COMPLETED, ERROR }

class ApiResponseService<T> {
  Status status;

  T? data;

  String? message;

  ApiResponseService.loading(this.message) : status = Status.LOADING;

  ApiResponseService.completed(this.data) : status = Status.COMPLETED;

  ApiResponseService.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}
