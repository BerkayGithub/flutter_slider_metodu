import 'package:flutter/material.dart';

final menuFontStyle = TextStyle(color: Colors.white, fontSize: 20);
final Color backgroundColor = Color(0xFF343442);

class MenuDashboard extends StatefulWidget {
  const MenuDashboard({super.key});

  @override
  State<MenuDashboard> createState() => _MenuDashboardState();
}

class _MenuDashboardState extends State<MenuDashboard> with SingleTickerProviderStateMixin{
  late double ekranYuksekligi, ekranGenisligi;
  bool menuAcikMi = false;
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  final Duration duration = Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: duration);
    scaleAnimation = Tween(begin: 1.0, end: 0.6).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
      top: 0,
      bottom: 0,
      left: menuAcikMi == true ? 0.4 * ekranGenisligi : 0,
      right: menuAcikMi == true ? -0.4 * ekranGenisligi : 0,
      duration: duration,
      child: ScaleTransition(
        scale: scaleAnimation,
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
                          if(menuAcikMi){
                            controller.reverse();
                          }else{
                            controller.forward();
                          }
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
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 700,
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        color: Colors.pink,
                        width: 100,
                        margin: EdgeInsets.symmetric(horizontal: 12),
                      ),
                      Container(
                        color: Colors.red,
                        width: 100,
                        margin: EdgeInsets.symmetric(horizontal: 12),
                      ),
                      Container(
                        color: Colors.purple,
                        width: 100,
                        margin: EdgeInsets.symmetric(horizontal: 12),
                      ),
                      Container(
                        color: Colors.blue,
                        width: 100,
                        margin: EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
