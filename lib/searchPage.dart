import 'package:flutter/material.dart';
import 'package:jewls/utils/constants.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String dropdownValue = 'Recommended';
  var selectedRange = RangeValues(3000, 24000);

  List<bool> isSelected;
  List<String> buttonNames; //widget.buttonNames.length

  int getButtons() {
    buttonNames = [
      'Drop & Danglers',
      'Studs & Tops',
      'Jhumkas',
      'Hoops and Huggies',
      'Ear Cuffs',
      'Chand bali',
      'Sui Dhaga',
      'Mismatched',
      'Chandeliers',
      'Ear Jacket',
    ];

    return buttonNames.length;
  }

  @override
  void initState() {
    super.initState();
    isSelected = List<bool>.generate(getButtons(), (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kSearchPageCardColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(27.0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      child: Icon(
                        Icons.clear,
                        color: kInactiveSearchPageTextColor,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 20),
                      child: Text(
                        'Filters',
                        style: TextStyle(
                          fontSize: 31.0,
                          color: kInactiveSearchPageTextColor,
                          fontFamily: 'PlayfairDisplay',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 7.0),
                      child: Text(
                        'Sort by',
                        style: kSubtitleSearchPageTextStyle,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 30.0,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Color(0xff707070),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton<String>(
                            icon: Icon(Icons.expand_more),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(
                              color: Color(0xff707070),
                              fontFamily: 'PlayfairDisplay',
                            ),
                            value: dropdownValue,
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
                              });
                            },
                            items: <String>[
                              'Recommended',
                              'What\'s New',
                              'Popularity',
                              'Better Discount',
                              'Price: High to Low',
                              'Price: Low to High',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 25.0, bottom: 5.0),
                      child: Text(
                        'Features',
                        style: kSubtitleSearchPageTextStyle,
                      ),
                    ),
                    Wrap(
                      direction: Axis.horizontal,
                      spacing: 11.0,
                      children: buttonNames.asMap().entries.map((entry) {
                        return ReusableSearchPageFilterButtons(
                          name: entry.value,
                          isSelected: isSelected[entry.key],
                          onPressed: () {
                            setState(() {
                              isSelected[entry.key] = !isSelected[entry.key];
                            });
                          },
                        );
                      }).toList(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 25.0, bottom: 5.0),
                      child: Text(
                        'Style',
                        style: kSubtitleSearchPageTextStyle,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 31.0, bottom: 25.0),
                      child: Text(
                        'Price Range',
                        style: kSubtitleSearchPageTextStyle,
                      ),
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        showValueIndicator: ShowValueIndicator.always,
                        trackShape: RectangularSliderTrackShape(),
                        trackHeight: 2.0,
                        // valueIndicatorShape:
                        //     RectangularSliderValueIndicatorShape(),
                        // valueIndicatorColor: Colors.transparent,
                        // valueIndicatorTextStyle:
                        //     TextStyle(color: Color(0xff7E3338), fontSize: 14.0),
//                        rangeValueIndicatorShape:
//                            PaddleRangeSliderValueIndicatorShape(),
                        //Note: valueIndicatorShape and rangeValueIndicatorShape are both same in this example. The value indicator's/ range value indicator's color is not the same as the thumb and active track (which can be defined by activeColor) if the RectangularSliderValueIndicatorShape is used. In all other cases, value indicator is assumed to be the same as the active color. SEE DOCS
                      ),
                      child: RangeSlider(
                        values: selectedRange,
                        min: 0.0,
                        max: 50000.0,
                        //added talk back feature for android
                        semanticFormatterCallback: (RangeValues rangeValues) {
                          return '${rangeValues.start.round()} - ${rangeValues.end.round()} dollars';
                        },
                        labels: RangeLabels('${selectedRange.start.round()}',
                            '${selectedRange.end.round()}'),
                        activeColor: Color(0xff7E3338),
                        inactiveColor: Color(0xffD7D8DD),
                        onChanged: (RangeValues newRange) {
                          setState(() => selectedRange = newRange);
                        },
                      ),
                    ), //todo: make custom slider!
                    Padding(
                      padding: EdgeInsets.only(top: 30.0, bottom: 5.0),
                      child: Text(
                        'Material',
                        style: kSubtitleSearchPageTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Reset',
                    style: kSubtitleSearchPageTextStyle,
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: kInactiveSearchPageTextColor,
                  padding: EdgeInsets.symmetric(horizontal: 77, vertical: 15),
                  onPressed: () {},
                  child: Text(
                    'Apply Filters',
                    style: TextStyle(
                      fontSize: 19.0,
                      fontFamily: 'PlayfairDisplay',
                      color: kActiveSearchPageTextColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ReusableSearchPageFilterButtons extends StatelessWidget {
  final bool isSelected;
  final String name;

  /// OnPressed is passed from the parent. This can be changed to handle it using any state management.
  final Function onPressed;

  ReusableSearchPageFilterButtons(
      {@required this.name,
      @required this.isSelected,
      @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: isSelected
          ? kActiveSearchPageButtonColor
          : kInactiveSearchPageButtonColor,
      onPressed: onPressed,
      child: Text(
        name,
        style: TextStyle(
          fontSize: 15.0,
          fontFamily: 'PlayfairDisplay',
          color: isSelected
              ? kActiveSearchPageTextColor
              : kInactiveSearchPageTextColor,
        ),
      ),
    );
  }
}

//TODO:
//Stream builder from database
