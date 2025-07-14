import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gotilo_job/View/BottomNavigationBarScreens/Employee/employee_bottom_navigation_bar.dart';
import 'package:gotilo_job/Utils/App_Colors.dart';
import 'package:gotilo_job/Utils/responsive.dart';
import 'package:gotilo_job/Utils/screen_config.dart';

class Planpageemp extends StatefulWidget {
  const Planpageemp({super.key});

  @override
  State<Planpageemp> createState() => _PlanpageempState();
}

class _PlanpageempState extends State<Planpageemp> {
  final List<String> pricingPlans = [
    'Free Plan',
    'Basic Plan',
    'Standard Plan',
    'Premium Plan',
    'Your Plan',
  ];
  String selectedPlan = 'Free Plan';
  int _currentCarouselIndex = 0;

  // Colors defined directly
  final Color freePlanColor = Colors.blueGrey;
  final Color basicPlanColor = Colors.blue;
  final Color standardPlanColor = Color(0xFF2962FF);
  final Color premiumPlanColor = Colors.deepPurple;
  final Color activeGreen = Colors.green;
  final Color warningOrange = Color(0xFFFF6D00);
  final Color textGrey = Color(0xFF616161);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: AppColors.blackColor),
        title: Text(
          "Select Plan",
          style: TextStyle(
            fontFamily: TextFont.PoppinsMedium,
            fontSize: ScreenSizeConfig.fontSize + 3,
            color: Colors.black,
          ),
        ),
        titleSpacing: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Container(
                width: isSmallScreen ? screenWidth * 0.8 : screenWidth * 0.65,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.TxtblueColor.withOpacity(0.3),
                    width: 1.5,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.workspace_premium,
                      color: standardPlanColor,
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value:
                              pricingPlans.contains(selectedPlan)
                                  ? selectedPlan
                                  : null,
                          hint: Text(
                            "Select Plan",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: standardPlanColor,
                          ),
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                          items:
                              pricingPlans.map((String plan) {
                                return DropdownMenuItem<String>(
                                  value: plan,
                                  child: Text(plan),
                                );
                              }).toList(),
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() {
                                selectedPlan = newValue;
                                if (newValue == 'Your Plan') {
                                  _currentCarouselIndex =
                                      pricingPlans.indexOf(newValue) - 1;
                                }
                              });
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              if (selectedPlan != 'Your Plan')
                Column(
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: screenHeight * 0.65,
                        minHeight: 500, // Minimum height to prevent overflow
                      ),
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: screenHeight * 0.65,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: false,
                          viewportFraction: isSmallScreen ? 0.9 : 0.8,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentCarouselIndex = index;
                              selectedPlan = pricingPlans[index];
                            });
                          },
                        ),
                        items: List.generate(
                          4,
                          (index) => planCard(
                            screenWidth,
                            screenHeight,
                            index == 2,
                            index,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(4, (index) {
                        return Container(
                          width: 10,
                          height: 10,
                          margin: EdgeInsets.symmetric(horizontal: 2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                _currentCarouselIndex == index
                                    ? AppColors.TxtblueColor
                                    : Colors.grey.withOpacity(0.4),
                          ),
                        );
                      }),
                    ),
                  ],
                ),

              if (selectedPlan == 'Your Plan')
                Column(
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: screenWidth * 0.9,
                        minWidth: 300,
                      ),
                      child: currentPlanCard(screenWidth, screenHeight),
                    ),
                    SizedBox(height: 30),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: screenWidth * 0.9,
                        minWidth: 300,
                      ),
                      child: supportCard(screenWidth, screenHeight),
                    ),
                  ],
                ),

              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget planCard(double width, double height, bool isRecommended, int index) {
    final plansData = [
      {
        'name': 'Free',
        'price': '0',
        'features': [
          'Create up to 3 job posts',
          'Manage applicants (basic)',
          'Limited candidate access',
          'Basic analytics',
        ],
      },
      {
        'name': 'Basic',
        'price': '4,999',
        'features': [
          'Create up to 10 job posts',
          'Advanced applicant management',
          'Candidate matching',
          'Basic support',
        ],
      },
      {
        'name': 'Standard',
        'price': '8,999',
        'features': [
          'Unlimited job posts',
          'Priority applicant management',
          'Advanced analytics',
          'Dedicated support',
        ],
      },
      {
        'name': 'Premium',
        'price': '12,999',
        'features': [
          'Unlimited job posts',
          'AI-powered candidate matching',
          'Advanced analytics dashboard',
          '24/7 dedicated support',
        ],
      },
    ];

    final plan = plansData[index];
    Color planColor;

    // Assign colors directly based on index
    switch (index) {
      case 0:
        planColor = freePlanColor;
        break;
      case 1:
        planColor = basicPlanColor;
        break;
      case 2:
        planColor = standardPlanColor;
        break;
      case 3:
        planColor = premiumPlanColor;
        break;
      default:
        planColor = standardPlanColor;
    }

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: isRecommended ? 0 : 20,
      ),
      constraints: BoxConstraints(
        minHeight: 500, // Prevent card from being too small
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 0),
          ),
        ],
        border:
            isRecommended
                ? Border.all(
                  color: standardPlanColor.withOpacity(0.5),
                  width: 2,
                )
                : null,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  if (isRecommended)
                    SizedBox(
                      height: AppDimensions.getScreenHeight(context) * 0.02,
                    ),
                  if (isRecommended)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: warningOrange.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "MOST POPULAR",
                        style: TextStyle(
                          fontSize: 12,
                          color: warningOrange,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),

                  SizedBox(height: isRecommended ? 10 : 20),

                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: planColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.workspace_premium,
                      size: 40,
                      color: planColor,
                    ),
                  ),

                  SizedBox(height: 20),

                  Text(
                    "${plan['name']} Plan",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),

                  SizedBox(height: 8),

                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '₹${plan['price']}',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: planColor,
                          ),
                        ),
                        TextSpan(
                          text: '/month',
                          style: TextStyle(fontSize: 16, color: textGrey),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                ],
              ),

              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children:
                          (plan['features'] as List<String>).map((feature) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                    size: 20,
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      feature,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade800,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                    ),
                  ),
                ),
              ),

              Container(
                width: width * 0.6,
                margin: EdgeInsets.only(bottom: 30, top: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => BottomNavigationBarScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: planColor,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    "Choose ${plan['name']}",
                    style: TextStyle(
                      fontSize: ScreenSizeConfig.fontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget currentPlanCard(double width, double height) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            standardPlanColor.withOpacity(0.1),
            Colors.white,
            standardPlanColor.withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: Offset(0, 8),
          ),
        ],
        border: Border.all(
          color: standardPlanColor.withOpacity(0.3),
          width: 1.5,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "CURRENT PLAN",
                style: TextStyle(
                  fontSize: 12,
                  color: standardPlanColor,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: activeGreen.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "Active",
                  style: TextStyle(
                    fontSize: 12,
                    color: activeGreen,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 20),

          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: standardPlanColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.workspace_premium,
              size: 40,
              color: standardPlanColor,
            ),
          ),

          SizedBox(height: 20),

          Text(
            "Premium Plan",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),

          SizedBox(height: 8),

          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '₹12,999',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: standardPlanColor,
                  ),
                ),
                TextSpan(
                  text: '/month',
                  style: TextStyle(fontSize: 16, color: textGrey),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          Divider(color: Colors.grey.shade300, thickness: 1),

          SizedBox(height: 20),

          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 400) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: buildPlanDetails(),
                );
              } else {
                return Column(
                  children:
                      buildPlanDetails()
                          .map(
                            (widget) => Padding(
                              padding: EdgeInsets.only(bottom: 15),
                              child: widget,
                            ),
                          )
                          .toList(),
                );
              }
            },
          ),

          SizedBox(height: 30),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 14),
                side: BorderSide(color: standardPlanColor, width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Upgrade Plan",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: standardPlanColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildPlanDetails() {
    return [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Activated On", style: TextStyle(fontSize: 12, color: textGrey)),
          Text(
            "12 Aug 2025",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),

      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Expires On", style: TextStyle(fontSize: 12, color: textGrey)),
          Text(
            "21 Nov 2025",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: warningOrange,
            ),
          ),
        ],
      ),

      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Days Left", style: TextStyle(fontSize: 12, color: textGrey)),
          Text(
            "87 days",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    ];
  }

  Widget supportCard(double width, double height) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: standardPlanColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Need Help?",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          SizedBox(height: 8),

          Text(
            "Our support team is available 24/7 to assist you with any questions or issues.",
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.9),
            ),
          ),

          SizedBox(height: 20),

          // Responsive button layout
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 350) {
                return Row(
                  children: [
                    Expanded(
                      child: supportButton(
                        icon: Icons.phone,
                        text: "Call Support",
                        isPrimary: true,
                      ),
                    ),

                    SizedBox(width: 10),

                    Expanded(
                      child: supportButton(
                        icon: Icons.chat,
                        text: "Live Chat",
                        isPrimary: false,
                      ),
                    ),
                  ],
                );
              } else {
                return Column(
                  children: [
                    supportButton(
                      icon: Icons.phone,
                      text: "Call Support",
                      isPrimary: true,
                    ),

                    SizedBox(height: 10),

                    supportButton(
                      icon: Icons.chat,
                      text: "Live Chat",
                      isPrimary: false,
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget supportButton({
    required IconData icon,
    required String text,
    required bool isPrimary,
  }) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 18),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary ? Colors.white : Colors.transparent,
        foregroundColor: isPrimary ? standardPlanColor : Colors.white,
        padding: EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: isPrimary ? BorderSide.none : BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
