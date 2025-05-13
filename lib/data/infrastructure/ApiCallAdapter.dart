import 'package:movies_app/data/infrastructure/result.dart';
import 'package:retrofit/call_adapter.dart';

class ApiCallAdapter<T> extends CallAdapter<Future<T>, Future<Result<T>>> {
  @override
  Future<Result<T>> adapt(Future<T> Function() call) async {
    try {
      return Result.ok(await call());
    } catch (e) {
      return Result.error(e.toString());
    }
  }

}
