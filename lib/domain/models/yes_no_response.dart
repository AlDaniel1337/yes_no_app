import 'dart:convert';

class YesNoRepsonse {
    final String? answer;
    final bool? forced;
    final String? image;

    YesNoRepsonse({
        this.answer,
        this.forced,
        this.image,
    });

    factory YesNoRepsonse.fromJson(String str) => YesNoRepsonse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory YesNoRepsonse.fromMap(Map<String, dynamic> json) => YesNoRepsonse(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
    );

    Map<String, dynamic> toMap() => {
        "answer": answer,
        "forced": forced,
        "image": image,
    };
}
