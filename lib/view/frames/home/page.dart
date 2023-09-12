// import 'index.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:roudy_story_box/common/color/color.dart';
import 'package:roudy_story_box/common/routes/routes.dart';
import 'package:roudy_story_box/view/frames/profilemanagement/page.dart';

class HomePage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  HomePage({super.key});
  Widget buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.lightLavender,
      child: ListView(
        children: [
          const Text(
            '      Dashboard',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 45.5,
          ),
          ListTile(
            leading: const Icon(Icons.account_circle_rounded),
            title: const Text('Profiles'),
            onTap: () {
              Get.toNamed(AppRoutes.profilecreation);
              // Add onTap logic
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Profile Management'),
            onTap: () {
              Get.to(() => ProfileManagement());
              // Add onTap logic
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_comment),
            title: const Text('Chatboard'),
            onTap: () {
              Get.toNamed(AppRoutes.chatboard);
              // Add onTap logic
            },
          ),
          ListTile(
            leading: const Icon(Icons.feedback),
            title: const Text('Feedback'),
            onTap: () {
              Get.toNamed(AppRoutes.feedback);
              // Add onTap logic
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Parental Control'),
            onTap: () {
              // Add onTap logic
            },
          ),
          ListTile(
            leading: const Icon(Icons.security_update_good_sharp),
            title: const Text('Good bye'),
            onTap: () {
              Get.toNamed(AppRoutes.goodbye);
              // Add onTap logic
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.notifications),
          //   title: const Text('theme changing'),
          //   onTap: () {
          //     // ignore: unrelated_type_equality_checks
          //     if (ThemeData == ThemeData.light()) {
          //       Get.changeTheme(ThemeData.dark());
          //     } else {
          //       Get.changeTheme(ThemeData.light());
          //     }
          //     // Add onTap logic
          //   },
          // ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.powderPink,
        title: Container(
          child: const Row(
            children: [
              Text(
                'Hi',
                style: TextStyle(fontSize: 14), // Small font size
              ),
              SizedBox(width: 2), // Add some space between the texts
              Text(
                'John ',
                style: TextStyle(fontSize: 32), // Large font size
              ),
            ],
          ),
        ),
      ),
      endDrawer: buildDrawer(context), // Call the buildDrawer function
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                ' Hello!',
                style: TextStyle(fontSize: 32, color: AppColors.purple),
              ),
              Image.asset(
                'assets/images/home1.png', // Replace with your image asset path
                width: 40,
                height: 40,
              ),
            ],
          ),
          const Text(
            ' Find a story \n you would like \n to watch',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 17,
          ),
          Center(
            child: SizedBox(
              width: 328,
              height: 45,
              child: TextFormField(
                controller: _searchController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(8.0),
                  labelText: '   Search for anything',
                  labelStyle: const TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 23,
          ),
          Container(
            height: 449,
            width: 393,
            // decoration: BoxDecoration(),
            color: const Color(0xffABB3BB),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "  Recommended Stories",
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(
                  height: 22,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.readingstory);
                      },
                      child: Image.asset("assets/images/home2.png")),
                ),
                const SizedBox(
                  height: 73.94,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Save",
                      style: TextStyle(fontSize: 32),
                    ),
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.resolveWith(
                        (states) => const Size(205, 58),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          AppColors.powderPink),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
