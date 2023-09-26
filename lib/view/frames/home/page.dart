// import 'index.dart';
import 'index.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  HomePage({super.key});
  Widget buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.lightLavender,
      child: ListView(
        children: [
          Text(
            '      Dashboard'.tr,
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
            title: Text('Profiles'.tr),
            onTap: () {
              Get.toNamed(AppRoutes.profilecreation);
              // Add onTap logic
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text('Profile Management'.tr),
            onTap: () {
              Get.to(() => ProfileManagement());
              // Add onTap logic
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_comment),
            title: Text('Chatboard'.tr),
            onTap: () {
              Get.toNamed(AppRoutes.chatboard);
              // Add onTap logic
            },
          ),
          ListTile(
            leading: const Icon(Icons.feedback),
            title: Text('Feedback'.tr),
            onTap: () {
              Get.toNamed(AppRoutes.feedback);
              // Add onTap logic
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: Text('Parental Control'.tr),
            onTap: () {
              // Add onTap logic
            },
          ),
          ListTile(
            leading: const Icon(Icons.security_update_good_sharp),
            title: Text('Good bye'.tr),
            onTap: () {
              Get.toNamed(AppRoutes.goodbye);
              // Add onTap logic
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text('Sign out'),
            onTap: () {
              // AuthController.instance.logOut();
              Get.toNamed(AppRoutes.login);
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
        backgroundColor: AppColors.softblue,
        title: Container(
          child: Row(
            children: [
              Text(
                'Hi'.tr,
                style: TextStyle(fontSize: 14), // Small font size
              ),
              SizedBox(width: 2), // Add some space between the texts
              Text(
                'John '.tr,
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
              Text(
                ' Hello!'.tr,
                style: TextStyle(fontSize: 32, color: AppColors.purple),
              ),
              Image.asset(
                'assets/images/home1.png', // Replace with your image asset path
                width: 40,
                height: 40,
              ),
            ],
          ),
          Text(
            ' Find a story \n you would like \n to watch'.tr,
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
                  labelText: '   Search for anything'.tr,
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
            height: 480,
            width: 393,
            // decoration: BoxDecoration(),
            color: const Color(0xffABB3BB),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "  Recommended Stories".tr,
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(
                  height: 26,
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
                  height: 10.94,
                ),
                Center(
                  child: FilledButton(
                    onPressed: () {},
                    child: Text(
                      "Save".tr,
                      style: TextStyle(fontSize: 26),
                    ),
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.resolveWith(
                        (states) => const Size(160, 60),
                      ),
                      // backgroundColor: MaterialStateProperty.all<Color>(
                      //     AppColors.powderPink),
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
