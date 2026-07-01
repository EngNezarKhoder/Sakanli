// photo_model.dart
class PhotoModel {
  final int? id;
  final int? propertyId;
  final String path;
  final bool isMain;
  final int? sortOrder;

  PhotoModel({
    this.id,
    this.propertyId,
    required this.path,
    this.isMain = false,
    this.sortOrder,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'],
      propertyId: json['property_id'],
      path: json['path'],
      isMain: json['is_main'] == 1 || json['is_main'] == true,
      sortOrder: json['sort_order'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'path': path,
      'is_main': isMain ? 1 : 0,
      'sort_order': sortOrder,
    };
  }
}