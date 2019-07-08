
import 'dart:io';
import 'inventorymgmt.dart' as ivt;

class custINFO {
  String name;
  var bill = List<ivt.item>();
  custINFO(this.name);

  addbill(ivt.item i) {
    bill.add(i);
  }

  Future<int> getbill() async {
    int sum = 0 ;

    print("\nYour order details: ");
    for(var v in bill) {
      sum = sum + v.price;
      print("${v.name} : ${v.price}");
    }
    return Future.delayed(Duration(seconds: 4), ()=> sum);

  }

  int cuisinepreference() {
      int x = 0 ;

      while( (x != 1) && (x!=2) && (x!=3) && (x!=4)) {

        print("""\n Hi $name! Welcome to DIGITAL Restaurant
        Please Select the number of the cuisine you want to eat and press enter
        1. North Indian
        2. South Indian
        3. Chinese
        4. Exit             
        """);
        var i = stdin.readLineSync();
        try {
          x = int.parse(i);
        } catch(e) {
          x = 0;
        }
      }
      return x;
  }
}

var cust = new custINFO("XX");

custINFO welcomecall() {
  print("""
  *** Digital Restaurant *** 
  Please enter your name: 
  """);
  var custname = stdin.readLineSync();
  cust.name = custname;
  return cust;
}

int displaymainmenu() => cust.cuisinepreference();




