import 'package:equatable/equatable.dart';

class Tasks extends Equatable {
  final String title;
  final String description;
  final String id;
  final String date;
  bool? isDone;
  bool? isDelete;
  bool? isFavorite;
  Tasks({
    required this.title,
    required this.description,
    required this.id,
    required this.date,
    this.isDone,
    this.isDelete,
    this.isFavorite,
  }) {
    isDone = isDone ?? false;
    isDelete = isDelete ?? false;
    isFavorite = isFavorite ?? false;
  }

  Tasks copyWith({
    String? title,
    String? id,
    String? date,
    bool? isDone,
    bool? isDelete,
    bool? isFavorite,
  }) {
    return Tasks(
      title: title ?? this.title,
      description: description ?? this.description,
      id: id ?? this.id,
      date: date ?? this.date,
      isDone: isDone ?? this.isDone,
      isDelete: isDelete ?? this.isDelete,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'id': id,
      'date': date,
      'isDone': isDone,
      'isDelete': isDelete,
      'isFavorite': isFavorite,
    };
  }

  factory Tasks.fromMap(Map<String, dynamic> map) {
    return Tasks(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      id: map['id'] ?? '',
      date: map['date'] ?? '',
      isDone: map['isDone'],
      isDelete: map['isDelete'],
      isFavorite: map['isFavorite'],
    );
  }

  @override
  List<Object?> get props => [
        title,
        description,
        id,
        date,
        isDone,
        isDelete,
        isFavorite,
      ];
}
