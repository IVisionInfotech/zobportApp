import 'package:flutter/material.dart';
import 'package:gotilo_job/View/Login/login_screen.dart';
import 'package:gotilo_job/Utils/App_Colors.dart';
import 'package:gotilo_job/Utils/responsive.dart';
import 'package:gotilo_job/Utils/screen_config.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: ScreenSizeConfig.spacing * 4),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                buildPage(
                  context,
                  'assets/images/logo.png',
                  'assets/images/introa.gif',
                  'Find',
                  'Your Dream Job',
                  'Here!',
                  'Explore thousands of job opportunities from top companies. Find the perfect job that matches your skills and goals.',
                ),
                buildPage(
                  context,
                  'assets/images/logo.png',
                  'assets/images/introb.gif',
                  'Apply',
                  'Effortlessly with Just',
                  'Few Taps',
                  'Easily submit job applications, upload your resume, and get noticed by recruiters. Your next career move is just a tap away!',
                ),
                buildPage(
                  context,
                  'assets/images/logo.png',
                  'assets/images/introc.gif',
                  'Stay',
                  'Updated and Get Hired',
                  'Faster',
                  'Track your applications in real time, receive instant updates from employers, and connect directly with hiring managers to secure.',
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenSizeConfig.padding,
              vertical: 20.0,
            ),
            child:
                _currentPage == 2
                    ? GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: ScreenSizeConfig.buttonHeight,
                        decoration: BoxDecoration(
                          color: AppColors.TxtOrangeColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: Text(
                            'Get Started',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenSizeConfig.fontSize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    )
                    : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomPageIndicator(
                          currentPage: _currentPage,
                          pageCount: 3,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.TxtOrangeColor,
                              ),
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
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

  Widget buildPage(
    BuildContext context,
    String logoPath,
    String illustrationPath,
    String title,
    String titlea,
    String titleb,
    String description,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            logoPath,
            width: AppDimensions.getScreenWidth(context) * 0.6,
          ),
          SizedBox(height: ScreenSizeConfig.spacing * 2),
          Image.asset(
            illustrationPath,
            height: AppDimensions.getScreenWidth(context) * 0.9,
          ),
          SizedBox(height: ScreenSizeConfig.spacing),
          Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.TxtblueColor,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  titlea,
                  style: TextStyle(
                    color: AppColors.TxtOrangeColor,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.TxtOrangeColor,
                    decorationThickness: 1.8,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  titleb,
                  style: TextStyle(
                    color: AppColors.TxtblueColor,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: ScreenSizeConfig.spacing - 5),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: ScreenSizeConfig.fontSize,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomPageIndicator extends StatelessWidget {
  final int currentPage;
  final int pageCount;

  const CustomPageIndicator({
    required this.currentPage,
    required this.pageCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pageCount, (index) {
        bool isActive = index == currentPage;
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 4.0),
          height: 8.0,
          width: isActive ? 24.0 : 8.0,
          decoration: BoxDecoration(
            color:
                isActive
                    ? AppColors.TxtOrangeColor
                    : AppColors.TxtOrangeColor.withOpacity(0.4),
            borderRadius: BorderRadius.circular(4.0),
          ),
        );
      }),
    );
  }
}
