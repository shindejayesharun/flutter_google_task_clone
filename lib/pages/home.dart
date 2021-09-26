import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int menuSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {},
        child: CircleAvatar(
          backgroundImage: NetworkImage(
              "https://www.gstatic.com/images/icons/material/colored_icons/1x/create_32dp.png"),
          backgroundColor: Colors.transparent,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
       shape: CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: showMenu, icon: Icon(Icons.menu)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
          ],
        ),
      ),
      body: RefreshIndicator(
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("My Tasks",
                        style: TextStyle(color: Colors.black, fontSize: 28)),
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://lh3.googleusercontent.com/ogw/ADea4I5X35_jOJeOqtvaBcHLQi79Rn0eqaMEmqV6uB3z7Q=s32-c-mo"),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(Icons.radio_button_unchecked),
                        title: Text("Get budget approved by Gerg"),
                      );
                    }),
              ),
              bottomMenu(),
            ],
          ),
          onRefresh: onRefresh),
    );
  }

  Future onRefresh() async {}

  showMenu() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return bottomMenu();
        });
  }

  Widget bottomMenu() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BottomMenuItem(
              title: "My Tasks",
              isSelected: true,
            ),
            BottomMenuItem(
              title: "Jayesh Shinde's list",
            ),
            BottomMenuItem(
              title: "Home",
            ),
            BottomMenuItem(
              title: "Work",
            ),
            Divider(),
            BottomMenuItem(
              title: "Create new list",
            ),
          ],
        ),
      ),
    );
  }
}

class BottomMenuItem extends StatelessWidget {
  final String title;
  final Color color;
  final IconData icon;
  final bool isSelected;
  const BottomMenuItem(
      {Key? key,
      required this.title,
      this.color = Colors.white,
      this.icon = Icons.add,
      this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: isSelected
            ? BoxDecoration(
                color: Color(0xffE8F0FD),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(34.0),
                  bottomRight: Radius.circular(34.0),
                ),
              )
            : null,
        child: Row(
          children: [
           title == "Create new list" ? Icon(
              icon,
              color:Color(0xff3C3C3C) ,
            ):SizedBox(width: 24,height: 24,),
            SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: isSelected ? Color(0xff3878D0) : Color(0xff3C3C3C)),
            )
          ],
        ),
      ),
    );
    ;
  }
}
