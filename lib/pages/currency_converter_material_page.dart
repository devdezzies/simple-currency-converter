import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialPage();
}

class _CurrencyConverterMaterialPage extends State<CurrencyConverterMaterialPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  @override 
  void initState() {
    super.initState();
    debugPrint("INIT STATE");
  }

  @override
  void dispose() { // gets executed when the object is removed from the widget tree
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("rebuilt");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
            child: Text(
          "Convertio",
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(color: Colors.white),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 90,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(210, 241, 241, 241),
                        borderRadius: BorderRadius.circular(25)),
                    child: Center(
                      child: TextField(
                        controller: textEditingController,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        decoration: const InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(28)),
                              borderSide: BorderSide.none),
                          prefix: Text("Rp "),
                          hintText: "Enter the amount in IDR",
                        ),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                      height: 90,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              result =
                                  double.parse(textEditingController.text) *
                                      0.000061;
                              if (kDebugMode) {
                                print(textEditingController);
                              }
                              
                            });
                          },
                          style: const ButtonStyle(
                              overlayColor: WidgetStatePropertyAll(
                                  Color.fromARGB(255, 220, 236, 90)),
                              elevation: WidgetStatePropertyAll(8),
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25))))),
                          child:
                              const Icon(Icons.calculate_outlined, size: 40))),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            height: 90,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: const Color.fromARGB(210, 241, 241, 241)),
            child: Center(
                child: Text(
              overflow: TextOverflow.ellipsis,
              'USD ${result !=0 ? result.toStringAsFixed(3) : result.toStringAsFixed(0)}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            )),
          )
        ],
      ),
    );
  }
}
