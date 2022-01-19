import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String? name;
  final String? surname;
  final String? username;
  final String? email;

  const User({
    required this.id,
    this.name,
    this.surname,
    this.username,
    this.email,
  });

  static const empty = User(id: '');

  bool get isEmpty => this == User.empty;

  bool get isNotEmpty => this != User.empty;

  @override
  List<Object?> get props => [id, name, surname, username, email];

  static const User emptyUser =
      User(id: '', name: '', surname: '', username: '', email: '');
}
