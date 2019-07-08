import 'dart:async';
import 'dart:core';
import 'dart:io';
import 'inventorymgmt.dart' as ivt;
import 'Customermthods.dart' as cm;


//mixin starter {
//  var stt = ["Tomato Soup","Sweet Corn","Chilli Paneer"];
//
//  sttmethod(int i) {
//    print("Enjoy your Complementary Starter: ${stt[i-1]}, your delicious meal will be here in a while :) ");
//  }
//
//}


class food  {
  Map<int,ivt.item> menu;
  food(this.menu);
  ivt.item currord ;

  int selectitem() {
    int x = -1;

    while( x == -1) {
      menu.forEach((k, v) => print("$k : ${v.name} : ${v.price} Rs"));
      print("Enter 0 to return to cuisine menu");
      var i = stdin.readLineSync();
      try {
        x = int.parse(i);
      } catch (e) {
        x = -1;
      }
    }
    if (x==0 || !(menu.containsKey(x))) return 0;
    cm.cust.addbill(menu[x]);
    return x;
  }

  Future<int> foodprep() async {
    var y = await cooking();
    return y;
  }
}
Future<int> cooking() => Future.delayed(Duration(seconds: 6), () => 999);


Future<int> placeorder(Map Cuimenu) async{
  var order = new food(Cuimenu);
  int x = 0 ;
  while(x==0){
    x = order.selectitem();
    if (x == 0 ) return 0;
    print("To continue ordering food enter 0 else 1 to place order");
    var inp = stdin.readLineSync();
    try {
      x = int.parse(inp);
    } catch (e) {
      x = -1;
    }

  }

  return order.foodprep();

}


