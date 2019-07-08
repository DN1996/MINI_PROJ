// Inventory Management

//Cuisine Codes:
//1. NorthIndian
//2. SouthIndian
//3. Chinese

import 'dart:async';

//Future<String> billing() async =>
//    Future.delayed(Duration(seconds: 10), () => "Processing your bill... ");

class item {
  String name;
  int CuiCode; // Cuisine Code
  int price;


  item(this.name,this.CuiCode,this.price);
}


const List<String> Itname = ["Veg Hakka Noodles","Schezwan Fried Rice", "Paneer Manchurian" , "Pav Bhaji" , "Chole Bhature"
, "Aloo Paratha with Curd" , "Mix Veg with Tandoori Roti","Poha","Masala Dosa","Curd Rice","Sambhar Vada","Idli","Tomato Soup"
,"Sweet Corn","Chilli Paneer"];

const List<int> ItCode = [3,3,3,1,1,1,1,1,2,2,2,2,1,2,3];
const List<int> Itprice = [30,30,50,30,30,30,50,20,40,20,20,30,20,20,30] ;


// SENDING MENU AS A STREAM

Future<List<item>> invtstream(Stream<item> stream) async {

  var invtlist = new List<item>();
  await for (var itm in stream) {
    invtlist.add(itm);
  }
  return invtlist;
}

Stream<item> itemstream() async*{
  for (int i=0;i<Itname.length;i++) {
    var obj = new item(Itname[i], ItCode[i], Itprice[i]);
    yield obj;
  }
}

// GETTING MENU AS PER CUSTOMER PREFERENCE

Map getmenu(List<item> itemlist, int pref) {
  var Cuimenu = new Map<int,item>();
  int i=1;
  for (var v in itemlist) {
    if (v.CuiCode == pref) Cuimenu[i] = v;
    i+=1;
  }

  return Cuimenu;

}