import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
import '../color/colors.dart';

class NewInventory extends StatefulWidget {
  final Function addItm;

  NewInventory(this.addItm);

  @override
  _NewInventoryState createState() => _NewInventoryState();
}

class _NewInventoryState extends State<NewInventory> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _categoryController = TextEditingController();
  final _measurementController = TextEditingController();
  final _totalSoldController = TextEditingController();
  final _quantityController = TextEditingController();

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = _amountController.text;
    final enteredCategory = _categoryController.text;
    final enteredMeasurement = _measurementController.text;
    final enteredTotalSold = _totalSoldController.text;
    final enteredQuantity = _quantityController.text;

    if (enteredTitle.isEmpty || enteredAmount.isEmpty || enteredCategory.isEmpty || enteredMeasurement.isEmpty || enteredTotalSold.isEmpty || enteredQuantity.isEmpty) {
      return;
    }

    widget.addItm(
      enteredTitle,
      enteredAmount,
      enteredCategory,
      enteredMeasurement,
      enteredTotalSold,
      enteredQuantity,
    );

    Navigator.of(context).pop();
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        margin: EdgeInsets.all(10),
        elevation: 5,
        child: Container(
          color: Color.fromRGBO(40, 73, 100, 1),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                style: TextStyle(
                  color: AppColors.primaryText,
                ),
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(
                    color: AppColors.primaryText,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.primaryText,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.primaryText,
                    ),
                  ),
                ),
                controller: _titleController,
                
              ),
              TextField(
                style: TextStyle(
                  color: AppColors.primaryText,
                ),
                decoration: InputDecoration(
                  labelText: 'Category',
                  labelStyle: TextStyle(
                    color: AppColors.primaryText,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.primaryText,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.primaryText,
                    ),
                  ),
                ),
                controller: _categoryController,
                 
              ),
              TextField(
                style: TextStyle(
                  color: AppColors.primaryText,
                ),
                decoration: InputDecoration(
                  labelText: 'Price',
                  labelStyle: TextStyle(
                    color: AppColors.primaryText,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.primaryText,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.primaryText,
                    ),
                  ),
                ),
                controller: _amountController,
                keyboardType: TextInputType.number,
                  
              ),
              TextField(
                style: TextStyle(
                  color: AppColors.primaryText,
                ),
                decoration: InputDecoration(
                  labelText: 'Quantity',
                  labelStyle: TextStyle(
                    color: AppColors.primaryText,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.primaryText,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.primaryText,
                    ),
                  ),
                ),
                controller: _quantityController,
                keyboardType: TextInputType.number,
                
              ),
              TextField(
                style: TextStyle(
                  color: AppColors.primaryText,
                ),
                decoration: InputDecoration(
                  labelText: 'Unit of Measurement',
                  labelStyle: TextStyle(
                    color: AppColors.primaryText,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.primaryText,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.primaryText,
                    ),
                  ),
                ),
                controller: _measurementController,
                 
              ),
              TextField(
                style: TextStyle(
                  color: AppColors.primaryText,
                ),
                decoration: InputDecoration(
                  labelText: 'Total Sold',
                  labelStyle: TextStyle(
                    color: AppColors.primaryText,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.primaryText,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.primaryText,
                    ),
                  ),
                ),
                controller: _totalSoldController,
                keyboardType: TextInputType.number,
                 
              ),
              RaisedButton(
                child: Text('Add Inventory'),
                color: AppColors.secondaryElement,
                textColor: Theme.of(context).textTheme.button.color,
                onPressed: _submitData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
