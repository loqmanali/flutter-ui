import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:profile/profile/profile2/provider2.dart';

import 'profile_2.dart';

class Profile extends StatefulWidget {
  @override
  _Profile2State createState() => _Profile2State();
}

class _Profile2State extends State<Profile> {
  Profile2 profile2 = Profile2Provider.getProfile2();
  static Color _textColor = Color(0XFF4A4A4A);
  TextStyle _bottomBarTitle = TextStyle(
    color: Colors.grey.shade400,
  );
  TextStyle _bottomBarCounter = TextStyle(
    color: _textColor,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Theme(
        data: ThemeData(),
        child: Stack(
          children: [
            Image.asset(
              'assets/profiles/back2.jpg',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(FontAwesomeIcons.bars),
                  onPressed: () {},
                ),
              ),
              body: Stack(
                children: [
                  _profileTitle(context),
                  _bodyContent(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileTitle(BuildContext context) {
    return Positioned(
      top: 15,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 135,
                  height: 135,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 115,
                  height: 115,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: ExactAssetImage('assets/profiles/loqman.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            profile2.user.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          Text(
            profile2.user.address,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _bodyContent(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.33,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _counter(context),
            Divider(
              thickness: 1,
              color: Colors.grey.shade200,
            ),
            ..._aboutMe(context),
            SizedBox(height: 8.0),
            _friends(context),
            SizedBox(height: 16.0),
            _contacts(context),
          ],
        ),
      ),
    );
  }

  Widget _counter(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'FOLLOWERS',
                style: _bottomBarTitle,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                profile2.followers.toString(),
                style: _bottomBarCounter,
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'FOLLOWING',
                style: _bottomBarTitle,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                profile2.following.toString(),
                style: _bottomBarCounter,
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'FRIENDS',
                style: _bottomBarTitle,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                profile2.friends.toString(),
                style: _bottomBarCounter,
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _aboutMe(BuildContext context) {
    return [
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 16.0,
        ),
        child: Text(
          'ABOUT ME',
          style: TextStyle(
            color: _textColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          profile2.user.about,
          style: TextStyle(
            color: _textColor,
            fontSize: 18,
            height: 1.2,
            letterSpacing: 1.2,
          ),
        ),
      ),
    ];
  }

  Widget _friends(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 16.0,
      ),
      child: Text(
        'FRIENDS (${profile2.friends.toString()})',
        style: TextStyle(
          color: _textColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _contacts(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: EdgeInsets.only(left: 10.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
            25,
            (index) => Container(
                  width: 50,
                  // height: 50,
                  margin: EdgeInsets.only(right: 15.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: ExactAssetImage('assets/profiles/loqman.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                )).toList(),
      ),
    );
  }
}
