// Created an abstract class. It’s a simple blueprint for a result with a
// generic type T.
abstract class Result<T> {}

// Created the Success class to extend Result and hold a value when the
// response is successful. This could hold JSON data, for example.
class Success<T> extends Result<T> {
  final T value;
  Success(this.value);
}

// Created the Error class to extend Result and hold an exception. This will
// model errors that occur during an HTTP call, like using the wrong credentials
// or trying to fetch data without authorization.
class Error<T> extends Result<T> {
  final Exception exception;
  Error(this.exception);
}
