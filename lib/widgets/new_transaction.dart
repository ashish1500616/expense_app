import "package:flutter/material.dart";

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addNewTransaction;

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
              // onChanged: (value) => expenseTitleInput = value;
            ),
            TextField(
              decoration: InputDecoration(labelText: "Expense Ammount."),
              controller: amountController,
              // onChanged: (value) => expenseAmountInput = value;
            ),
            FlatButton(
              child: Text("Add Transaction"),
              textColor: Colors.blue,
              onPressed: () {
                // print(expenseTitleInput + " : " + expenseAmountInput);
                print(titleController.text + " : " + amountController.text);
                addNewTransaction(
                  titleController.text,
                  double.parse(amountController.text),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
