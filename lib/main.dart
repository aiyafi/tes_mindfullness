import 'package:flutter/material.dart';

void main() {
  runApp(const MindfulnessApp());
}

class MindfulnessApp extends StatelessWidget {
  const MindfulnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mindfulness App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MindfulnessHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MindfulnessHomePage extends StatelessWidget {
  // Feature data
  final List<Feature> features = [
    Feature(title: 'Start Meditation', iconText: '🧘'),
    Feature(title: 'View Progress', iconText: '📈'),
    Feature(title: 'Set Reminder', iconText: '⏰'),
    Feature(title: 'Learn Mindfulness', iconText: '📚'),
  ];

  // Footer navigation data
  final List<NavItem> navItems = [
    NavItem(label: 'Home', iconText: '🏠'),
    NavItem(label: 'Profile', iconText: '👤'),
    NavItem(label: 'Settings', iconText: '⚙️'),
  ];

  // Example user name; replace with actual user data retrieval
  final String userName = 'X';

  MindfulnessHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Using Stack to place background and main content
      body: Stack(
        children: [
          // Gradient background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue[100]!,
                  Colors.green[100]!,
                ],
              ),
            ),
          ),
          // Main content
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header Section with dynamic greeting
                        HeaderSection(userName: userName),
                        const SizedBox(height: 16.0),
                        // Feature Cards Grid
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16.0,
                            crossAxisSpacing: 16.0,
                            childAspectRatio: 3 / 2,
                          ),
                          itemCount: features.length,
                          itemBuilder: (context, index) {
                            final feature = features[index];
                            return FeatureCard(feature: feature);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                // Footer Navigation
                FooterNavigation(navItems: navItems),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  final String userName;

  const HeaderSection({super.key, required this.userName});

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good morning';
    } else if (hour < 17) {
      return 'Good afternoon';
    } else {
      return 'Good evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome, $userName',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          _getGreeting(),
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}

class Feature {
  final String title;
  final String iconText;

  Feature({required this.title, required this.iconText});
}

class FeatureCard extends StatelessWidget {
  final Feature feature;

  const FeatureCard({super.key, required this.feature});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Handle button press
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white.withOpacity(0.8),
        foregroundColor: Colors.grey[700],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: const EdgeInsets.all(16.0),
        elevation: 4.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            feature.iconText,
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.blue[500],
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            feature.title,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class NavItem {
  final String label;
  final String iconText;

  NavItem({required this.label, required this.iconText});
}

class FooterNavigation extends StatelessWidget {
  final List<NavItem> navItems;

  const FooterNavigation({super.key, required this.navItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
          ),
        ],
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: navItems.map((item) {
          return TextButton(
            onPressed: () {
              // Handle navigation
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  item.iconText,
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  item.label,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
