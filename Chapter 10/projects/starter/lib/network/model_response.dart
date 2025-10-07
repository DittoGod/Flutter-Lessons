/// A sealed class that represents the result of an operation.
/// It can be either a [Success] or an [Error].
sealed class Result<T> {}

/// Represents a successful result of an operation.
class Success<T> extends Result<T> {
  /// The value of the successful result.
  final T value;

  /// Creates a new [Success] instance.
  Success(this.value);
}

/// Represents an error result of an operation.
class Error<T> extends Result<T> {
  /// The exception that caused the error.
  final Exception exception;

  /// Creates a new [Error] instance.
  Error(this.exception);
}
