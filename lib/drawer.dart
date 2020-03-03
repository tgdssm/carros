import 'package:cars/screens/login_page.dart';
import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Thalisson"),
            accountEmail: Text("thalissongabriel1999@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://scontent.fplu8-1.fna.fbcdn.net/v/t1.0-9/s960x960/73420314_2785970414962820_303891471885402112_o.jpg?_nc_cat=100&_nc_sid=85a577&_nc_oc=AQm40MpnAf_OqCB8m2uOkCCYMN-1uyMDdUxb7nFnbaN2GlORGS64pZC_qHWujDT8FHs&_nc_ht=scontent.fplu8-1.fna&_nc_tp=7&oh=291284bc047099b2cb88220492da1e71&oe=5E863185"),
            ),
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text("Favoritos"),
            subtitle: Text("mais informações..."),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text("Ajuda"),
            subtitle: Text("mais informações..."),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              print("Item 1");
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Logout"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () => _onClickLogout(context),
          )
        ],
      ),
    );
  }

  _onClickLogout(BuildContext context) {
    Navigator.pop(context);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
  }
}
