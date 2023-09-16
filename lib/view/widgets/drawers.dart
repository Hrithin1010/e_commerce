import 'package:e_commerce/email&pass_auth/firebaseHelper.dart';
import 'package:e_commerce/email&pass_auth/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Navdrawer extends StatelessWidget {
  const Navdrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return 
     Drawer(
      backgroundColor: const Color.fromARGB(255, 8, 49, 83),
        child: ListView(
          children:  [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black
                
                  // image: DecorationImage(
                  //     image: NetworkImage(
                  //         "https://addons-media.operacdn.com/media/CACHE/images/themes/85/186585/1.0-rev1/images/48bf04c7-d9ab-4eb3-9e4a-672fd42dfb48/fcbdafe1ea1ec3c29970503338c8a834.jpg"),
                  //     fit: BoxFit.fill),
                      ),
              accountName: Text("Tom cruise"),
              accountEmail: Text("tomcruise123@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://parade.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTkwNTc4NzcwMDEwOTczMzA5/tom-cruise-net-worth.jpg"),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMHfY8LO6Ax1a1gNcpeB_6vEtDgAVk2ZbVcQ&usqp=CAU"),
                ),
              ],
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              iconColor: Colors.white,
              textColor: Colors.white,
              
            ),
           
           
            ListTile(
              leading: Icon(Icons.more),
              title: Text("More"),
              iconColor: Colors.white,
              textColor: Colors.white,
            ),
             Divider(),
              ListTile(
              leading: IconButton(onPressed: (){
                FireHelper().signOut().then((result) =>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>login())));
        
              }, icon: Icon(Icons.logout)),
              title: Text("Log out"),
              iconColor: Colors.white,
              textColor: Colors.white,
            ),
          ],
        ),
      );
  }
}