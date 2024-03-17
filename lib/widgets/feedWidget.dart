import 'dart:math';

import 'package:Finspire/services/memeService.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';

class feedWidget extends StatefulWidget {
  const feedWidget({
    super.key,
  });

  @override
  State<feedWidget> createState() => _feedWidgetState();
}

List<String> imageUrls = [];
List<String> stockMarketQuotes = [
  "My brain trying to keep up with all the charts and indicators.",
  "Refreshed the screen so many times, I practically polished it.",
  "Day trading: The perfect way to turn your morning coffee into afternoon anxiety.",
  "Me checking my portfolio after every news notification.",
  "This stock is falling faster than the rupee during Diwali sales.",
  "My investment strategy: Buy high, sell panic.",
  "Trying to stay calm while watching my portfolio do the Macarena.",
  "When your mom calls and asks why your bank account looks like a phone number with missing digits.",
  "Me trying to explain to my friends why I'm putting my Diwali bonus into the market.",
  "My portfolio when every analyst suddenly turns bullish.",
  "Auto-rickshaw drivers asking for stock tips. Bull market confirmed?",
  "My broker after every trade: 'There's a small handling fee for your financial success.'",
  "Trying to choose a broker: Low fees? Good platform? Can't have both, apparently.",
  "Me explaining to my spouse why the stock price went up but my portfolio value stayed the same.",
  "Skipping that weekend trip to Goa to invest in my future. #Adulting",
  "Family member giving unsolicited stock advice: 'This one is guaranteed to go up, beta.'",
];
List<String> userName = ["Tanmay", "Kartik", "Harsh", "Vedant"];
late List<bool> isLiked;

class _feedWidgetState extends State<feedWidget> {
  Future<void> getData() async {
    try {
      FirebaseStorage firebaseStorage = FirebaseStorage.instance;
      Reference storageRef = firebaseStorage.ref().child("memes");

      ListResult resultImages = await storageRef.listAll();

      for (Reference reference in resultImages.items) {
        String downloadUrl = await reference.getDownloadURL();

        setState(() {
          imageUrls.add(downloadUrl);
          isLiked = List.filled(imageUrls.length, false);
        });
      }
    } catch (error) {
      print("Error fetching data: $error");
    }
  }

  void uploadMemeToFirestore() async {
    if (imageUrls.isEmpty ||
        stockMarketQuotes.isEmpty ||
        userName.isEmpty ||
        imageUrls.length != stockMarketQuotes.length ||
        imageUrls.length != userName.length) {
      print('Invalid data');
      return;
    }

    for (int i = 0; i < imageUrls.length; i++) {
      Random random = Random();
      int indexQuote = random.nextInt(stockMarketQuotes.length);
      int indexUser = random.nextInt(userName.length);

      String caption = stockMarketQuotes[indexQuote];
      String uploadedBy = userName[indexUser];
      String url = imageUrls[i];

      if (url.isNotEmpty && caption.isNotEmpty && uploadedBy.isNotEmpty) {
        MemeService memeService =
            MemeService(url: url, desc: caption, uploadedBy: uploadedBy);
        memeService.uploadMemes();
      } else {
        print('Empty fields');
      }
    }
  }

  Future<void> getAndUploadMemes() async {
    await getData();
    uploadMemeToFirestore();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    uploadMemeToFirestore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121139),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/HomeScreenBackground.png",
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: imageUrls.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    color: Colors.white,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Card(
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8.0)),
                            child: Image(
                              image: NetworkImage(imageUrls[index]),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    isLiked[index] = !isLiked[index];
                                  });
                                },
                                icon: Icon(
                                  isLiked[index]
                                      ? Icons.thumb_up
                                      : Icons.thumb_up_outlined,
                                ),
                              ),
                              Text(
                                "Pic $index",
                                style: const TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: imageUrls.length,
              ),
      ),
    );
  }
}
