import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
/*
  @author     : karthick.d  13/10/2025
  @desc       : base class for setting datasource for various tasks
                example NavaigationTask , SaveAndGoNavigationTask etc
                NavigationTask extends BPTaskParam
                

*/
class BPTaskDataprovider {
  final String url;
  final Map<String, dynamic>? data;
  BPTaskDataprovider({required this.url, this.data});

  @override
  String toString() => 'BPTaskDataprovider(url: $url, data: $data)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'url': url, 'data': data};
  }

  factory BPTaskDataprovider.fromMap(Map<String, dynamic> map) {
    return BPTaskDataprovider(
      url: map['url'] as String,
      data:
          map['data'] != null
              ? Map<String, dynamic>.from((map['data'] as Map<String, dynamic>))
              : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BPTaskDataprovider.fromJson(String source) =>
      BPTaskDataprovider.fromMap(json.decode(source) as Map<String, dynamic>);
}
