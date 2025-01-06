// lib/env/env.dart

import 'package:envied/envied.dart';
import 'package:exam_feed/env/env.dart';
import 'package:exam_feed/env/env_fields.dart';

part 'development.g.dart';

@Envied(path: 'assets/env/development.env', name: 'Env', obfuscate: true)
final class DevEnv implements Env, EnvFields {
  @override
  @EnviedField(varName: 'BASE_URL')
  final String baseUrl = _Env.baseUrl;

  @override
  @EnviedField(varName: 'API_KEY')
  final String apiKey = _Env.apiKey;

  @override
  @EnviedField(varName: 'SECRET_KEY')
  final String secretKey = _Env.secretKey;

  @override
  @EnviedField(varName: 'ENCRYPTION_KEY')
  final String encryptionKey = _Env.encryptionKey;

  @override
  @EnviedField(varName: 'ENCRYPTION_VECTOR')
  final String encryptionVector = _Env.encryptionVector;

  @override
  @EnviedField(varName: 'SOCKET_BASE_URL')
  final String socketUrl = _Env.socketUrl;
}