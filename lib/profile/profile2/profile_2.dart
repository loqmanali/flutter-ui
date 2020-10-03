class User {
  String name, address, about;

  User({
    this.name,
    this.address,
    this.about,
  });
}

class Profile2 {
  User user;
  int following, followers, friends;

  Profile2({
    this.user,
    this.following,
    this.followers,
    this.friends,
  });
}
