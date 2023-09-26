import 'index.dart';

// ignore: must_be_immutable
class ProfileManagement extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();

  TextEditingController _genderController = TextEditingController();

  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  ProfileManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.creamyYellow,
      appBar: AppBar(
        backgroundColor: AppColors.lightLavender,
        title: Center(
          child: Text(
            'Profile Management'.tr,
            style: const TextStyle(fontSize: 14),
          ),
        ),
        actions: [const Icon(Icons.settings)],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Edit Profile'.tr,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Center(
                child: Stack(
                  children: [
                    const CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                        icon: const Icon(Icons.camera_alt),
                        onPressed: () {
                          // Handle image upload
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                    labelText: 'Name'.tr, suffixIcon: const Icon(Icons.edit)),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _genderController,
                decoration: InputDecoration(
                    labelText: 'Gender'.tr, suffixIcon: const Icon(Icons.edit)),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                    labelText: 'Email'.tr, suffixIcon: const Icon(Icons.edit)),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Password'.tr,
                    suffixIcon: const Icon(Icons.edit)),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 141,
                    height: 35,
                    child: FilledButton(
                        onPressed: () {
                          // Handle cancel action
                        },
                        child: Text(
                          'Cancel'.tr,
                          style: const TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.resolveWith(
                            (states) => const Size(141, 35),
                          ),
                          // backgroundColor:
                          //     MaterialStateProperty.all<Color>(Colors.blue),
                        )),
                  ),
                  const SizedBox(width: 37),
                  FilledButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.home);
                      // Handle save action
                    },
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.resolveWith(
                        (states) => const Size(141, 35),
                      ),
                      // backgroundColor:
                      //     MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    child: Text(
                      'Save'.tr,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:roudy_story_box/run_app/index.dart';
// import 'package:roudy_story_box/view/frames/login_page.dart';

// class ProfileManagement extends StatelessWidget {
//   TextEditingController _nameController = TextEditingController();

//   TextEditingController _genderController = TextEditingController();

//   TextEditingController _emailController = TextEditingController();

//   TextEditingController _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Profile'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             Text(
//               'Edit Profile',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),
//             CircleAvatar(
//               radius: 50,
//               backgroundImage: AssetImage('assets/images/profile.png'),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: _nameController,
//               decoration: InputDecoration(
//                 labelText: 'Name',
//               ),
//             ),
//             TextField(
//               controller: _genderController,
//               decoration: InputDecoration(
//                 labelText: 'Gender',
//               ),
//             ),
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(
//                 labelText: 'Email',
//               ),
//             ),
//             TextField(
//               controller: _passwordController,
//               decoration: InputDecoration(
//                 labelText: 'Password',
//               ),
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     // Cancel button logic
//                     _nameController.clear();
//                     _genderController.clear();
//                     _emailController.clear();
//                     _passwordController.clear();
//                   },
//                   child: Text('Cancel'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Save button logic
//                     String name = _nameController.text;
//                     String gender = _genderController.text;
//                     String email = _emailController.text;
//                     String password = _passwordController.text;

//                     Get.to(() => LoginPage());
//                   },
//                   child: Text('Save'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
