import 'package:equatable/equatable.dart';

class Tasks extends Equatable {
  final String title;
  final String description;
  final String id;
  bool? isDone;
  bool? isDelete;
  Tasks({
    required this.title,
    required this.description,
    required this.id,
    this.isDone,
    this.isDelete,
  }) {
    isDone = isDone ?? false;
    isDelete = isDelete ?? false;
  }

  Tasks copyWith({
    String? title,
    String? id,
    bool? isDone,
    bool? isDelete,
  }) {
    return Tasks(
      title: title ?? this.title,
      description: description ?? this.description,
      id: id ?? this.id,
      isDone: isDone ?? this.isDone,
      isDelete: isDelete ?? this.isDelete,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'id': id,
      'isDone': isDone,
      'isDelete': isDelete,
    };
  }

  factory Tasks.fromMap(Map<String, dynamic> map) {
    return Tasks(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      id: map['id'] ?? '',
      isDone: map['isDone'],
      isDelete: map['isDelete'],
    );
  }

  @override
  List<Object?> get props => [
        title,
        description,
        id,
        isDone,
        isDelete,
      ];
}
