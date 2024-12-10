import '../../domain/entity/review_entity.dart';

class ReviewModel {
  final String? name;
  final String? img;
  final String? date;
  final double? rate;
  final String? comment;

  ReviewModel({
    this.name,
    this.img,
    this.date,
    this.rate,
    this.comment,
  });

  factory ReviewModel.fromMap(Map<String, dynamic> map) {
    return ReviewModel(
      name: map['name'],
      img: map['img'],
      date: map['date'],
      rate: map['rate'],
      comment: map['comment'],
    );
  }

  factory ReviewModel.fromEntity(ReviewEntity entity) {
    return ReviewModel(
      name: entity.name,
      img: entity.img,
      date: entity.date,
      rate: entity.rate,
      comment: entity.comment,
    );
  }

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'],
      img: json['img'],
      date: json['date'],
      rate: json['rate'],
      comment: json['comment'],
    );
  }
  toMap() => {
        'name': name,
        'img': img,
        'date': date,
        'rate': rate,
        'comment': comment,
      };

  ReviewEntity toEntity() {
    return ReviewEntity(
      name: name ?? '',
      img: img ?? '',
      date: date ?? '',
      rate: rate ?? 0,
      comment: comment ?? '',
    );
  }
}
