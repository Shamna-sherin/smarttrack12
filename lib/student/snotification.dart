import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String selectedFilter = "All"; // Default filter option

  final List<Map<String, String>> notifications = [
    {"type": "Entry/Exit", "message": "Entry at 9:00 AM", "dateTime": "Today"},
    {"type": "Entry/Exit", "message": "Exit at 5:00 PM", "dateTime": "Yesterday"},
    {"type": "Unauthorized Entry", "message": "Unauthorized access detected", "dateTime": "Yesterday"},
    {"type": "Fine", "message": "Fine issued: \$50", "dateTime": "Last Week"},
    {"type": "Fine", "message": "Fine issued: \$100", "dateTime": "Today"},
  ];

  @override
  Widget build(BuildContext context) {
    // Filtered Notifications
    final filteredNotifications = selectedFilter == "All"
        ? notifications
        : notifications.where((item) => item["type"] == selectedFilter).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
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
                          setState(() => selectedFilter = "All");
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: const Text("Entry/Exit"),
                        onTap: () {
                          setState(() => selectedFilter = "Entry/Exit");
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: const Text("Unauthorized Entry"),
                        onTap: () {
                          setState(() => selectedFilter = "Unauthorized Entry");
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: const Text("Fine"),
                        onTap: () {
                          setState(() => selectedFilter = "Fine");
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
      body: Column(
        children: [
          // Filter Display
          Container(
            padding: const EdgeInsets.all(8.0),
            width: double.infinity,
            color: Colors.grey[200],
            child: Text(
              "Filter: $selectedFilter",
              style: const TextStyle(fontSize: 16),
            ),
          ),
          // Notification List
          Expanded(
            child: filteredNotifications.isEmpty
                ? const Center(
                    child: Text(
                      "No notifications available",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredNotifications.length,
                    itemBuilder: (context, index) {
                      final notification = filteredNotifications[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16.0,
                        ),
                        child: ListTile(
                          leading: Icon(
                            notification["type"] == "Entry/Exit"
                                ? Icons.login
                                : notification["type"] == "Unauthorized Entry"
                                    ? Icons.warning
                                    : Icons.money,
                            color: Colors.blue,
                          ),
                          title: Text(notification["message"]!),
                          subtitle: Text(notification["dateTime"]!),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Highlight Notification
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (index == 1) {
            // Stay on notification
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/account');
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notification",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Account",
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const NotificationScreen(),
    routes: {
      '/home': (context) => const HomeScreen(),
      '/account': (context) => const AccountScreen(),
    },
  ));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: const Center(child: Text("Home Screen")),
    );
  }
}

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Account")),
      body: const Center(child: Text("Account Screen")),
    );
  }
}
