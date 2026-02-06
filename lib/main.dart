import 'package:flutter/material.dart';

void main(){
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Followers(),
      )
  );
}

class Followers extends StatefulWidget {
  const Followers({super.key});

  @override
  State<Followers> createState() => _FollowersState();
}

class _FollowersState extends State<Followers> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Suggested for you" ,style:TextStyle(color: Colors.black ,fontSize: 20 , fontWeight: FontWeight.w700)),
        leading: Icon(Icons.arrow_back_ios_new_rounded , color: Colors.black),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            makeUser(image: 'assets/images/sea2.jpg', name: 'Nada', username: 'nadaaa12'),
            makeUser(image: 'assets/images/hot5.jpg', name: 'Mariam', username: 'maryam22'),
            makeUser(image: 'assets/images/g2.jpg', name: 'Nour', username: 'nour55'),
            makeUser(image: 'assets/images/gg1.jpg', name: 'Reem', username: 'rcsdv1'),
            makeUser(image: 'assets/images/hot2.jpg', name: 'Haneen', username: 'sadcadev0'),
          ],
        ),
      ),
    );
  }

  Widget makeUser({required String image, required String name, required String username}) {
    bool isFollowed = false;

    return StatefulBuilder(
      builder: (context, setStateSB) {
        return Container(
          padding: EdgeInsets.only(left: 20 , right: 20 , top: 10 , bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: TextStyle(color: Colors.grey[900], fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 3),
                      Text("@$username", style: TextStyle(fontSize: 15, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
              MaterialButton(
                color: isFollowed ? Colors.white : Colors.grey,
                onPressed: () {
                  setStateSB(() {
                    isFollowed = !isFollowed;
                  });
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                child: Text(isFollowed ? "Unfollow" : "Follow", style: TextStyle(color: Colors.black)),
              )
            ],
          ),
        );
      },
    );
  }
}
