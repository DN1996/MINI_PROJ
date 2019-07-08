
// Digital Restraunt
import 'dart:io';
import 'dart:async';
import 'Customermthods.dart' as cm;
import 'foodcooking.dart' as f;
import 'inventorymgmt.dart' as ivt;
// steps to execute

// A . Welcome and food presentation

// 1. ask
// 2. display menu
// 3. get order
// 4. prepare order
// 5. serve order
// 6. serve complementary starter
// 7. Serve order

// B. Exit and billing

// 1 Process bill
// 2. Process payment
// 3. Get feedback

 Future main() async {

   // Welcome Call
   cm.custINFO cust = cm.welcomecall();



    int pref=0;

    while (pref==0) {
      print("Initializing Inventory....");
      var itemstr = ivt.itemstream();

      // 1. display main menu / (exit)
      int pref= cm.displaymainmenu();
      if (pref==4) return;
      var itemlist =  await ivt.invtstream(itemstr);
      print("Menu initialized. To choose your meal type the code mentioned preceeding the meal name.  ");

      // 2. display cuisine menu / (go to main menu)
      Map<int,ivt.item> Cuimenu = ivt.getmenu(itemlist, pref); // getting cuisine menu

      // 3. place order
      Future<int> pref2  = f.placeorder(Cuimenu);
      print("Your food is being prepared...");
      pref = await pref2;
      if(pref == 0 ) continue;
      // 4. process bill while the order gets cooked

      // serve order

      print("Your Food is ready!!\n");
      var famt = cm.cust.getbill();
      print("\nProcessing bill amount...");
      var amt = await famt;
      print("""
      Bill amount =  $amt Rs + ${amt*(0.05)} Rs (5% GST) = ${amt*(1.05)} Rs 
      """);

      print("Enter 0 to reorder else 1 to exit");
      var inp = stdin.readLineSync();
      try {
        pref = int.parse(inp);
      } catch (e) {
        pref = -1;
      }

      if (pref == 1) {
        print("Thank you for using DIGITAL RESTAURAUNT");
        return;
      }
    }


}



