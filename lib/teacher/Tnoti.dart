import 'package:flutter/material.dart';

class TNotificationScreen extends StatefulWidget {
  const TNotificationScreen({super.key});

  @override
  State<TNotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<TNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notifications",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF1C1C55),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Navigate to Home Screen
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.white),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: const Text("All"),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: const SizedBox.shrink(),  // Empty body, no content
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: const TNotificationScreen(),
//     routes: {
//       '/home': (context) => const HomeScreen(),
//       '/account': (context) => const AccountScreen(),
//     },
//   ));
// }

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Home")),
//       body: const Center(child: Text("Home Screen")),
//     );
//   }
// }

// class AccountScreen extends StatelessWidget {
//   const AccountScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Account")),
//       body: const Center(child: Text("Account Screen")),
//     );
//   }
// }