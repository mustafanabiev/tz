part of 'profile_cubit.dart';

class ProfileState {
  ProfileState({required this.isAuth, this.image});

  final bool isAuth;
  final File? image;

  ProfileState copyWith({
    bool? isAuth,
    File? image,
  }) {
    return ProfileState(
      isAuth: isAuth ?? this.isAuth,
      image: image ?? this.image,
    );
  }
}
