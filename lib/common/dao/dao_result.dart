

class DataResult {
  var data;
  bool success;
  Function next;
  bool isEnd;

  DataResult(this.data, this.success, {this.next,this.isEnd});
}
