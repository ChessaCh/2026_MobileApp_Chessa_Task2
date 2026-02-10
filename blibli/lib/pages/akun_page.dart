import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AkunPage extends StatelessWidget {
  const AkunPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      backgroundColor: const Color(0xFFEEF3F8),
      body: Stack(
        children: [
          // Top background image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 200,
            child: Image.asset(
              'assets/images/akun_top_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          
          // Content
          SafeArea(
            child: Column(
              children: [
                // Header with back button and logo
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {},
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        'assets/images/blibli_tiket_logo.svg',
                        height: 18,
                      ),
                      const Spacer(),
                      const SizedBox(width: 48), // Balance the back button
                    ],
                  ),
                ),
                
                // Scrollable content
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        
                        // Profile Card with notch
                        _buildProfileCard(screenWidth),
                        
                        const SizedBox(height: 24),
                        
                        // Menu Items
                        _buildMenuSection(),
                        
                        const SizedBox(height: 180),
                        
                        // Footer
                        _buildFooter(),
                        
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard(double screenWidth) {
    const avatarSize = 110.0;
    const notchOverlap = 30.0; // Reduced overlap for better embedding
    
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Background rectangular white container (full width, no padding)
        Container(
          margin: const EdgeInsets.only(top: notchOverlap + 50),
          width: double.infinity,
          height: 180,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
        ),
        
        // Notched container with shadow
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // White card with notch
              Container(
                margin: const EdgeInsets.only(top: notchOverlap),
                child: ClipPath(
                  clipper: NotchClipper(
                    notchRadius: avatarSize / 2,
                    notchMargin: 8,
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(
                      top: 90,
                      bottom: 32,
                      left: 24,
                      right: 24,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 24,
                          offset: const Offset(0, 8),
                          spreadRadius: 4,
                        ),
                      ],
                    ),
                child: Column(
                  children: [
                    const Text(
                      'Masuk',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF007CFF),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Tidak punya akun? ',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'Daftar',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF007CFF),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Floating Avatar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: avatarSize,
                height: avatarSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(4),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/profile_pic.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
          ),
      ),
    ],
  );
}

  Widget _buildMenuSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            _buildMenuItem(
              icon: Icons.help_outline,
              title: 'Bantuan BlibliCare',
              onTap: () {},
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey[100],
            ),
            _buildMenuItem(
              icon: Icons.store_outlined,
              title: 'Jual di Blibli',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: Colors.grey[600],
                size: 26,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: Colors.grey[400],
              size: 26,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_bag_outlined,
                  size: 22,
                  color: Colors.grey[600],
                ),
                const SizedBox(width: 8),
                Text(
                  'Tentang Blibli',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'All Rights Reserved',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom clipper to create the notch effect
class NotchClipper extends CustomClipper<Path> {
  final double notchRadius;
  final double notchMargin;

  NotchClipper({
    required this.notchRadius,
    required this.notchMargin,
  });

  @override
  Path getClip(Size size) {
    final path = Path();
    final centerX = size.width / 2;
    
    // Notch dimensions - make it a clean semicircle
    final notchWidth = notchRadius * 1.1; // Slightly wider than avatar radius
    final notchDepth = notchRadius * 0.5; // 50% depth for proper embedding
    
    final notchLeft = centerX - notchWidth;
    final notchRight = centerX + notchWidth;
    
    // Start from top-left corner with rounded corner
    path.moveTo(0, 24);
    path.quadraticBezierTo(0, 0, 24, 0);
    
    // Flat line to notch start
    path.lineTo(notchLeft, 0);
    
    // Sharp transition into notch
    path.lineTo(notchLeft + 4, notchDepth * 0.2);
    
    // Main notch arc - concave semicircle
    path.quadraticBezierTo(
      centerX,
      notchDepth,
      notchRight - 4,
      notchDepth * 0.2,
    );
    
    // Sharp transition out of notch
    path.lineTo(notchRight, 0);
    
    // Flat line to top-right corner
    path.lineTo(size.width - 24, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 24);
    
    // Right side
    path.lineTo(size.width, size.height - 24);
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width - 24,
      size.height,
    );
    
    // Bottom side
    path.lineTo(24, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - 24);
    
    // Close path
    path.close();
    
    return path;
  }

  @override
  bool shouldReclip(NotchClipper oldClipper) {
    return oldClipper.notchRadius != notchRadius ||
        oldClipper.notchMargin != notchMargin;
  }
}
