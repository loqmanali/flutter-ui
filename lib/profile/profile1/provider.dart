import 'user.dart';

class ProfileProvider {
  static Profile getProfile() {
    return Profile(
      user: User(
        name: 'Loqman Ali',
        address: 'ZetaPark block B2 - b-15-8, Kuala Lumpur',
        about:
            'I am software Engineer I am software Engineer I am software Engineer I am software Engineer I am software Engineer I am software Engineer I am software Engineer I am software Engineer',
      ),
      followers: 2318,
      following: 364,
      friends: 1050,
    );
  }
}
