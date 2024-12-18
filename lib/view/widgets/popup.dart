// import 'package:dream_tech_doctor/utils/images.dart';
// import 'package:flutter/material.dart';

// class PopUp extends StatelessWidget {
//   final VoidCallback onClose;

//   const PopUp({super.key, required this.onClose});

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 CircleAvatar(
//                   radius: 15,
//                   child: IconButton(
//                     icon: const Icon(
//                       Icons.close,
//                       size: 15,
//                       color: Colors.red,
//                     ),
//                     onPressed: onClose,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 2),
//             Card(
//               child: Center(
//                 child: SizedBox(
//                     height: 250,
//                     width: double.infinity,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child:
//                           Image.asset(AppImages.popup),
//                     )),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


//  import 'package:dream_tech_doctor/utils/images.dart';
// import 'package:flutter/material.dart';

// class PopUp extends StatelessWidget {
//   final VoidCallback onClose;

//   const PopUp({super.key, required this.onClose});

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15), 
//       ),
//       child: Stack(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const SizedBox(height: 20), 
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(12), 
//                   child: SizedBox(
//                     height: 180,
//                     width: double.infinity,
//                     child: Image.asset(
//                       AppImages.popup,
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 const Text(
//                   'Welcome to Dream Tech Doctor!',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black87,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 const Text(
//                   'Explore our features and enjoy a seamless experience with top-notch care and management.',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.black54,
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 ElevatedButton(
//                   onPressed: onClose,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blueAccent,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   child: const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                     child: Text(
//                       'Got It!',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           // Close Button
//           Positioned(
//             right: 12,
//             top: 12,
//             child: GestureDetector(
//               onTap: onClose,
//               child: Container(
//                 height: 30,
//                 width: 30,
//                 decoration: BoxDecoration(
//                   color: Colors.redAccent.withOpacity(0.9),
//                   shape: BoxShape.circle,
//                 ),
//                 child: const Icon(
//                   Icons.close,
//                   size: 18,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



// import 'package:dream_tech_doctor/utils/images.dart';
// import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class PopUp extends StatefulWidget {
//   final VoidCallback onClose;

//   const PopUp({super.key, required this.onClose});

//   @override
//   State<PopUp> createState() => _PopUpState();
// }

// class _PopUpState extends State<PopUp> {
//   final PageController _pageController = PageController();
//   int _currentPage = 0;

//   final List<String> _images = [
//     AppImages.popup, // Add more images here
//     AppImages.popup, // Replace with other image paths
//     AppImages.popup, // Replace with other image paths
//   ];

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15), // Smooth corners
//       ),
//       child: Stack(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const SizedBox(height: 20), // Leave space for the close button
//                 SizedBox(
//                   height: 250,
//                   child: Stack(
//                     children: [
//                       PageView.builder(
//                         controller: _pageController,
//                         itemCount: _images.length,
//                         onPageChanged: (index) {
//                           setState(() {
//                             _currentPage = index;
//                           });
//                         },
//                         itemBuilder: (context, index) {
//                           return ClipRRect(
//                             borderRadius: BorderRadius.circular(12),
//                             child: Image.asset(
//                               _images[index],
//                               fit: BoxFit.contain,
//                               width: double.infinity,
//                             ),
//                           );
//                         },
//                       ),
//                       Positioned(
//                         bottom: 8,
//                         left: 0,
//                         right: 0,
//                         child: Center(
//                           child: SmoothPageIndicator(
//                             controller: _pageController,
//                             count: _images.length,
//                             effect: const ExpandingDotsEffect(
//                               activeDotColor: Colors.blueAccent,
//                               dotColor: Colors.grey,
//                               dotHeight: 8,
//                               dotWidth: 8,
//                               expansionFactor: 3,
//                               spacing: 8,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 const Text(
//                   'Welcome to Dream Tech Doctor!',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black87,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 const Text(
//                   'Explore our features and enjoy a seamless experience with top-notch care and management.',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.black54,
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 ElevatedButton(
//                   onPressed: widget.onClose,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blueAccent,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   child: const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                     child: Text(
//                       'Got It!',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           // Close Button
//           Positioned(
//             right: 12,
//             top: 12,
//             child: GestureDetector(
//               onTap: widget.onClose,
//               child: Container(
//                 height: 30,
//                 width: 30,
//                 decoration: BoxDecoration(
//                   color: Colors.redAccent.withOpacity(0.9),
//                   shape: BoxShape.circle,
//                 ),
//                 child: const Icon(
//                   Icons.close,
//                   size: 18,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



import 'dart:async';
import 'package:dream_tech_doctor/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PopUp extends StatefulWidget {
  final VoidCallback onClose;

  const PopUp({super.key, required this.onClose});

  @override
  State<PopUp> createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late Timer _autoScrollTimer;

  final List<String> _images = [
    AppImages.popup, // Add more images here
    AppImages.popup, // Replace with other image paths
    AppImages.popup, // Replace with other image paths
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        int nextPage = (_currentPage + 1) % _images.length;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        setState(() {
          _currentPage = nextPage;
        });
      }
    });
  }

  @override
  void dispose() {
    _autoScrollTimer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Smooth corners
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20), // Leave space for the close button
                SizedBox(
                  height: 250,
                  child: Stack(
                    children: [
                      PageView.builder(
                        controller: _pageController,
                        itemCount: _images.length,
                        onPageChanged: (index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              _images[index],
                              fit: BoxFit.contain,
                              width: double.infinity,
                            ),
                          );
                        },
                      ),
                      Positioned(
                        bottom: 8,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: SmoothPageIndicator(
                            controller: _pageController,
                            count: _images.length,
                            effect: const ExpandingDotsEffect(
                              activeDotColor: Colors.blueAccent,
                              dotColor: Colors.grey,
                              dotHeight: 8,
                              dotWidth: 8,
                              expansionFactor: 3,
                              spacing: 8,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Welcome to Dream Tech Doctor!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Explore our features and enjoy a seamless experience with top-notch care and management.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: widget.onClose,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Text(
                      'Got It!',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Close Button
          Positioned(
            right: 12,
            top: 12,
            child: GestureDetector(
              onTap: widget.onClose,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.redAccent.withOpacity(0.9),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close,
                  size: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

