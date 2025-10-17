import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class BPwidgetTask {
  final String id;
  final String name;
  final String? status;
  BPwidgetTask({required this.id, required this.name, this.status});

  BPwidgetTask copyWith({String? id, String? name, String? status}) {
    return BPwidgetTask(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'name': name, 'status': status};
  }

  factory BPwidgetTask.fromMap(Map<String, dynamic> map) {
    return BPwidgetTask(
      id: map['id'] as String,
      name: map['name'] as String,
      status: map['status'] != null ? map['status'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BPwidgetTask.fromJson(String source) =>
      BPwidgetTask.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'BPwidgetTask(id: $id, name: $name, status: $status)';

  @override
  bool operator ==(covariant BPwidgetTask other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.status == status;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ status.hashCode;
}
