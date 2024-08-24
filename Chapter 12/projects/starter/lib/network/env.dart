import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: 'lib/network/.env')
abstract class Env {
  @EnviedField(varName: 'apiKey')
  static const String apiKey = _Env.apiKey;
}
