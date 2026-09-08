import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pmobile913/db/ProfileDao.dart';
import 'package:pmobile913/domain/profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<Profile> futureProfile;

  @override
  void initState() {
    super.initState();
    futureProfile = ProfileDao().buscarProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F1F1F),

      appBar: AppBar(
        backgroundColor: Color(0xFF282829),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Profile",
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  color: Color(0xFFff6b00),
                  fontWeight: FontWeight.w800,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),

      body: FutureBuilder(
        future: futureProfile,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Profile profile = snapshot.requireData;
            return buildListView(profile);
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  buildListView(Profile profile) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 40),
          child: Center(
            child: CircleAvatar(
              foregroundImage: NetworkImage(
                'https://cdn-icons-png.flaticon.com/512/3106/3106921.png',
              ),
              backgroundColor: Color(0xFF6F6F6F),
              radius: 100,
            ),
          ),
        ),

        SizedBox(height: 15),

        Center(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: Color(0xFF2d2d2d),
              borderRadius: BorderRadius.circular(60),
            ),
            child: Text(
              profile.username,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),

        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(
            bottom: 1,
            left: 4,
            right: 4,
          ),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color(0xFF666666),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email: ${profile.email}',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Telephone: ${profile.telephone}',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
