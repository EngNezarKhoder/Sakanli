// property_service_model.dart
class PropertyServiceModel {
  final int? id;
  final int? propertyId;
  final String type;
  final double price;
  final bool isActive;

  PropertyServiceModel({
    this.id,
    this.propertyId,
    required this.type,
    required this.price,
    this.isActive = true,
  });

  factory PropertyServiceModel.fromJson(Map<String, dynamic> json) {
    return PropertyServiceModel(
      id: json['id'],
      propertyId: json['property_id'],
      type: json['type'],
      price: (json['price'] as num).toDouble(),
      isActive: json['is_active'] == 1 || json['is_active'] == true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'price': price,
      'is_active': isActive ? 1 : 0,
    };
  }
}