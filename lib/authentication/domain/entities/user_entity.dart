import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String email;
  final String phoneNumber;
  final String displayName;

  const UserEntity({
    required this.id,
    required this.email,
    required this.phoneNumber,
    required this.displayName,
  });

  static const empty = UserEntity(id: '', email: '', phoneNumber: '', displayName: '');

  UserEntity copyWith({
    String? email,
    String? displayName,
    String? phoneNumber,
  }) {
    return UserEntity(
      id: this.id,
      displayName: displayName ?? this.displayName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email:  email ?? this.email,
    );
  }

  @override
  List<Object?> get props => [id, email, phoneNumber, displayName];
}
