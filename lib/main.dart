import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dental App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          primary: Colors.green,
          secondary: Colors.lightGreen,
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}

// redirecting to chatbot screen
class ChatbotScreen extends StatelessWidget {
  const ChatbotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crosby - Your Dental Assistant')),
      body: const Center(
        child: Text("Hi! I'm Crosby. How can I help you today?"),
      ),
    );
  }
}

// prelogin screen
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                Image.asset("assets/images/logo.png", height: 100),
                const SizedBox(height: 20),
                const Text(
                  "DentalCare+",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.green),
                ),
                const Text(
                  "Your Smile, Our Priority!",
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 10),
                const Text(
                  "A smart way to manage your dental health.",
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 30),
                const FeatureCard(icon: Icons.calendar_today, label: "Book Appointments"),
                const FeatureCard(icon: Icons.chat_bubble_outline, label: "AI Chatbot"),
                const FeatureCard(icon: Icons.health_and_safety, label: "Dental Health Tips"),
                const FeatureCard(icon: Icons.location_on, label: "Get Directions"),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () { //linking to signup screen
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUpScreen()),
                    );
                  },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                  child: const Text(
                    "Get Started",
                    style: TextStyle(fontSize: 16),
                  ),
                ),

            // Already have account? Login here
                TextButton(
                  onPressed: () {},
                  child: const Text("Already have an account? Log in"),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),

          // Floating Lottie icons
          Positioned(
            top: 80,
            left: 20,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              //  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
              ),
              child: Lottie.asset('assets/animations/symptom_checker.json', width: 50),
            ),
          ),
          Positioned(
            top: 80,
            right: 40,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
               // boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
              ),
              child: Lottie.asset('assets/animations/educational_videos.json', width: 50),
            ),
          ),
          Positioned(
            top: 180,
            left: 30,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
               // boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
              ),
              child: Lottie.asset('assets/animations/treatment_progress.json', width: 50),
            ),
          ),
          Positioned(
            top: 180,
            right: 50,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
               // boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
              ),
              child: Lottie.asset('assets/animations/video_consultations.json', width: 50),
            ),
          ),

          //AI chatbot 
          Stack(
            children: [
              // Avatar pinned to bottom-right corner
              Positioned(
                bottom: 16,
                right: 16,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ChatbotScreen()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.green, width: 2),
                    ),
                    child: const CircleAvatar(
                      radius: 18,
                      backgroundImage: AssetImage('assets/images/crosby_avatar.png'),
                    ),
                  ),
                ),
              ),
              // Message box slightly above the avatar
              Positioned(
                bottom: 65,
                right: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.green, width: 1.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  constraints: const BoxConstraints(maxWidth: 100),
                  child: const Text(
                    "I'm Crosby, your DentalCare assistant.",
                    style: TextStyle(fontSize: 11),
                    textAlign: TextAlign.left
                  ),
                ),
              ),
            ],
          ),
        ],
      ),

      //footer
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text("Privacy Policy | Terms of Service", style: TextStyle(fontSize: 12)),
            Text("Contact: support@dentalclinic.com", style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const FeatureCard({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20, color: Colors.green),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(color: Colors.green)),
        ],
      ),
    );
  }
}
