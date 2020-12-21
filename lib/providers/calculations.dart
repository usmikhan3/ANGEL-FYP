import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizzato/services/manageData.dart';
import 'package:provider/provider.dart';

class Calculations with ChangeNotifier {
  // int cheeseValue = 0;
  // int beaconValue = 0;
  // int onionValue = 0;
  int quantity = 0;
  int cartData = 0;
  int subTotal = 0;
  //int quantity = 0;
  String size;

  bool isSelected = false;
  bool smallTapped = false;
  bool mediumTapped = false;
  bool largeTapped = false;

  bool selected = false;

  // int get getCheeseValue => cheeseValue;
  // int get getBeaconValue =>beaconValue;
  // int get getOnionValue =>onionValue;
  int get getQuantity => quantity;
  int get getCartData => cartData;
  int get getSubTotal => subTotal;
  bool get getSelected =>selected;
  String get getSize =>size;

  // addCheese(){
  //   cheeseValue++;
  //   notifyListeners();
  // }
  // addBeacon(){
  //   beaconValue++;
  //   notifyListeners();
  // }
  //
  // addOnion(){
  //   onionValue++;
  //   notifyListeners();
  // }

  // minusOnion(){
  //   onionValue --;
  //   notifyListeners();
  // }
  // minusCheese(){
  //   cheeseValue --;
  //   notifyListeners();
  // }
  // minusBeacon(){
  //   beaconValue --;
  //   notifyListeners();
  // }

  addQuantity(){
    quantity++;
    notifyListeners();
  }

  minusQuantity(){
    quantity--;
    notifyListeners();
  }

  selectSmallSize(){
    smallTapped = true;
    size = 'S';
    notifyListeners();
  }

  selectMediumSize(){
    mediumTapped = true;
    size = 'M';
    notifyListeners();
  }

  selectLargeSize(){
    largeTapped = true;
    size = 'L';
    notifyListeners();
  }

  removeAllData(){
    // cheeseValue = 0;
    // beaconValue =0;
    // onionValue =0;
    quantity = 0;
    mediumTapped = false;
    largeTapped = false;
    smallTapped = false;
    notifyListeners();
  }




  addToCart(BuildContext context, dynamic data) async{
    if(smallTapped !=false || mediumTapped !=false || largeTapped !=null){
      cartData++;
      await Provider.of<ManageData>(context, listen: false).submitData(context, data);
      notifyListeners();
    }else{
      return showModalBottomSheet(
          context: context,
          builder: (context){
            return Container(
              height: 50.0,
              child: Center(
                child: Text('Select Size', style: TextStyle(color: Colors.white),),
              ),
            );
          });
    }
  }




}
