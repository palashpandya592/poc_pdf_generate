import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:makepdfs/models/invoice.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as p;
import 'package:flutter/services.dart' show rootBundle;
import 'package:printing/printing.dart';

Future<Uint8List> makePdf(Invoice invoice) async {
  final pdf = p.Document();
  final imageLogo = p.MemoryImage(
      (await rootBundle.load('assets/technical_logo.png'))
          .buffer
          .asUint8List());
  final imageItem = p.MemoryImage(
      (await rootBundle.load("assets/img.png")).buffer.asUint8List());
  final netImage =
      await networkImage("https://source.unsplash.com/1600x900/?beach");
  pdf.addPage(p.MultiPage(
      pageFormat: PdfPageFormat.a4,
      build: (p.Context context) {
        return <p.Widget>[
          p.Column(children: [
            p.Row(
              mainAxisAlignment: p.MainAxisAlignment.spaceBetween,
              children: [
                p.Column(
                  children: [
                    p.Text("Attention to: ${invoice.customer}"),
                    p.Text(invoice.address),
                  ],
                  crossAxisAlignment: p.CrossAxisAlignment.start,
                ),
                p.SizedBox(
                  height: 150,
                  width: 150,
                  child: p.Image(imageLogo),
                )
              ],
            ),
            p.Container(height: 50),
            p.Table(
              border: p.TableBorder.all(color: PdfColors.black),
              children: [
                p.TableRow(
                  children: [
                    p.Padding(
                      child: p.Text(
                        'INVOICE FOR PAYMENT',
                        style: p.Theme.of(context).header4,
                        textAlign: p.TextAlign.center,
                      ),
                      padding: const p.EdgeInsets.all(20),
                    ),
                  ],
                ),
                ...invoice.items.map(
                  (e) => p.TableRow(
                    children: [
                      p.Expanded(
                        child: PaddedText(e.description),
                        flex: 2,
                      ),
                      p.Expanded(
                        child: PaddedText("\$${e.cost}"),
                        flex: 1,
                      ),
                      p.Expanded(
                          child: p.SizedBox(
                        child: p.Image(
                          imageItem,
                          height: 50,
                          width: 70,
                        ),
                      )),
                    ],
                  ),
                ),
                p.TableRow(
                  children: [
                    PaddedText('TAX', align: p.TextAlign.right),
                    PaddedText(
                        '\$${(invoice.totalCost() * 0.1).toStringAsFixed(2)}'),
                  ],
                ),
                p.TableRow(
                  children: [
                    PaddedText('TOTAL', align: p.TextAlign.right),
                    PaddedText(
                        '\$${(invoice.totalCost() * 1.1).toStringAsFixed(2)}')
                  ],
                )
              ],
            ),
            p.Padding(
              child: p.Text(
                "THANK YOU FOR YOUR CUSTOM!",
                style: p.Theme.of(context).header2,
              ),
              padding: p.EdgeInsets.all(20),
            ),
            p.Text(
                "Please forward the below slip to your accounts payable department."),
            p.Divider(
              height: 1,
              borderStyle: p.BorderStyle.dashed,
            ),
            p.Container(height: 50),

            // p.ListView.builder(
            //   itemCount: 20,
            //   itemBuilder: (context, index) {
            //     return p.Table(
            //       border: p.TableBorder.all(color: PdfColors.black),
            //       children: [
            //         p.TableRow(
            //           children: [
            //             PaddedText('Account Number'),
            //             PaddedText(
            //               '1234 1234',
            //             )
            //           ],
            //         ),
            //         p.TableRow(
            //           children: [
            //             PaddedText(
            //               'Account Name',
            //             ),
            //             PaddedText(
            //               'ADAM FAMILY TRUST',
            //             )
            //           ],
            //         ),
            //         p.TableRow(
            //           children: [
            //             PaddedText(
            //               'Total Amount to be Paid',
            //             ),
            //             PaddedText(
            //                 '\$${(invoice.totalCost() * 1.1).toStringAsFixed(2)}')
            //           ],
            //         )
            //       ],
            //     );
            //   },
            // ),

            p.Table(
              border: p.TableBorder.all(color: PdfColors.black),
              children: [
                p.TableRow(
                  children: [
                    PaddedText('Account Number'),
                    PaddedText(
                      '1234 1234',
                    )
                  ],
                ),
                p.TableRow(
                  children: [
                    PaddedText(
                      'Account Name',
                    ),
                    PaddedText(
                      'ADAM FAMILY TRUST',
                    )
                  ],
                ),
                p.TableRow(
                  children: [
                    PaddedText(
                      'Total Amount to be Paid',
                    ),
                    PaddedText(
                        '\$${(invoice.totalCost() * 1.1).toStringAsFixed(2)}')
                  ],
                ),
              ],
            ),
            // ListView.builder(
            //     itemBuilder: (context, index) {
            //       return p.Table(
            //           border: p.TableBorder.all(color: PdfColors.black),
            //           children: [
            //             p.TableRow(children: [
            //               PaddedText("Product"),
            //               PaddedText("Toygun"),
            //             ])
            //           ]);
            //     },
            //     itemCount: 40),
            p.Table(
              border: p.TableBorder.all(color: PdfColors.black),
              children: [
                p.TableRow(
                  children: [
                    PaddedText('Account Number'),
                    PaddedText(
                      '1234 1234',
                    )
                  ],
                ),
                p.TableRow(
                  children: [
                    PaddedText(
                      'Account Name',
                    ),
                    PaddedText(
                      'ADAM FAMILY TRUST',
                    )
                  ],
                ),
                p.TableRow(
                  children: [
                    PaddedText(
                      'Total Amount to be Paid',
                    ),
                    PaddedText(
                        '\$${(invoice.totalCost() * 1.1).toStringAsFixed(2)}')
                  ],
                ),
              ],
            ),
            p.Table(
              border: p.TableBorder.all(color: PdfColors.black),
              children: [
                p.TableRow(
                  children: [
                    PaddedText('Account Number'),
                    PaddedText(
                      '1234 1234',
                    )
                  ],
                ),
                p.TableRow(
                  children: [
                    PaddedText(
                      'Account Name',
                    ),
                    PaddedText(
                      'ADAM FAMILY TRUST',
                    )
                  ],
                ),
                p.TableRow(
                  children: [
                    PaddedText(
                      'Total Amount to be Paid',
                    ),
                    PaddedText(
                        '\$${(invoice.totalCost() * 1.1).toStringAsFixed(2)}')
                  ],
                ),
              ],
            ),
            p.Table(
              border: p.TableBorder.all(color: PdfColors.black),
              children: [
                p.TableRow(
                  children: [
                    PaddedText('Account Number'),
                    PaddedText(
                      '1234 1234',
                    )
                  ],
                ),
                p.TableRow(
                  children: [
                    PaddedText(
                      'Account Name',
                    ),
                    PaddedText(
                      'ADAM FAMILY TRUST',
                    )
                  ],
                ),
                p.TableRow(
                  children: [
                    PaddedText(
                      'Total Amount to be Paid',
                    ),
                    PaddedText(
                        '\$${(invoice.totalCost() * 1.1).toStringAsFixed(2)}')
                  ],
                ),
              ],
            ),
            p.Table(
              border: p.TableBorder.all(color: PdfColors.black),
              children: [
                p.TableRow(
                  children: [
                    PaddedText('Account Number'),
                    PaddedText(
                      '1234 1234',
                    )
                  ],
                ),
                p.TableRow(
                  children: [
                    PaddedText(
                      'Account Name',
                    ),
                    PaddedText(
                      'ADAM FAMILY TRUST',
                    )
                  ],
                ),
                p.TableRow(
                  children: [
                    PaddedText(
                      'Total Amount to be Paid',
                    ),
                    PaddedText(
                        '\$${(invoice.totalCost() * 1.1).toStringAsFixed(2)}')
                  ],
                ),
              ],
            ),
            p.Table(
              border: p.TableBorder.all(color: PdfColors.black),
              children: [
                p.TableRow(
                  children: [
                    PaddedText('Account Number'),
                    PaddedText(
                      '1234 1234',
                    )
                  ],
                ),
                p.TableRow(
                  children: [
                    PaddedText(
                      'Account Name',
                    ),
                    PaddedText(
                      'ADAM FAMILY TRUST',
                    )
                  ],
                ),
                p.TableRow(
                  children: [
                    PaddedText(
                      'Total Amount to be Paid',
                    ),
                    PaddedText(
                        '\$${(invoice.totalCost() * 1.1).toStringAsFixed(2)}')
                  ],
                ),
              ],
            ),
            p.Table(
              border: p.TableBorder.all(color: PdfColors.black),
              children: [
                p.TableRow(
                  children: [
                    PaddedText('Account Number'),
                    PaddedText(
                      '1234 1234',
                    )
                  ],
                ),
                p.TableRow(
                  children: [
                    PaddedText(
                      'Account Name',
                    ),
                    PaddedText(
                      'ADAM FAMILY TRUST',
                    )
                  ],
                ),
                p.TableRow(
                  children: [
                    PaddedText(
                      'Total Amount to be Paid',
                    ),
                    PaddedText(
                        '\$${(invoice.totalCost() * 1.1).toStringAsFixed(2)}')
                  ],
                ),
              ],
            ),
            p.Table(
              border: p.TableBorder.all(color: PdfColors.black),
              children: [
                p.TableRow(
                  children: [
                    p.Padding(
                      child: p.Text(
                        'INVOICE FOR PAYMENT',
                        style: p.Theme.of(context).header4,
                        textAlign: p.TextAlign.center,
                      ),
                      padding: const p.EdgeInsets.all(20),
                    ),
                  ],
                ),
                ...invoice.items.map(
                  (e) => p.TableRow(
                    children: [
                      p.Expanded(
                        child: PaddedText(e.description),
                        flex: 2,
                      ),
                      p.Expanded(
                        child: PaddedText("\$${e.cost}"),
                        flex: 1,
                      ),
                      p.Expanded(
                          child: p.SizedBox(
                        child: p.Image(
                          imageItem,
                          height: 50,
                          width: 70,
                        ),
                      )),
                    ],
                  ),
                ),
                p.TableRow(
                  children: [
                    PaddedText('TAX', align: p.TextAlign.right),
                    PaddedText(
                        '\$${(invoice.totalCost() * 0.1).toStringAsFixed(2)}'),
                  ],
                ),
                p.TableRow(
                  children: [
                    PaddedText('TOTAL', align: p.TextAlign.right),
                    PaddedText(
                        '\$${(invoice.totalCost() * 1.1).toStringAsFixed(2)}')
                  ],
                )
              ],
            ),
            p.Table(
              border: p.TableBorder.all(color: PdfColors.black),
              children: [
                p.TableRow(
                  children: [
                    PaddedText('Account Number'),
                    PaddedText(
                      '1234 1234',
                    )
                  ],
                ),
                p.TableRow(
                  children: [
                    PaddedText(
                      'Account Name',
                    ),
                    PaddedText(
                      'ADAM FAMILY TRUST',
                    )
                  ],
                ),
                p.TableRow(
                  children: [
                    PaddedText(
                      'Total Amount to be Paid',
                    ),
                    PaddedText(
                        '\$${(invoice.totalCost() * 1.1).toStringAsFixed(2)}')
                  ],
                ),
              ],
            ),
            p.Table(
              border: p.TableBorder.all(color: PdfColors.black),
              children: [
                p.TableRow(
                  children: [
                    PaddedText('Account Number'),
                    PaddedText(
                      '1234 1234',
                    )
                  ],
                ),
                p.TableRow(
                  children: [
                    PaddedText(
                      'Account Name',
                    ),
                    PaddedText(
                      'ADAM FAMILY TRUST',
                    )
                  ],
                ),
                p.TableRow(
                  children: [
                    PaddedText(
                      'Total Amount to be Paid',
                    ),
                    PaddedText(
                        '\$${(invoice.totalCost() * 1.1).toStringAsFixed(2)}')
                  ],
                ),
              ],
            ),
            p.Table(
              border: p.TableBorder.all(color: PdfColors.black),
              children: [
                p.TableRow(
                  children: [
                    PaddedText('Account Number'),
                    PaddedText(
                      '1234 1234',
                    )
                  ],
                ),
                p.TableRow(
                  children: [
                    PaddedText(
                      'Account Name',
                    ),
                    PaddedText(
                      'ADAM FAMILY TRUST',
                    )
                  ],
                ),
                p.TableRow(
                  children: [
                    PaddedText(
                      'Total Amount to be Paid',
                    ),
                    PaddedText(
                        '\$${(invoice.totalCost() * 1.1).toStringAsFixed(2)}')
                  ],
                ),
              ],
            ),
            p.Table(
              border: p.TableBorder.all(color: PdfColors.black),
              children: [
                p.TableRow(
                  children: [
                    PaddedText('Account Number'),
                    PaddedText(
                      '1234 1234',
                    )
                  ],
                ),
                p.TableRow(
                  children: [
                    PaddedText(
                      'Account Name',
                    ),
                    PaddedText(
                      'ADAM FAMILY TRUST',
                    )
                  ],
                ),
                p.TableRow(
                  children: [
                    PaddedText(
                      'Total Amount to be Paid',
                    ),
                    PaddedText(
                        '\$${(invoice.totalCost() * 1.1).toStringAsFixed(2)}')
                  ],
                ),
              ],
            ),
            p.Table(
              border: p.TableBorder.all(color: PdfColors.black),
              children: [
                p.TableRow(
                  decoration: p.BoxDecoration(color: PdfColors.green),
                  children: [
                    PaddedText('Account Number'),
                    PaddedText(
                      '1234 1234',
                    )
                  ],
                ),
                p.TableRow(
                  children: [
                    PaddedText(
                      'Account Name',
                    ),
                    PaddedText(
                      'ADAM FAMILY TRUST',
                    )
                  ],
                ),
                p.TableRow(
                  children: [
                    PaddedText(
                      'Total Amount to be Paid',
                    ),
                    PaddedText(
                        '\$${(invoice.totalCost() * 1.1).toStringAsFixed(2)}')
                  ],
                ),
              ],
            ),

            p.Table(
              border: p.TableBorder.all(color: PdfColors.black),
              children: [
                p.TableRow(
                  children: [
                    PaddedText('Account Number'),
                    PaddedText(
                      '1234 1234',
                    )
                  ],
                ),
                p.TableRow(
                  children: [
                    PaddedText(
                      'Account Name',
                    ),
                    PaddedText(
                      'ADAM FAMILY TRUST',
                    )
                  ],
                ),
                p.TableRow(
                  children: [
                    PaddedText(
                      'Total Amount to be Paid',
                    ),
                    PaddedText(
                        '\$${(invoice.totalCost() * 1.1).toStringAsFixed(2)}')
                  ],
                ),
              ],
            ),
            p.Table(
              border: p.TableBorder.all(color: PdfColors.black),
              children: [
                p.TableRow(
                  children: [
                    PaddedText('Account Number'),
                    PaddedText(
                      '1234 1234',
                    )
                  ],
                ),
                p.TableRow(
                  children: [
                    PaddedText(
                      'Account Name',
                    ),
                    PaddedText(
                      'ADAM FAMILY TRUST',
                    )
                  ],
                ),
                p.TableRow(
                  children: [
                    PaddedText(
                      'Total Amount to be Paid',
                    ),
                    PaddedText(
                        '\$${(invoice.totalCost() * 1.1).toStringAsFixed(2)}')
                  ],
                ),
              ],
            ),
            p.Table(
              border: p.TableBorder.all(color: PdfColors.black),
              children: [
                p.TableRow(
                  children: [
                    PaddedText('Account Number'),
                    PaddedText(
                      '1234 1234',
                    )
                  ],
                ),
                p.TableRow(
                  children: [
                    PaddedText(
                      'Account Name',
                    ),
                    PaddedText(
                      'ADAM FAMILY TRUST',
                    )
                  ],
                ),
                p.TableRow(
                  children: [
                    PaddedText(
                      'Total Amount to be Paid',
                    ),
                    PaddedText(
                        '\$${(invoice.totalCost() * 1.1).toStringAsFixed(2)}')
                  ],
                ),
              ],
            ),
            p.Table(
              border: p.TableBorder.all(color: PdfColors.black),
              children: [
                p.TableRow(
                  children: [
                    PaddedText('Account Number'),
                    PaddedText(
                      '1234 1234',
                    )
                  ],
                ),
                p.TableRow(
                  children: [
                    PaddedText(
                      'Account Name',
                    ),
                    PaddedText(
                      'ADAM FAMILY TRUST',
                    )
                  ],
                ),
                p.TableRow(
                  children: [
                    PaddedText(
                      'Total Amount to be Paid',
                    ),
                    PaddedText(
                        '\$${(invoice.totalCost() * 1.1).toStringAsFixed(2)}')
                  ],
                ),
              ],
            ),
            p.Table(
              border: p.TableBorder.all(color: PdfColors.black),
              children: [
                p.TableRow(
                  children: [
                    PaddedText('Account Number'),
                    PaddedText(
                      '1234 1234',
                    )
                  ],
                ),
                p.TableRow(
                  children: [
                    PaddedText(
                      'Account Name',
                    ),
                    PaddedText(
                      'ADAM FAMILY TRUST',
                    )
                  ],
                ),
                p.TableRow(
                  children: [
                    PaddedText(
                      'Total Amount to be Paid',
                    ),
                    PaddedText(
                        '\$${(invoice.totalCost() * 1.1).toStringAsFixed(2)}')
                  ],
                ),
              ],
            ),
            p.Table(
              border: p.TableBorder.all(color: PdfColors.black),
              children: [
                p.TableRow(
                  children: [
                    PaddedText('Account Number'),
                    PaddedText(
                      '1234 1234',
                    )
                  ],
                ),
                p.TableRow(
                  children: [
                    PaddedText(
                      'Account Name',
                    ),
                    PaddedText(
                      'ADAM FAMILY TRUST',
                    )
                  ],
                ),
                p.TableRow(
                  children: [
                    PaddedText(
                      'Total Amount to be Paid',
                    ),
                    PaddedText(
                        '\$${(invoice.totalCost() * 1.1).toStringAsFixed(2)}')
                  ],
                ),
              ],
            ),
            p.Table(
              border: p.TableBorder.all(color: PdfColors.black),
              children: [
                p.TableRow(
                  children: [
                    PaddedText('Account Number'),
                    PaddedText(
                      '1234 1234',
                    )
                  ],
                ),
                p.TableRow(
                  children: [
                    PaddedText(
                      'Account Name',
                    ),
                    PaddedText(
                      'ADAM FAMILY TRUST',
                    )
                  ],
                ),
                p.TableRow(
                  children: [
                    PaddedText(
                      'Total Amount to be Paid',
                    ),
                    PaddedText(
                        '\$${(invoice.totalCost() * 1.1).toStringAsFixed(2)}')
                  ],
                ),
              ],
            ),

            p.SizedBox(height: 10),
            p.Column(children: [
              p.SizedBox(
                child: p.Image(
                  imageItem,
                  height: 300,
                  width: 1500,
                ),
              ),
            ]),

            p.Padding(
              padding: const p.EdgeInsets.all(30),
              child: p.Text(
                'Please ensure all cheques are payable to the ADAM FAMILY TRUST.',
                style: p.Theme.of(context).header3.copyWith(
                      fontStyle: p.FontStyle.italic,
                    ),
                textAlign: p.TextAlign.center,
              ),
            ),
          ])
        ];
      }));

  return pdf.save();
}

p.Widget PaddedText(
  final String text, {
  final p.TextAlign align = p.TextAlign.left,
}) =>
    p.Padding(
      padding: const p.EdgeInsets.all(10),
      child: p.Text(
        text,
        textAlign: align,
      ),
    );
