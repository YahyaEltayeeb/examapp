abstract class TokenLocalDataSource{
Future<void>saveToken(String token);
Future<String?>getToken();
}