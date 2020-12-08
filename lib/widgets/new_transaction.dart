import "package:flutter/material.dart";

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final expenseTitle = titleController.text;
    final expenseAmount = double.parse(amountController.text);

    if (expenseTitle.isEmpty || expenseAmount < 0) {
      return;
    }
    widget.addNewTransaction(
      titleController.text,
      double.parse(amountController.text),
    );

    Navigator.of(context).pop();
  //  Read About Widget , State , Context .
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Expense Title."),
              controller: titleController,
              onSubmitted: (_) => submitData(),
              // onChanged: (value) => expenseTitleInput = value;
            ),
            TextField(
              decoration: InputDecoration(labelText: "Expense Ammount."),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) =>
                  submitData(), // Indicate We Don't Use the Inline Parameter
              // For Ios - > TextInputType.numberWithOptions(decimals:true)
              // onChanged: (value) => expenseAmountInput = value;
            ),
            FlatButton(
              child: Text("Add Transaction"),
              textColor: Colors.blue,
              onPressed: () {
                // print(expenseTitleInput + " : " + expenseAmountInput);
                print(titleController.text + " : " + amountController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
