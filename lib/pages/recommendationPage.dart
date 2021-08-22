import 'package:flutter/material.dart';
import 'animations.dart';
import 'attractions.dart';
import 'placedetails.dart';
import 'placesresult.dart';
import 'attractionCard.dart';
import 'profile.dart';
import 'dart:math';

class RecommendationPage extends StatefulWidget {

  @override
  _RecommendationPageState createState() => _RecommendationPageState();
}

class _RecommendationPageState extends State<RecommendationPage> {

  final String apikey = 'AIzaSyCQXqjK34UVxzTQW2zH9oB3WimKrYVHGpo';

  List<Result> hotelResults = [];
  PlaceDetails placeDetails = new PlaceDetails();
  List<Attraction> potentialHotels = [];

  List<String> imgUrls = [];
  static bool errorHasOccurred = false;
  String lat = "";
  String lng = "";

  List<double> lats = [];
  List<double> lngs = [];

  Future<void> getHotelsList(List<Result> results) async {
    print('check');
    results.forEach((f) {
      potentialHotels.add(Attraction(
        placeID: f.placeId,
        name : f.name.toString(),
        latitude : f.geometry!.location!.lat,
        longitude : f.geometry!.location!.lng,
        rating : f.rating,
        userRatingsTotal : f.userRatingsTotal,
        vicinity: f.vicinity,
        priceLevel: (Random().nextInt(10)+1)*10,
        thumbnail: 'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=${f.photos![0].photoReference}&key=$apikey',
      ));
    });
    print(potentialHotels);
    Future.delayed(const Duration(milliseconds: 2500), () {
      setState(() {
      });
    });
  }

  List<Attraction> getPotentialHotels(){
    List<Attraction> potentialHotels = [];
    Profile.selectedHotels!.forEach((h){
      int sum = h.priceLevel!*10;
      Profile.selectedAttractions!.forEach((a){sum += a.priceLevel!*10;});
      if(sum <= Profile.budget!){
        potentialHotels.add(h);
      }
    });
    return potentialHotels;
  }


  @override
  void initState() {
    getPotentialHotels();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 10.0, bottom: 10.0, right: 30.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xfff05042),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
            ),
            onPressed: () {
              setState(() {
              });
            },
            child: Text(
              "Save Trip",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace, color: Colors.black),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Recommendation', style: Theme.of(context).textTheme.headline6, textAlign: TextAlign.left,),
                  Text('The total trip cost is ', style: Theme.of(context).textTheme.bodyText2, textAlign: TextAlign.left,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 20.0),
              child: potentialHotels.length != 0 && errorHasOccurred == false ?
              GridView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 15.0),
                  itemCount: potentialHotels.length,
                  itemBuilder: (BuildContext context, int index) {
                    return AttractionCard(
                      obj: potentialHotels[index],
                      selectedCard: Profile.selectedHotels!.contains(potentialHotels[index]) == false ? false : true,
                    );
                  }) :
              errorHasOccurred == false ? Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 150.0),
                child: FadingBoxes(),
              ) :
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 150.0),
                child: Text('Some Error has ocurred'),
              )
              ,
            ),
          ],
        ),

      ),
    );
  }
}
