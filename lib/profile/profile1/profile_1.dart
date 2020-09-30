import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'provider.dart';
import 'user.dart';

class Profile1 extends StatefulWidget {
  @override
  _Profile1State createState() => _Profile1State();
}

class _Profile1State extends State<Profile1> {
  Profile profile = ProfileProvider.getProfile();
  static Color _textColor = Color(0XFF4A4A4A);
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(),
      child: Stack(
        children: [
          Image.asset(
            'assets/profiles/land.jpg',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.45,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                'Profile',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),
              ),
              centerTitle: true,
              leading: IconButton(
                icon: Icon(FontAwesomeIcons.bars),
                onPressed: () {},
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(FontAwesomeIcons.cog),
                ),
              ],
            ),
            body: Stack(
              children: [
                CustomPaint(
                  painter: ProfilePainter(),
                  child: Container(),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.05,
                  top: MediaQuery.of(context).size.height * 0.20,
                  child: CircleAvatar(
                    minRadius: 40,
                    backgroundImage:
                        ExactAssetImage('assets/profiles/loqman.jpg'),
                  ),
                ),
                _bodyText(context),
                _bottomBar(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextStyle _bottomBarTitle = TextStyle(
    color: Colors.grey.shade400,
  );
  TextStyle _bottomBarCounter = TextStyle(
    color: _textColor,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  Widget _bottomBar(BuildContext context) {
    return Positioned(
      bottom: 35,
      left: 25,
      right: 25,
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
                profile.followers.toString(),
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
                profile.following.toString(),
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
                profile.friends.toString(),
                style: _bottomBarCounter,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _bodyText(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.34,
      bottom: 0,
      right: 25,
      left: 25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              profile.user.name,
              style: TextStyle(
                color: _textColor,
                fontWeight: FontWeight.w900,
                fontSize: 32,
              ),
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.location_on,
                color: Colors.grey.shade400,
              ),
              Text(
                profile.user.address,
                style: TextStyle(
                  color: _textColor,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 32.0,
              bottom: 16.0,
            ),
            child: Text(
              'ABOUT ME',
              style: TextStyle(
                color: _textColor,
                fontSize: 18,
                height: 1.4,
                letterSpacing: 1.1,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              profile.user.about,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    Paint paint = Paint();

    paint.color = Colors.white;
    path.lineTo(0, size.height * 0.27);
    path.lineTo(size.width, size.height * 0.36);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(
      0,
      size.height * 0.25,
    );
    path.close();
    canvas.drawPath(path, paint);

    // path.addPolygon([
    //   Offset(0, size.height * 0.35),
    //   Offset(size.width, size.height * 0.45),
    //   Offset(size.width, size.height),
    //   Offset(0, size.height),
    // ], true);

    // canvas.clipPath(path);
    // canvas.drawColor(Colors.white, BlendMode.color);

    // canvas.drawLine(
    //   Offset(0, size.height * 0.35),
    //   Offset(size.width, size.height * 0.45),
    //   Paint(),
    // );
    //
    // canvas.drawLine(
    //   Offset(size.width, size.height * 0.45),
    //   Offset(size.width, size.height),
    //   Paint(),
    // );
    //
    // canvas.drawLine(
    //   Offset(size.width, size.height),
    //   Offset(0, size.height),
    //   Paint(),
    // );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
