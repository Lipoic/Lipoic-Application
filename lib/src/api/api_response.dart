import 'dart:convert';

import 'package:lipoic/src/api/code.dart';

class Response<T> {
  final Code code;
  final String message;
  final T? data;

  const Response({
    required this.code,
    required this.message,
    this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'code': code.value,
      'message': message,
      'data': data,
    };
  }

  factory Response.fromMap(Map<String, dynamic> map) {
    return Response<T>(
      code: Code.values.firstWhere((value) => value == map['code']),
      message: map['message'],
      data: map['data'] != null
          ? T.noSuchMethod(
              Invocation.method(const Symbol('fromMap'), map['data']))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Response.fromJson(String source) =>
      Response.fromMap(json.decode(source));

  @override
  String toString() => 'Response(code: $code, message: $message, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Response<T> &&
        other.code == code &&
        other.message == message &&
        other.data == data;
  }

  @override
  int get hashCode => code.hashCode ^ message.hashCode ^ data.hashCode;
}
