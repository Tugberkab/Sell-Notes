import 'package:equatable/equatable.dart';

class NoteUser extends Equatable {
  final String id;
  final String? name;
  final String? surname;
  final String? username;
  final String? email;

  const NoteUser({
    required this.id,
    this.name,
    this.surname,
    this.username,
    this.email,
  });

  static const empty = NoteUser(id: '');

  bool get isEmpty => this == NoteUser.empty;

  bool get isNotEmpty => this != NoteUser.empty;

  @override
  List<Object?> get props => [id, name, surname, username, email];

  static const NoteUser emptyUser =
      NoteUser(id: '', name: '', surname: '', username: '', email: '');
}
