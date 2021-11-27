import 'package:equatable/equatable.dart';

abstract class UseCases<Type, Params> {
  // Future<Either<Failure, Type>> call(Params params);
  Future<void> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}
