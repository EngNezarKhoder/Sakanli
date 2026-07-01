// property_model.dart
import 'property_service_model.dart';
import 'photo_model.dart';

class PropertyModel {
  final int? id;
  final int? userId;
  final String propertyType;
  final String userRole;
  final String? notes;
  final int? area;
  final String? facade;
  final String? ownershipType;
  final int? bedrooms;
  final int? bathrooms;
  final int? toilets;
  final int? propertyAge;
  final double? lat;
  final double? lng;
  final String? city;
  final String? areaName;
  final String? street;
  final String? building;
  final String? floor;
  final String? propertyNumber;
  final String? phone;
  final String? whatsapp;
  final List<PropertyServiceModel> services;
  final List<PhotoModel> photos;

  PropertyModel({
    this.id,
    this.userId,
    required this.propertyType,
    required this.userRole,
    this.notes,
    this.area,
    this.facade,
    this.ownershipType,
    this.bedrooms,
    this.bathrooms,
    this.toilets,
    this.propertyAge,
    this.lat,
    this.lng,
    this.city,
    this.areaName,
    this.street,
    this.building,
    this.floor,
    this.propertyNumber,
    this.phone,
    this.whatsapp,
    this.services = const [],
    this.photos = const [],
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      id: json['id'],
      userId: json['user_id'],
      propertyType: json['property_type'],
      userRole: json['user_role'],
      notes: json['notes'],
      area: json['area'],
      facade: json['facade'],
      ownershipType: json['ownership_type'],
      bedrooms: json['bedrooms'],
      bathrooms: json['bathrooms'],
      toilets: json['toilets'],
      propertyAge: json['property_age'],
      lat: (json['lat'] != null) ? (json['lat'] as num).toDouble() : null,
      lng: (json['lng'] != null) ? (json['lng'] as num).toDouble() : null,
      city: json['city'],
      areaName: json['area_name'],
      street: json['street'],
      building: json['building'],
      floor: json['floor'],
      propertyNumber: json['property_number'],
      phone: json['phone'],
      whatsapp: json['whatsapp'],
      services: json['services'] != null
          ? (json['services'] as List)
              .map((e) => PropertyServiceModel.fromJson(e))
              .toList()
          : [],
      photos: json['photos'] != null
          ? (json['photos'] as List).map((e) => PhotoModel.fromJson(e)).toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'property_type': propertyType,
      'user_role': userRole,
      'notes': notes,
      'area': area,
      'facade': facade,
      'ownership_type': ownershipType,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'toilets': toilets,
      'property_age': propertyAge,
      'lat': lat,
      'lng': lng,
      'city': city,
      'area_name': areaName,
      'street': street,
      'building': building,
      'floor': floor,
      'property_number': propertyNumber,
      'phone': phone,
      'whatsapp': whatsapp,
      'services': services.map((e) => e.toJson()).toList(),
      'photos': photos.map((e) => e.toJson()).toList(),
    };
  }
}