import 'package:Finspire/data/nifty_data_model.dart';
import 'package:Finspire/network/api_service.dart';
import 'package:flutter/material.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({
    super.key,
  });

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  List<Nifty>? marketInfo = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() async {
    marketInfo = await ApiService().fetchData();

    if (marketInfo != null) {
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121139),
      body: Visibility(
        visible: isLoading,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: marketInfo?.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      marketInfo![index].symbol ?? "NULL",
                      style: const TextStyle(
                        color: Color(0xff121139),
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: Text(
                      "Open: ${marketInfo![index].open.toString()}",
                      style: const TextStyle(
                        color: Color(0xff121139),
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: Text(
                      "Day High: ${marketInfo![index].dayHigh.toString()}",
                      style: const TextStyle(
                        color: Color(0xff121139),
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: Text(
                      "Day Low: ${marketInfo![index].dayLow.toString()}",
                      style: const TextStyle(
                        color: Color(0xff121139),
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: Text(
                      "Closing price: ${marketInfo![index].lastPrice.toString()}",
                      style: const TextStyle(
                        color: Color(0xff121139),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
