import "package:flutter/material.dart";

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addNewTransaction;

  void submitData() {
    final expenseTitle = titleController.text;
    final expenseAmount = double.parse(amountController.text);

    if (expenseTitle.isEmpty || expenseAmount < 0) {
      return;
    }
    addNewTransaction(
      titleController.text,
      double.parse(amountController.text),
    );
  }

  NewTransaction(this.addNewTransaction);

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
