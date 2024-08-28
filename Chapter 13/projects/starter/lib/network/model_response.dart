// Defines a sealed class. It's a simple blueprint for a result with a generic
// type T.
sealed class Result<T> {
}

// The Success class extends Result and holds a value when the response is
// successful. This could hold JSON data or a de-serialised class.
class Success<T> extends Result<T> {
  final T value;

  Success(this.value);
}

// The Error class extends Result and holds an Exception. This will model errors
// that occur during the HTTP call, like using the wrong credentials or trying
// to fetch data without authorization.
class Error<T> extends Result<T> {
  final Exception exception;

  Error(this.exception);
}