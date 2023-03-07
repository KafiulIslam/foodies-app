import 'package:flutter/material.dart';
import 'package:foodies/widgets/common_classes.dart';
import 'package:foodies/utils/constantpage.dart';
import 'package:foodies/main.dart';


class ItemSearch extends SearchDelegate<String> {

  final cities = [
    "Bogura",
    "Nouga",
    "natore",
    "cumilla",
    "jessore",
    "dhaka",
    "rangpur",
    "pabna",
    "kustia",
    "rajshahi",
  ];

  final recentSearches = [
    "natore",
    "cumilla",
    "jessore",
    "dhaka",
    "rangpur",
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [IconButton(onPressed: () {
   query = "";
    } , icon: const Icon(Icons.clear))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          close(context,' ');
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container(
      alignment: Alignment.center,
      height: 100,width: 200,
      child: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final suggestionList = query.isEmpty ? recentSearches : cities.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
        itemBuilder: (context, index) => ListTile(
          onTap: (){
            showResults(context);
          },
              leading: const Icon(Icons.location_city,color: brandColor,),
              title:RichText(
                text: TextSpan(
                  text: suggestionList[index].substring(0,query.length),
                  style: const TextStyle(fontSize: 20,color: brandColor, fontWeight: FontWeight.bold
                  ),
                    children: [
                      TextSpan(
                        text: suggestionList[index].substring(query.length),
                        style: const TextStyle(fontSize: 20,color: deepAss,
                        ),
                      ),
                    ]
                ),

              ),

            ),
    itemCount: suggestionList.length,
    );
  }
}


class Assistant extends StatelessWidget {
  const Assistant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context) => const OnBoard()));
          },
          child: const Text('Next page', style: TextStyle(
            color: brandColor,fontSize: 30,
          ),),

        ),
      ),
    );
  }
}


class WheelList extends StatefulWidget {
  const WheelList({Key? key}) : super(key: key);

  @override
  _WheelListState createState() => _WheelListState();
}

class _WheelListState extends State<WheelList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('wheel list'),
      ),
      body: Padding(

        padding: const EdgeInsets.all(8.0),
        child: ListWheelScrollView(
          itemExtent: 1,
          diameterRatio: 2,

          children:   [
            Container(height: 500,width: 300,
            color: Colors.red,),


            // FavouriteCard(image: 'images/pizza.png', itemName: "Beef Pizza", price: "1200 tk"),
            // FavouriteCard(image: 'images/vagetable pasta.png', itemName: "Vegetable Pasta", price: "450 tk"),
            // FavouriteCard(image: 'images/noodles.png', itemName: "Egg Noodles", price: "320 tk"),
            // FavouriteCard(image: 'images/noodles.png', itemName: "Egg Noodles", price: "320 tk"),
            // FavouriteCard(image: 'images/noodles.png', itemName: "Egg Noodles", price: "320 tk"),
            // FavouriteCard(image: 'images/noodles.png', itemName: "Egg Noodles", price: "320 tk"),
          ],
        ),
      ),
    );
  }
}





