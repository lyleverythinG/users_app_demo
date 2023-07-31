import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/src/either.dart';
import 'package:http/http.dart' as http;
import 'package:users_app_demo/core/reusable_widgets/failure.dart';
import 'package:users_app_demo/features/home/data/repository/users_repo.dart';
import 'package:users_app_demo/features/home/domain/model/users.dart';

void main() {
  group('UsersRepo Test', () {
    test('should return a list of Users when the http call is successful',
        () async {
      const jsonResponse =
          '[{"id": "1", "name": "John", "imageUrl": "https://www.alchinlong.com/wp-content/uploads/2015/09/sample-profile.png"},'
          '{"id": "2", "name": "Chris", "imageUrl": "https://www.alchinlong.com/wp-content/uploads/2015/09/sample-profile.png"},'
          '{"id": "3", "name": "Mark", "imageUrl": "https://www.alchinlong.com/wp-content/uploads/2015/09/sample-profile.png"}]';
      final mockClient = _MockHttpClient(jsonResponse, 200);
      final usersRepo = UsersRepo(httpClient: mockClient);
      final result = await usersRepo.getUsers();

      expect(result.isRight(), true);
      final userList = result.fold(
        (failure) => failure,
        (data) => data,
      );

      expect(userList, isA<List<Users>>());
    });
    test('should return a Failure when the http call fails', () async {
      final mockClient =
          _MockHttpClient('Error', 404); // Simulate a failed HTTP response
      final usersRepo = UsersRepo(httpClient: mockClient);
      final Either<Failure, List<Users>> result = await usersRepo.getUsers();

      expect(result.isLeft(), true);

      final failure = result.fold(
        (failure) => failure,
        (data) => data,
      );

      expect(failure, isA<Failure>());
    });
  });
}

class _MockHttpClient extends http.BaseClient {
  final String _responseBody;
  final int _statusCode;

  _MockHttpClient(this._responseBody, this._statusCode);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final response = http.Response(_responseBody, _statusCode);
    return http.StreamedResponse(
      http.ByteStream.fromBytes(utf8.encode(_responseBody)),
      _statusCode,
      headers: response.headers,
      request: response.request,
      isRedirect: response.isRedirect,
      persistentConnection: response.persistentConnection,
      reasonPhrase: response.reasonPhrase,
    );
  }
}
