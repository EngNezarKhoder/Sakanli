import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:sakanle/core/constant/app_url.dart';
import 'package:sakanle/data/model/property_service_model.dart';

class ApiService {
  // static const String baseUrl = "http://192.171.100.7:8000/api";

  // ================= LOGIN =================
  static Future<Map<String, dynamic>> login(
    String email,
    String password,
  ) async {
    final response = await http.post(
      Uri.parse("${AppUrl.baseUrl}/login"),
      headers: {"Accept": "application/json"},
      body: {"email": email, "password": password},
    );

    return jsonDecode(response.body);
  }

  // ================= REGISTER =================
  static Future register(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse("${AppUrl.baseUrl}/signup"),
      headers: {"Accept": "application/json"},
      body: data,
    );

    print("STATUS: ${response.statusCode}");
    print("BODY: ${response.body}");

    return jsonDecode(response.body);
  }

  // ================= LOGOUT =================
  static Future<Map<String, dynamic>> logout(String token) async {
    final response = await http.delete(
      Uri.parse("${AppUrl.baseUrl}/logout"),
      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
    );

    return jsonDecode(response.body);
  }

  static Future<Map<String, dynamic>> verifyCode(
    String email,
    String verificationCode,
  ) async {
    final response = await http.post(
      Uri.parse("${AppUrl.baseUrl}/verify"),
      headers: {"Accept": "application/json"},
      body: {"email": email, "verification_code": verificationCode},
    );

    return jsonDecode(response.body);
  }

  static Future<Map<String, dynamic>> resendCode(String email) async {
    final response = await http.post(
      Uri.parse("${AppUrl.baseUrl}/resendCode"),
      headers: {"Accept": "application/json"},
      body: {"email": email},
    );

    return jsonDecode(response.body);
  }

  static Future<Map<String, dynamic>> resetPassword(
    String email,
    String password,
    String passwordConfirmation,
  ) async {
    final response = await http.put(
      Uri.parse("${AppUrl.baseUrl}/resetPassword"),
      headers: {"Accept": "application/json"},
      body: {
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation,
      },
    );

    return jsonDecode(response.body);
  }

  static Future<List<Map<String, dynamic>>> myProperties(String token) async {
    final response = await http.get(
      Uri.parse("${AppUrl.baseUrl}/myProperties"),
      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
    );

    final data = jsonDecode(response.body);

    if (data is List) {
      return List<Map<String, dynamic>>.from(data);
    }

    throw Exception(data['message'] ?? 'Unknown error');
  }

  static Future<Map<String, dynamic>?> createProperty({
    required String token,

    // REQUIRED FIELDS (Laravel)
    required String propertyType,
    required String userRole,
    required double area,
    required String facade,
    required String ownershipType,
    required int propertyAge,
    required String city,
    required String areaName,
    required String street,
    required String building,
    required String floor,
    required String propertyNumber,
    required double lat,
    required double lng,
    required String phone,
    required String whatsapp,

    // OPTIONAL
    String? notes,
    String? status,

    // COMPLEX
    required List<PropertyServiceModel> services,
    required List<File> images,
  }) async {
    try {
      final uri = Uri.parse("${AppUrl.baseUrl}/property");
      final request = http.MultipartRequest('POST', uri);

      // HEADERS
      request.headers['Accept'] = 'application/json';
      request.headers['Authorization'] = 'Bearer $token';

      // ================= BASIC FIELDS =================
      request.fields['property_type'] = propertyType;
      request.fields['user_role'] = userRole;

      request.fields['area'] = area.toString();
      request.fields['facade'] = facade;
      request.fields['ownership_type'] = ownershipType;
      request.fields['property_age'] = propertyAge.toString();

      request.fields['city'] = city;
      request.fields['area_name'] = areaName;
      request.fields['street'] = street;
      request.fields['building'] = building;
      request.fields['floor'] = floor;
      request.fields['property_number'] = propertyNumber;

      request.fields['lat'] = lat.toString();
      request.fields['lng'] = lng.toString();

      request.fields['phone'] = phone;
      request.fields['whatsapp'] = whatsapp;

      if (notes != null) request.fields['notes'] = notes;
      if (status != null) request.fields['status'] = status;

      // ================= SERVICES =================
      for (int i = 0; i < services.length; i++) {
        request.fields['services[$i][type]'] = services[i].type;
        request.fields['services[$i][price]'] = services[i].price.toString();
      }

      // ================= IMAGES =================
      for (int i = 0; i < images.length; i++) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'photos[$i]',
            images[i].path,
            filename: images[i].path.split('/').last,
          ),
        );
      }

      // ================= SEND =================
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 201) {
        return {
          "statusCode": response.statusCode,
          "body": jsonDecode(response.body),
        };
      } else {
        print("ERROR ${response.statusCode}");
        print(response.body);
        return null;
      }
    } catch (e) {
      print("EXCEPTION: $e");
      return null;
    }
  }

  // ================= DELETE PROPERTY =================
  static Future<Map<String, dynamic>?> deleteProperty({
    required String token,
    required String propertyId,
  }) async {
    try {
      final uri = Uri.parse("${AppUrl.baseUrl}/property/$propertyId");
      final response = await http.delete(
        uri,
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        // بعض الـ APIs يرجعون 204 بدون body
        if (response.body.isEmpty) {
          return {
            "statusCode": response.statusCode,
            "message": "تم حذف العقار بنجاح",
          };
        }
        return {
          "statusCode": response.statusCode,
          "body": jsonDecode(response.body),
        };
      } else {
        print("ERROR ${response.statusCode}");
        print(response.body);
        return {
          "statusCode": response.statusCode,
          "body": jsonDecode(response.body),
        };
      }
    } catch (e) {
      print("EXCEPTION: $e");
      return null;
    }
  }

  static Future<Map<String, dynamic>?> deletePropertyPhoto({
    required String token,
    required int photoId,
  }) async {
    try {
      final response = await http.delete(
        Uri.parse("${AppUrl.baseUrl}/propertyPhoto/$photoId"),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      return {"statusCode": response.statusCode};
    } catch (e) {
      print("DELETE PHOTO ERROR: $e");
      return null;
    }
  }

  static Future<Map<String, dynamic>?> updateProperty({
    required String token,
    required String propertyId,

    // REQUIRED FIELDS
    required String propertyType,
    required String userRole,
    required double area,
    required String facade,
    required String ownershipType,
    required int propertyAge,
    required String city,
    required String areaName,
    required String street,
    required String building,
    required String floor,
    required String propertyNumber,
    required double lat,
    required double lng,
    required String phone,
    required String whatsapp,

    // OPTIONAL
    String? notes,

    // COMPLEX
    required List<PropertyServiceModel> services,
    required List<File> images,

    // deleted images ids
    List<int>? deletedImages,
  }) async {
    try {
      final uri = Uri.parse("${AppUrl.baseUrl}/property/$propertyId");
      final request = http.MultipartRequest('POST', uri);

      // Laravel PUT workaround (multipart doesn't support PUT well)
      request.fields['_method'] = 'PUT';

      // HEADERS
      request.headers['Accept'] = 'application/json';
      request.headers['Authorization'] = 'Bearer $token';

      // ================= BASIC FIELDS =================
      request.fields['property_type'] = propertyType;
      request.fields['user_role'] = userRole;

      request.fields['area'] = area.toString();
      request.fields['facade'] = facade;
      request.fields['ownership_type'] = ownershipType;
      request.fields['property_age'] = propertyAge.toString();

      request.fields['city'] = city;
      request.fields['area_name'] = areaName;
      request.fields['street'] = street;
      request.fields['building'] = building;
      request.fields['floor'] = floor;
      request.fields['property_number'] = propertyNumber;

      request.fields['lat'] = lat.toString();
      request.fields['lng'] = lng.toString();

      request.fields['phone'] = phone;
      request.fields['whatsapp'] = whatsapp;

      if (notes != null) {
        request.fields['notes'] = notes;
      }

      // ================= SERVICES =================
      for (int i = 0; i < services.length; i++) {
        request.fields['services[$i][type]'] = services[i].type;
        request.fields['services[$i][price]'] = services[i].price.toString();
      }

      // ================= DELETED IMAGES =================
      if (deletedImages != null && deletedImages.isNotEmpty) {
        for (int i = 0; i < deletedImages.length; i++) {
          request.fields['deleted_images[$i]'] = deletedImages[i].toString();
        }
      }

      // ================= NEW IMAGES =================
      for (int i = 0; i < images.length; i++) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'photos[$i]',
            images[i].path,
            filename: images[i].path.split('/').last,
          ),
        );
      }

      // ================= SEND =================
      final streamed = await request.send();
      final response = await http.Response.fromStream(streamed);

      if (response.statusCode == 200) {
        return {
          "statusCode": response.statusCode,
          "body": jsonDecode(response.body),
        };
      } else {
        print("UPDATE ERROR ${response.statusCode}");
        print(response.body);
        return null;
      }
    } catch (e) {
      print("UPDATE EXCEPTION: $e");
      return null;
    }
  }

  static Future<List<dynamic>?> getAllProperties({
    required String token,
    String? search,
    String? propertyType,
    String? ownershipType,
  }) async {
    try {
      final uri = Uri.parse("${AppUrl.baseUrl}/properties").replace(
        queryParameters: {
          if (search != null && search.isNotEmpty) 'search': search,
          if (propertyType != null && propertyType.isNotEmpty)
            'property_type': propertyType,
          if (ownershipType != null && ownershipType.isNotEmpty)
            'ownership_type': ownershipType,
        },
      );

      final response = await http.get(
        uri,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print("GET PROPERTIES ERROR ${response.statusCode}");
        print(response.body);
        return null;
      }
    } catch (e) {
      print("GET PROPERTIES EXCEPTION: $e");
      return null;
    }
  }

  static Future<Map<String, dynamic>?> getPropertyById({
    required String token,
    required int id,
  }) async {
    try {
      final uri = Uri.parse("${AppUrl.baseUrl}/property/$id");

      final response = await http.get(
        uri,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print("GET PROPERTY ERROR ${response.statusCode}");
        print(response.body);
        return null;
      }
    } catch (e) {
      print("GET PROPERTY EXCEPTION: $e");
      return null;
    }
  }

  static Future<Map<String, dynamic>?> toggleFavorite({
    required String token,
    required int propertyId,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("${AppUrl.baseUrl}/properties/$propertyId/favorite"),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }

      print("TOGGLE FAVORITE ERROR ${response.statusCode}");
      print(response.body);
      return null;
    } catch (e) {
      print("TOGGLE FAVORITE EXCEPTION: $e");
      return null;
    }
  }

  static Future<List<dynamic>?> getFavorites({required String token}) async {
    try {
      final response = await http.get(
        Uri.parse("${AppUrl.baseUrl}/favorites"),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }

      print("GET FAVORITES ERROR ${response.statusCode}");
      print(response.body);
      return null;
    } catch (e) {
      print("GET FAVORITES EXCEPTION: $e");
      return null;
    }
  }

  // ================= GET PROFILE =================
  static Future<Map<String, dynamic>?> getProfile({
    required String token,
  }) async {
    try {
      final response = await http.get(
        Uri.parse("${AppUrl.baseUrl}/profile"),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print("GET PROFILE ERROR ${response.statusCode}");
        print(response.body);
        return null;
      }
    } catch (e) {
      print("GET PROFILE EXCEPTION: $e");
      return null;
    }
  }

  static Future<Map<String, dynamic>?> updateProfile({
    required String token,
    required String name,
    required String phone,
    File? image,
  }) async {
    try {
      final uri = Uri.parse("${AppUrl.baseUrl}/profile/update");

      final request = http.MultipartRequest('POST', uri);

      request.headers['Accept'] = 'application/json';
      request.headers['Authorization'] = 'Bearer $token';
      request.fields['_method'] = 'PUT';

      request.fields['name'] = name;
      request.fields['phone'] = phone;

      if (image != null) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'image',
            image.path,
            filename: image.path.split('/').last,
          ),
        );
      }

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print("UPDATE PROFILE ERROR ${response.statusCode}");
        print(response.body);
        return null;
      }
    } catch (e) {
      print("UPDATE PROFILE EXCEPTION: $e");
      return null;
    }
  }

  static Future<Map<String, dynamic>?> deleteAccount({
    required String token,
  }) async {
    try {
      final response = await http.delete(
        Uri.parse("${AppUrl.baseUrl}/deleteAccount"),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      return {
        "statusCode": response.statusCode,
        "body": response.body.isNotEmpty ? jsonDecode(response.body) : null,
      };
    } catch (e) {
      print("DELETE ACCOUNT ERROR: $e");
      return null;
    }
  }

  static Future<Map<String, dynamic>?> mapProperties({
    required String token,
    required String city,
    required String serviceType,
    String? propertyType,
    String? ownershipType, // ✅ أضفناه
    double? priceMin,
    double? priceMax,
  }) async {
    try {
      final uri = Uri.parse("${AppUrl.baseUrl}/mapProperties").replace(
        queryParameters: {
          'city': city,
          'service_type': serviceType,
          if (propertyType != null && propertyType.isNotEmpty)
            'property_type': propertyType,
          if (ownershipType != null && ownershipType.isNotEmpty)
            'ownership_type': ownershipType, // ✅ أضفناه
          if (priceMin != null) 'price_min': priceMin.toString(),
          if (priceMax != null) 'price_max': priceMax.toString(),
        },
      );

      final response = await http.get(
        uri,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          'ngrok-skip-browser-warning': 'true',
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print("MAP PROPERTIES ERROR ${response.statusCode}");
        print(response.body);
        return null;
      }
    } catch (e) {
      print("MAP PROPERTIES EXCEPTION: $e");
      return null;
    }
  }
}
