enum Status { LOADING, COMPLETED, ERROR }

class StatusResponse<T> {
  Status status;
  T body;
  String message;

  StatusResponse({this.status, this.body, this.message});

  StatusResponse.loading({this.message}) : status = Status.LOADING;
  StatusResponse.error(this.message) : status = Status.ERROR;
  StatusResponse.completed(this.body, {this.message})
      : status = Status.COMPLETED;

  bool get hasError => status == Status.ERROR;
  bool get isLoading => status == Status.LOADING;
  bool get isCompleted => status == Status.COMPLETED;
}
