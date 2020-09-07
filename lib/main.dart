import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

main() {
  runApp(PepsiApp());
}

class PepsiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'pepsi',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          TextTheme(
            headline1: TextStyle(
              fontSize: 80,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            headline2: TextStyle(
              fontSize: 70,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedFlavour = 'blue';

  Map flavoursMap = {
    'blue': 'pepsi001',
    'silver': 'pepsi002',
    'black': 'pepsi003',
  };

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    print('main screen being rebuilt');
    return Scaffold(
      backgroundColor: Colors.blue,
      body: DefaultTextStyle(
        style: TextStyle(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              AppBar(),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 80,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'THAT\'S WHAT',
                            style: textTheme.headline2,
                          ),
                          Text(
                            'I LIKE',
                            style: textTheme.headline1,
                          ),
                          Text(
                            'Pepsi. Diet Pepsi. Pepsi Zero Sugar. The gang’s all here.\nCompare flavors, get nutritional facts and check out\n ingredients for all our Pepsi products.',
                          ),
                          CustomButton(),
                        ],
                      ),
                    ),
                    Expanded(
                        child:
                            Image.asset('${flavoursMap[selectedFlavour]}.png')),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'facebook.png',
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'twitter.png',
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'instagram.png',
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SelectCategoryButton(
                      path: 'pepsi001',
                      onPress: () {
                        setState(() {
                          selectedFlavour = 'blue';
                        });
                      },
                    ),
                    SelectCategoryButton(
                      path: 'pepsi002',
                      onPress: () {
                        setState(() {
                          selectedFlavour = 'silver';
                        });
                      },
                    ),
                    SelectCategoryButton(
                      path: 'pepsi003',
                      onPress: () {
                        setState(() {
                          selectedFlavour = 'black';
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: screenSize.height * .15,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 80,
            ),
            LimitedBox(
              maxHeight: 60,
              child: Image.asset('logo.png'),
            ),
            Spacer(),
            NavMenu(),
            // Spacer(),
          ],
        ),
      ),
    );
  }
}

class NavMenu extends StatefulWidget {
  @override
  _NavMenuState createState() => _NavMenuState();
}

class _NavMenuState extends State<NavMenu> {
  String selectedButton = 'Home';
  List<String> buttons = [
    'Home',
    'Products',
    'What\'s New',
    'Newsletter',
    'Contact',
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var button in buttons)
          FlatButton(
            onPressed: () {
              setState(() {
                selectedButton = button;
              });
            },
            child: Text(
              button,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedButton == button ? Colors.red : Colors.white,
              ),
            ),
          ),
      ],
    );
  }
}

class CustomButton extends StatefulWidget {
  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isBeingHovred = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.white),
          color: isBeingHovred ? Colors.white : Colors.blue,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            // hoverColor: isBeingHovred ? Colors.white : Colors.blue,
            onHover: (hoveringOn) {
              setState(() {
                isBeingHovred = hoveringOn;
              });
            },
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'VIEW PRODUCTS',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: isBeingHovred ? Colors.blue : Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SelectCategoryButton extends StatefulWidget {
  final String path;
  final GestureTapCallback onPress;
  const SelectCategoryButton({
    Key key,
    this.path,
    this.onPress,
  }) : super(key: key);
  @override
  SelectCategoryButtonState createState() => SelectCategoryButtonState();
}

class SelectCategoryButtonState extends State<SelectCategoryButton> {
  double buttonOffSetOnHover = 0;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      splashColor: Colors.transparent,
      onHover: (hoveringOn) {
        print(hoveringOn);
        if (hoveringOn) {
          setState(() {
            buttonOffSetOnHover = -10;
          });
        } else {
          setState(() {
            buttonOffSetOnHover = 0;
          });
        }
      },
      // onTap: () {
      //   setState(() {
      //     selectedFlavour = 'blue';
      //     // selectedFlavour = flavoursMap[]
      //   });
      // },
      onTap: widget.onPress,
      child: Transform.translate(
        offset: Offset(0, buttonOffSetOnHover),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('${widget.path}.png', scale: .2),
        ),
      ),
    );
  }
}
