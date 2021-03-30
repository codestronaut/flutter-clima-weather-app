import 'package:flutter/material.dart';
import 'package:flutter_clima/utilities/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({Key key}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  List time = ["08:00", "09:00", "10:00", "11:00", "12:00"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.location_searching),
          onPressed: () {},
        ),
        title: Text(
          'Bandung',
          style: GoogleFonts.raleway(
            fontSize: 22.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: ReusableCard(
              cardMargin: EdgeInsets.all(
                16.0,
              ),
              cardChild: Center(
                child: Image.asset(
                  'assets/storm.png',
                  width: 300.0,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ReusableCard(
              cardColor: kSmoothPurple,
              cardMargin: EdgeInsets.all(
                16.0,
              ),
              cardGradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Color(0xFFFA62E4),
                  Color(0xFF3463F2),
                ],
              ),
              cardChild: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Wind',
                        style: GoogleFonts.raleway(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '8',
                            style: GoogleFonts.poppins(
                              fontSize: 35.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 4.0),
                          Text(
                            'km/h',
                            style: GoogleFonts.poppins(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  VerticalDivider(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Temp',
                        style: GoogleFonts.raleway(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '18',
                            style: GoogleFonts.poppins(
                              fontSize: 35.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 4.0),
                          Text(
                            '°C',
                            style: GoogleFonts.poppins(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  VerticalDivider(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Humidity',
                        style: GoogleFonts.raleway(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '79',
                            style: GoogleFonts.poppins(
                              fontSize: 35.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 4.0),
                          Text(
                            '%',
                            style: GoogleFonts.poppins(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: ReusableCard(
                    cardChild: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Today',
                            style: GoogleFonts.poppins(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.arrow_forward_rounded,
                            ),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: time.length,
                    itemBuilder: (context, index) {
                      return ReusableCard(
                        cardColor: kPrimaryColor,
                        cardPadding: EdgeInsets.all(24.0),
                        cardMargin: EdgeInsets.fromLTRB(
                          16.0,
                          14.0,
                          0.0,
                          24.0,
                        ),
                        cardGradient: index == 1
                            ? LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [
                                  Color(0xFFFA62E4),
                                  Color(0xFF3463F2),
                                ],
                              )
                            : null,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '${time[index]}',
                              style: GoogleFonts.poppins(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 12.0,
                            ),
                            Image.asset(
                              'assets/clear.png',
                              height: 48.0,
                              width: 48.0,
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '18',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(width: 4.0),
                                Text(
                                  '°C',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    },
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

class ReusableCard extends StatelessWidget {
  final Color cardColor;
  final Gradient cardGradient;
  final EdgeInsetsGeometry cardPadding;
  final EdgeInsetsGeometry cardMargin;
  final Widget cardChild;
  ReusableCard({
    this.cardColor,
    this.cardGradient,
    this.cardPadding,
    this.cardMargin,
    this.cardChild,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: cardPadding,
      decoration: BoxDecoration(
        color: cardColor,
        gradient: cardGradient,
        borderRadius: BorderRadius.circular(24.0),
      ),
      margin: cardMargin,
      child: cardChild,
    );
  }
}

// TODO: Refactor Code!!!