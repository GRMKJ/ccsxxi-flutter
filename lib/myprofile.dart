import 'package:ccsxxi/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'utilities/profilemask.dart';
import 'listview.dart';

class MyProfile extends StatefulWidget{
  const MyProfile({super.key});
  
  @override
  State<MyProfile> createState() => MyProfileState();
}

class MyProfileState extends State<MyProfile>{
  
  @override
  Widget build(BuildContext context){
    return const Column(
      children: [
        TopSearchBar(),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: ProfileTitle()),
              SliverToBoxAdapter(child: ProfileUser()),
              ListSettings()
            ],
          )
        )
      ]
    );
  }
}

class ProfileTitle extends StatefulWidget{
  const ProfileTitle({super.key});
  
  @override
  State<ProfileTitle> createState() => ProfileTitleState();
}

class ProfileTitleState extends State<ProfileTitle>{
  
  @override
  Widget build(BuildContext context){
    return const Row(
        children: <Widget>[
          Expanded(
            child:
            Padding(
              padding: EdgeInsets.only(left: 15, top: 10, bottom: 10 ,right: 15),
              child: 
                Text.rich(
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  TextSpan(
                    text: "Mi Perfil",
                )
              )
            )
          )
        ],
      );
  }

}   

class ProfileUser extends StatefulWidget{
  const ProfileUser({super.key});
  
  @override
  State<ProfileUser> createState() => ProfileUserState();
}
class ProfileUserState extends State<ProfileUser>{
  @override
  Widget build(BuildContext context){
    return const Flex(
      direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.only(left:24.0, right: 8.0,top: 14, bottom: 14),
              child: Center(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: MaskedImage(asset: 'assets/images/profile.jpeg', mask: 'assets/images/circle.png'),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Text.rich(
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                      TextSpan(
                        text: "John Appleseed",
                      ) 
                    ),
                    Text.rich(
                      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                      TextSpan(
                        text: "@johnapple",
                      ) 
                    ),
                    Text.rich(
                      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                      TextSpan(
                        text: "johnappleseed@gmail.com",
                      ) 
                    ),
                  ]
                )
              ),
          )
        ]
     );
  }
}  

