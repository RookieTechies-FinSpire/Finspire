import 'package:Finspire/model/memesModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MemeService {
  String? url, desc, uploadedBy;

  MemeService(
      {required this.url, required this.desc, required this.uploadedBy});

  void uploadMemes() async {
    try {
      CollectionReference _memesRef =
          FirebaseFirestore.instance.collection("memes");

      MemesModel memesModel =
          MemesModel(url: url, desc: desc, uploadedBy: uploadedBy);

      await _memesRef.add(memesModel.toMap());

      print("Meme uploaded");
    } catch (e) {
      print("Error uploading Meme: $e");
    }
  }
}
