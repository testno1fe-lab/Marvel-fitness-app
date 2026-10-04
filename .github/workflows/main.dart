import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MarvelFitnessApp());

class MarvelFitnessApp extends StatelessWidget {
  const MarvelFitnessApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        primaryColor: const Color(0xFFED1C24),
      ),
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});
  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;
  final List<Widget> _screens = [const Dashboard(), const QRScreen(), const Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFFED1C24),
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: 'Check-in'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// --- SCREEN 1: DASHBOARD ---
class Dashboard extends StatelessWidget {
  const Dashboard({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Text("MARVEL FITNESS", style: GoogleFonts.oswald(fontSize: 30, color: Colors.red, fontWeight: FontWeight.bold)),
          const Text("Sagwara Branch", style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(15)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("MEMBERSHIP", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("ACTIVE", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ]),
                Icon(Icons.check_circle, size: 40),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text("UPCOMING CLASSES", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ListTile(title: const Text("Heavy Weight Lifting"), subtitle: const Text("6:00 PM - 7:30 PM"), trailing: ElevatedButton(onPressed: (){}, child: const Text("Book"))),
        ],
      ),
    );
  }
}

// --- SCREEN 2: QR CHECK-IN ---
class QRScreen extends StatelessWidget {
  const QRScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("SCAN AT RECEPTION", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(10),
            child: QrImageView(data: "MEMBER_ID_123", size: 250),
          ),
        ],
      ),
    );
  }
}

// --- SCREEN 3: PROFILE & PAYMENTS ---
class Profile extends StatelessWidget {
  const Profile({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Profile & Renewal Settings"));
  }
}
