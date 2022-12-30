import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:makepdfs/models/invoice.dart';
import 'package:makepdfs/pages/detail.dart';

class InvoicePage extends StatelessWidget {
  final invoices = <Invoice>[
    Invoice(
      customer: 'Flutter Devlopers',
      address: '123 Fake St\r\nBermuda Triangle',
      items: [
        LineItem(
          'Technical Engagement',
          120,
        ),
        LineItem('Deployment Assistance', 200),
        LineItem('Develop Software Solution', 3020.45),
        LineItem('Produce Documentation', 840.50),
      ],
      name: 'Brijesh Parmar🎍',
      img: "https://source.unsplash.com/1600x900/?beach",
    ),
    Invoice(
      customer: 'Android Devlopers',
      address: '82 Unsure St\r\nBaggle Palace',
      items: [
        LineItem('Professional Advice', 100),
        LineItem('Lunch Bill', 43.55),
        LineItem('Remote Assistance', 50),
      ],
      name: 'Gopal Got👌',
      img: "https://source.unsplash.com/1600x900/?beach",
    ),
    Invoice(
      customer: 'Php Devlopers',
      address: '55 Dancing Parade\r\nDance Place',
      items: [
        LineItem('Program the robots', 400.50),
        LineItem('Find tasteful dance moves for the robots', 80.55),
        LineItem('General quality assurance', 80),
      ],
      name: 'Yash patel',
      img: "https://picsum.photos/seed/picsum/200/300",
    ),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoices'),
      ),
      body: ListView(
        children: [
          ...invoices.map(
            (e) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ListTile(
                  title: Text(e.name),
                  subtitle: Text(e.customer),
                  trailing: Text('\$${e.totalCost().toStringAsFixed(2)}'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (builder) => DetailPage(invoice: e),
                      ),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
/*Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: 100,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              // crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              maxCrossAxisExtent: 200),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Image.network(
                        "https://source.unsplash.com/1600x900/?beach"),
                  )),
            );
          },
        ),
      ),*/
