import 'package:flutter/material.dart';

class AddExpenseScreen extends StatelessWidget {
  const AddExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.close)),
        title: Text("New Expense"),
        centerTitle: true,
        actions: [TextButton(onPressed: () {}, child: Text("Reset"))],
      ),

      body: Column(
        children: [
          // Income expense toggle buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 48,
                width: MediaQuery.of(context).size.width * 0.45,
                color: Colors.red,
                child: Center(
                  child: Text(
                    "Expense",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              Container(
                height: 48,
                width: MediaQuery.of(context).size.width * 0.45,
                color: Colors.red,
                child: Center(child: Text("Income")),
              ),
            ],
          ),

          SizedBox(height: 32),

          // Amount input field
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Icon(Icons.currency_rupee),
              ),

              SizedBox(width: 32),
              Column(
                children: [
                  Text("Total Amount  "),
                  Text(
                    "0.00",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 56),
                  ),
                ],
              ),
            ],
          ),
          Row(),
          Row(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 56,
        width: 300,

        decoration: BoxDecoration(
          color: Colors.purpleAccent,

          borderRadius: BorderRadius.circular(12),
        ),

        child: Row(children: [Text("Save Expense"), Icon(Icons.done)]),
      ),
    );
  }
}
