import 'package:brainbox/utils/fake_data.dart';
import 'package:brainbox/view/welcome_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPage createState() => _OnBoardingPage();
}

class _OnBoardingPage extends State<OnBoardingPage> {
  int _currentIndex = 0;

  final List<String> _images = [
    FakeData.robotImg1,
    FakeData.robotImg2,
    FakeData.robotImg3,
  ];

  final List<Map<String, String>> _texts = [
    {
      'title': 'Unlock the Power of Future AI',
      'subtitle': 'Chat with the smartest AI Future',
      'description': 'Experience the power of AI with us',
    },
    {
      'title': 'Empower Your Conversations',
      'subtitle': 'AI that understands you',
      'description': 'Connect with advanced AI now',
    },
    {
      'title': 'Boost Your Mind Power with Ai',
      'subtitle': 'Your future, powered by AI',
      'description': 'Revolutionize the way you interact',
    },
  ];

  // Function to handle the next button press
  void _next() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _images.length;
    });
  }

  void _back() {
    setState(() {
      _currentIndex =
          (_currentIndex - 1 + _images.length) % _images.length;
    });
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_images.length, (index) {
        return Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.black,
              width: 1
            )
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: _currentIndex == index ? 12 : 8,
            height: _currentIndex == index ? 12 : 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentIndex == index ? Colors.black : Colors.grey,
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WelcomePage())
              );
            },
            child: Text(
              "Skip",
              style: TextStyle(
                color: Colors.grey[400],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              height: 400,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    spreadRadius: 10,
                    blurRadius: 20,
                    offset: const Offset(10, 20),
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    spreadRadius: 10,
                    blurRadius: 20,
                    offset: const Offset(-10, 20),
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15), // Shadow color
                    spreadRadius: 10,  // How much the shadow spreads
                    blurRadius: 20,   // Blur radius of the shadow
                    offset: const Offset(10, 20), // Changes the shadow position (x, y)
                  ),
                ],
              ),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500), // Animation duration
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return FadeTransition(
                        opacity: animation, // Fade effect
                        child: child,
                      );
                    },
                    child: SizedBox(
                      width: 300, // Ensure the image fits the container
                      height: 400,
                      child: CachedNetworkImage(
                        key: ValueKey<String>(_images[_currentIndex]), // Unique key for each image
                        imageUrl: _images[_currentIndex], // Display current image
                        fit: BoxFit.cover, // Ensures the image fits the container
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40,),
          _buildIndicator(),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: Column(
                key: ValueKey<int>(_currentIndex),
                children: [
                  Text(
                    _texts[_currentIndex]['title']!,
                    style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                  Text(_texts[_currentIndex]['subtitle']!,style: const TextStyle(color: Colors.grey),),
                  Text(_texts[_currentIndex]['description']!,style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Spacer(),

          Center(
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05), // Shadow color
                      spreadRadius: 10,
                      blurRadius: 10,
                      offset: const Offset(-10, 10),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05), // Shadow color
                      spreadRadius: 10,
                      blurRadius: 10,
                      offset: const Offset(10, 10),
                    ),
                  ]
              ),
              child: Row(
                children: [
                  Expanded(
                    child: IconButton(
                      onPressed: _back, // Back button action
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.grey[300],
                    ),
                  ),
                  Container(
                    height: 20,
                    width: 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[300],
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: _next, // Forward button action
                      icon: const Icon(Icons.arrow_forward),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30)
        ],
      ),
    );
  }
}
