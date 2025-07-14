import 'package:flutter/material.dart';
import 'package:gotilo_job/Utils/responsive.dart';
import 'package:gotilo_job/Utils/screen_config.dart';

class Tipspage extends StatelessWidget {
  const Tipspage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeConfig.init(context);
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        children: const [
          TipCard(
            imagePath:
                'https://images.unsplash.com/photo-1542744173-8e7e53415bb0?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGpvYnxlbnwwfHwwfHx8MA%3D%3D',
            title: 'Tips For Drilling',
            description:
                'Use the correct bit type for the material (wood, metal, concrete, etc.) to ensure clean and precise drilling.',
          ),
          SizedBox(height: 16),
          TipCard(
            imagePath:
                'https://images.unsplash.com/photo-1628348068343-c6a848d2b6dd?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTB8fGpvYnxlbnwwfHwwfHx8MA%3D%3D',
            title: 'How to programmed efficiently',
            description:
                'Use proper indentation, meaningful variable names, and comments to make your code easy to understand.',
          ),
        ],
      ),
    );
  }
}

class TipCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const TipCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        // border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
                child: Image.network(
                  imagePath,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const Positioned.fill(
                child: Center(
                  child: Icon(
                    Icons.play_circle_outline,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      '• ',
                      style: TextStyle(color: Colors.orange, fontSize: 16),
                    ),
                    Expanded(
                      child: Text(
                        title,
                        // style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  // style: GoogleFonts.poppins(
                  //   fontSize: 13,
                  //   color: Colors.black54,
                  // ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
