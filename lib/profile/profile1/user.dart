class User {
  String name;
  String address;
  String about;

  User({
    this.name,
    this.address,
    this.about,
  });
}

class Profile {
  User user;
  int followers;
  int following;
  int friends;

  Profile({
    this.user,
    this.followers,
    this.following,
    this.friends,
  });
}
