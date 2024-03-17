class MemesModel {
  String? url;
  String? desc;
  String? uploadedBy;

  MemesModel({required this.url, required this.desc, required this.uploadedBy});

  MemesModel.fromMap(Map<String, dynamic> map) {
    url = map['url'];
    desc = map['desc'];
    uploadedBy = map['uploadedBy'];
  }

  Map<String, dynamic> toMap() {
    return {
      "url": url,
      "desc": desc,
      "uploadedBy": uploadedBy,
    };
  }
}
