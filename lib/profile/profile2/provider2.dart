import 'package:profile/profile/profile2/profile_2.dart';

class Profile2Provider {
  static Profile2 getProfile2() {
    return Profile2(
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
