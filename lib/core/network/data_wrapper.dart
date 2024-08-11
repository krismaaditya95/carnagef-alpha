
enum Status { loading, success, error, init }

/// this class work as a scaffold for our received data
/// via repositories
class DataWrapper<T>{
  T? data;
  Status? status;
  String? title;
  String? message;

  DataWrapper.init() : status = Status.init;
  DataWrapper.loading() : status = Status.loading;
  DataWrapper.success(this.data) : status = Status.success;
  DataWrapper.error(this.title, this.message) : status = Status.error;
}