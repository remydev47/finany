import 'package:finany/common/utils/kcolors.dart';
import 'package:finany/common/widgets/app_style.dart';
import 'package:finany/const/resource.dart';
import 'package:finany/src/home/components/actions_buttons.dart';
import 'package:finany/src/home/components/contact_button.dart';
import 'package:finany/src/home/components/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isVisible = true;
  double _clipPathHeight = 250;

  void _handleVisibilityChanged(bool isVisible) {
    setState(() {
      _isVisible = isVisible;
    });
  }
  void _handleClipPathHeightChanged(double height) {
    setState(() {
      _clipPathHeight = height;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kolors.kOffWhite.withOpacity(.15),
      //backgroundColor: Kolors.kPrimary,
      appBar: AppBar(
        backgroundColor: Kolors.kPrimary,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage(R.ASSETS_IMAGES_USER1_PNG),
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: Kolors.kOffWhite,
                size: 32,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.notifications,
                color: Kolors.kOffWhite,
                size: 32,
              ),
              onPressed: () {}),
        ],
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: ClipPathClass(),
            child: Container(
              height: 250,
              width: double.infinity,
              color: Kolors.kPrimary,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
             physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                BalanceCard(),
                SizedBox(
                    height: 20), // Add some space between card and contacts
                ContactButtons(),
                SizedBox(height: 20),
                ActionsButtons(),
                SizedBox(height: 20,),
                TransactionList()
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BalanceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      margin: EdgeInsets.only(
        left: 16,
        top: 50,
        right: 16,
        bottom: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Kolors.kOffWhite,
        boxShadow: [
          BoxShadow(
            color: Colors.black26.withOpacity(0.1),
            offset: Offset(0, 2),
            blurRadius: 3,
          )
        ],
      ),
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Available Balance'),
            Row(
              children: [
                Text(
                  '\ksh 216,485',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(R.ASSETS_IMAGES_FLAG_PNG),
                ),
              ],
            ),
            Row(
              children: [
                TextButton(
                  child: Text('See More'),
                  onPressed: () {},
                ),
                Spacer(),
                TextButton(
                  child: Text(
                    'kE ksh',
                    style: appStyle(
                      14,
                      Kolors.kPrimary.withOpacity(.7),
                      FontWeight.w600,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 50,
    );
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
