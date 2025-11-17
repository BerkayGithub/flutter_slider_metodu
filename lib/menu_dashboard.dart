import 'package:flutter/material.dart';

final menuFontStyle = TextStyle(color: Colors.white, fontSize: 20);
final Color backgroundColor = Color(0xFF343442);

class MenuDashboard extends StatefulWidget {
  const MenuDashboard({super.key});

  @override
  State<MenuDashboard> createState() => _MenuDashboardState();
}

class _MenuDashboardState extends State<MenuDashboard> {
  late double ekranYuksekligi, ekranGenisligi;
  bool menuAcikMi = false;

  @override
  Widget build(BuildContext context) {
    ekranYuksekligi = MediaQuery.of(context).size.height;
    ekranGenisligi = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: <Widget>[menuOlustur(context), dashboardOlustur(context)],
        ),
      ),
    );
  }

  menuOlustur(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Dashboard", style: menuFontStyle),
            SizedBox(height: 10),
            Text("Mesajlar", style: menuFontStyle),
            SizedBox(height: 10),
            Text("Utility Bills", style: menuFontStyle),
            SizedBox(height: 10),
            Text("Fund Transfer", style: menuFontStyle),
            SizedBox(height: 10),
            Text("Branches", style: menuFontStyle),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget dashboardOlustur(BuildContext context) {
    return AnimatedPositioned(
      top: menuAcikMi == true ? 0.2 * ekranYuksekligi : 0,
      bottom: menuAcikMi == true ? 0.2 * ekranYuksekligi : 0,
      left: menuAcikMi == true ? 0.4 * ekranGenisligi : 0,
      right: menuAcikMi == true ? -0.4 * ekranGenisligi : 0,
      duration: Duration(milliseconds: 500),
      child: Material(
        borderRadius: menuAcikMi == true ? BorderRadius.circular(40) : null,
        elevation: menuAcikMi == true ? 8 : 0,
        color: backgroundColor,
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        menuAcikMi = !menuAcikMi;
                      });
                    },
                    child: Icon(Icons.menu, color: Colors.white),
                  ),
                  Text(
                    "My Cards",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Icon(Icons.add_circle_outline, color: Colors.white),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
