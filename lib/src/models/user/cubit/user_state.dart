part of 'user_cubit.dart';

class UserState extends Equatable {
  final NoteUser user;

  const UserState({
    required this.user,
  });

  @override
  List<Object> get props => [user];

  UserState copyWith({
    NoteUser? user,
  }) {
    return UserState(
      user: user ?? this.user,
    );
  }
}
