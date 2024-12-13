class VehicleDetailsResponse {
  final bool status;
  final VehicleDetails data;

  VehicleDetailsResponse({
    required this.status,
    required this.data,
  });

  factory VehicleDetailsResponse.fromJson(Map<String, dynamic> json) {
    return VehicleDetailsResponse(
      status: json['status'],
      data: VehicleDetails.fromJson(json['data']),
    );
  }
}

class VehicleDetails {
  final int? id;
  final String? uniqueId;
  final int? fkUserId;
  final int? fkRoleId;
  final int? fkVehicleTypeId;
  final int? fkCategoryId;
  final int? fkSubCategoryId;
  final int? fkBrandId;
  final int? fkVehicleModelId;
  final int? fkVehicleVariantId;
  final int? fkVehicleColorId;
  final int? fkTransmissionId;
  final int? fkFuelTypeId;
  final int? fkBodyTypeId;
  final dynamic fkVehicleFeaturesId;
  final String? year;
  final String? location;
  final String? latitude;
  final String? longitude;
  final String? kmDriven;
  final String? insuranceValidity;
  final String? price;
  final String? type;
  final String? description;
  final dynamic dealPrice;
  final int? isNewArrival;
  final int? isPopular;
  final String? status;
  final dynamic vehicleStatus;
  final String? isVerified;
  final dynamic remark;
  final dynamic percentage;
  final dynamic totalAmount;
  final int? createdBy;
  final int? updatedBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;
  final List<ImageDetails> images;
  final List<dynamic> overviewDetails;
  final List<dynamic> specificationDetails;
  final List<dynamic> vehicleDetailFeatureVehicles;
  final Brand? brand;
  final Category? category;
  final SubCategory? subCategory;
  final VehicleModel? vehicleModel;
  final VehicleVariant? vehicleVariant;
  final VehicleColor? vehicleColor;
  final Transmission? transmission;
  final FuelType? fuelType;
  final BodyType? bodyType;
  final VehicleType vehicleType;
  final List<VehicleInfoDetail> vehicleInfoDetails;
  final List<VehicleOverViewDetails> vehicleOverviewDetails;

  VehicleDetails({
    required this.id,
    required this.uniqueId,
    required this.fkUserId,
    required this.fkRoleId,
    required this.fkVehicleTypeId,
    required this.fkCategoryId,
    required this.fkSubCategoryId,
    required this.fkBrandId,
    required this.fkVehicleModelId,
    required this.fkVehicleVariantId,
    required this.fkVehicleColorId,
    required this.fkTransmissionId,
    required this.fkFuelTypeId,
    required this.fkBodyTypeId,
    this.fkVehicleFeaturesId,
    required this.year,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.kmDriven,
    required this.insuranceValidity,
    required this.price,
    required this.type,
    required this.description,
    this.dealPrice,
    required this.isNewArrival,
    required this.isPopular,
    required this.status,
    this.vehicleStatus,
    required this.isVerified,
    this.remark,
    this.percentage,
    this.totalAmount,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.images,
    required this.overviewDetails,
    required this.specificationDetails,
    required this.vehicleDetailFeatureVehicles,
    required this.brand,
    required this.category,
    required this.subCategory,
    required this.vehicleModel,
    required this.vehicleVariant,
    required this.vehicleColor,
    required this.transmission,
    required this.fuelType,
    required this.bodyType,
    required this.vehicleType,
    required this.vehicleInfoDetails,
    required this.vehicleOverviewDetails,
  });

  factory VehicleDetails.fromJson(Map<String, dynamic> json) {
    List<VehicleOverViewDetails> vehicleOverviewDetails = [];
    if (json["vehicle_overview_details"] != null) {
      vehicleOverviewDetails = [];
      json['vehicle_overview_details'].forEach((e) {
        vehicleOverviewDetails.add(VehicleOverViewDetails.fromJson(e));
      });
    } else {
      vehicleOverviewDetails = [];
    }
    return VehicleDetails(
      id: json['id'],
      uniqueId: json['unique_id'],
      fkUserId: json['fk_user_id'],
      fkRoleId: json['fk_role_id'],
      fkVehicleTypeId: json['fk_vehicle_type_id'],
      fkCategoryId: json['fk_category_id'],
      fkSubCategoryId: json['fk_sub_category_id'],
      fkBrandId: json['fk_brand_id'],
      fkVehicleModelId: json['fk_vehicle_model_id'],
      fkVehicleVariantId: json['fk_vehicle_variant_id'],
      fkVehicleColorId: json['fk_vehicle_color_id'],
      fkTransmissionId: json['fk_transmission_id'],
      fkFuelTypeId: json['fk_fuel_type_id'],
      fkBodyTypeId: json['fk_body_type_id'],
      fkVehicleFeaturesId: json['fk_vehicle_features_id'],
      year: json['year'],
      location: json['location'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      kmDriven: json['km_driven'],
      insuranceValidity: json['insurance_validity'],
      price: json['price'],
      type: json['type'],
      description: json['description'],
      dealPrice: json['deal_price'],
      isNewArrival: json['is_new_arrival'],
      isPopular: json['is_popular'],
      status: json['status'],
      vehicleStatus: json['vehicle_status'],
      isVerified: json['is_verified'],
      remark: json['remark'],
      percentage: json['percentage'],
      totalAmount: json['total_amount'],
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'],
      images: (json['images'] as List).map((i) => ImageDetails.fromJson(i)).toList(),
      overviewDetails: json['overview_details'],
      specificationDetails: json['specification_details'],
      vehicleDetailFeatureVehicles: json['vehicle_detail_feature_vehicles'],
      brand: Brand.fromJson(json['brand']),
      category: Category.fromJson(json['category']),
      subCategory: SubCategory.fromJson(json['sub_category']),
      vehicleModel: VehicleModel.fromJson(json['vehicle_model']),
      vehicleVariant: VehicleVariant.fromJson(json['vehicle_variant']),
      vehicleColor: VehicleColor.fromJson(json['vehicle_color']),
      transmission: Transmission.fromJson(json['transmission']),
      fuelType: FuelType.fromJson(json['fuel_type']),
      bodyType: BodyType.fromJson(json['body_type']),
      vehicleType: VehicleType.fromJson(json['vehicle_type']),
      vehicleInfoDetails: (json['vehicle_info_details'] as List)
          .map((i) => VehicleInfoDetail.fromJson(i))
          .toList(),
      vehicleOverviewDetails: vehicleOverviewDetails,
    );
  }
}

class ImageDetails {
  final int id;
  final int fkVehicleDetailsId;
  final String? imageUrl;
  final int createdBy;
  final int updatedBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;

  ImageDetails({
    required this.id,
    required this.fkVehicleDetailsId,
    required this.imageUrl,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory ImageDetails.fromJson(Map<String, dynamic> json) {
    return ImageDetails(
      id: json['id'],
      fkVehicleDetailsId: json['fk_vehicle_details_id'],
      imageUrl: json['image_url'],
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'],
    );
  }
}

class Brand {
  final int id;
  final int fkVehicleTypeId;
  final String? name;
  final String? icon;
  final String? status;
  final int createdBy;
  final int updatedBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;

  Brand({
    required this.id,
    required this.fkVehicleTypeId,
    required this.name,
    required this.icon,
    required this.status,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['id'],
      fkVehicleTypeId: json['fk_vehicle_type_id'],
      name: json['name'],
      icon: json['icon'],
      status: json['status'],
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'],
    );
  }
}

class Category {
  final int id;
  final String? name;
  final int createdBy;
  final int updatedBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Category({
    required this.id,
    required this.name,
    required this.createdBy,
    required this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }
}

class SubCategory {
  final int id;
  final int fkCategoryId;
  final String? name;
  final String? status;
  final int? createdBy;
  final int? updatedBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;

  SubCategory({
    required this.id,
    required this.fkCategoryId,
    required this.name,
    required this.status,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['id'],
      fkCategoryId: json['fk_category_id'],
      name: json['name'],
      status: json['status'],
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'],
    );
  }
}

class VehicleModel {
  final int? id;
  final int? fkVehicleTypeId;
  final int? fkBrandId;
  final String? name;
  final String? status;
  final int? createdBy;
  final int? updatedBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;

  VehicleModel({
    required this.id,
    required this.fkVehicleTypeId,
    required this.fkBrandId,
    required this.name,
    required this.status,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      id: json['id'],
      fkVehicleTypeId: json['fk_vehicle_type_id'],
      fkBrandId: json['fk_brand_id'],
      name: json['name'],
      status: json['status'],
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'],
    );
  }
}

class VehicleVariant {
  final int? id;
  final int? fkVehicleTypeId;
  final int? fkBrandId;
  final int? fkVehicleModelId;
  final String? name;
  final String? status;
  final int? createdBy;
  final int? updatedBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;

  VehicleVariant({
    required this.id,
    required this.fkVehicleTypeId,
    required this.fkBrandId,
    required this.fkVehicleModelId,
    required this.name,
    required this.status,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory VehicleVariant.fromJson(Map<String, dynamic> json) {
    return VehicleVariant(
      id: json['id'],
      fkVehicleTypeId: json['fk_vehicle_type_id'],
      fkBrandId: json['fk_brand_id'],
      fkVehicleModelId: json['fk_vehicle_model_id'],
      name: json['name'],
      status: json['status'],
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'],
    );
  }
}

class VehicleColor {
  final int? id;
  final int? fkVehicleTypeId;
  final String? name;
  final String? status;
  final int? createdBy;
  final int? updatedBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;

  VehicleColor({
    required this.id,
    required this.fkVehicleTypeId,
    required this.name,
    required this.status,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory VehicleColor.fromJson(Map<String, dynamic> json) {
    return VehicleColor(
      id: json['id'],
      fkVehicleTypeId: json['fk_vehicle_type_id'],
      name: json['name'],
      status: json['status'],
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'],
    );
  }
}

class Transmission {
  final int? id;
  final String? name;
  final int? createdBy;
  final int? updatedBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Transmission({
    required this.id,
    required this.name,
    required this.createdBy,
    required this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  factory Transmission.fromJson(Map<String, dynamic> json) {
    return Transmission(
      id: json['id'],
      name: json['name'],
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }
}

class FuelType {
  final int? id;
  final String? name;
  final int? createdBy;
  final int? updatedBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  FuelType({
    required this.id,
    required this.name,
    required this.createdBy,
    required this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  factory FuelType.fromJson(Map<String, dynamic> json) {
    return FuelType(
      id: json['id'],
      name: json['name'],
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }
}

class BodyType {
  final int? id;
  final int? fkVehicleTypeId;
  final String? name;
  final int? createdBy;
  final int? updatedBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  BodyType({
    required this.id,
    required this.fkVehicleTypeId,
    required this.name,
    required this.createdBy,
    required this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  factory BodyType.fromJson(Map<String, dynamic> json) {
    return BodyType(
      id: json['id'],
      fkVehicleTypeId: json['fk_vehicle_type_id'],
      name: json['name'],
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }
}

class VehicleType {
  final int? id;
  final String? name;
  final int? createdBy;
  final int? updatedBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  VehicleType({
    required this.id,
    required this.name,
    required this.createdBy,
    required this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  factory VehicleType.fromJson(Map<String, dynamic> json) {
    return VehicleType(
      id: json['id'],
      name: json['name'],
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }
}

class VehicleInfoDetail {
  final int? id;
  final int? fkVehicleDetailsId;
  final int? fkVehicleInfoId;
  final String? infoDetails;
  final int? createdBy;
  final int? updatedBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;
  final VehicleInfo vehicleInfo;

  VehicleInfoDetail({
    required this.id,
    required this.fkVehicleDetailsId,
    required this.fkVehicleInfoId,
    required this.infoDetails,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.vehicleInfo,
  });

  factory VehicleInfoDetail.fromJson(Map<String, dynamic> json) {
    return VehicleInfoDetail(
      id: json['id'],
      fkVehicleDetailsId: json['fk_vehicle_details_id'],
      fkVehicleInfoId: json['fk_vehicle_info_id'],
      infoDetails: json['info_details'],
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'],
      vehicleInfo: VehicleInfo.fromJson(json['vehicle_info']),
    );
  }
}

class VehicleInfo {
  final int? id;
  final int? fkVehicleTypeId;
  final String? name;
  final String? icon;
  final String? status;
  final int? createdBy;
  final int? updatedBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;

  VehicleInfo({
    required this.id,
    required this.fkVehicleTypeId,
    required this.name,
    required this.icon,
    required this.status,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory VehicleInfo.fromJson(Map<String, dynamic> json) {
    return VehicleInfo(
      id: json['id'],
      fkVehicleTypeId: json['fk_vehicle_type_id'],
      name: json['name'],
      icon: json['icon'],
      status: json['status'],
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'],
    );
  }
}

class VehicleOverViewDetails {
  int id;
  int fkVehicleDetailsId;
  int fkVehicleOverviewId;
  String? overviewDetails;
  int createdBy;
  int updatedBy;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  Overview overview;

  VehicleOverViewDetails({
    required this.id,
    required this.fkVehicleDetailsId,
    required this.fkVehicleOverviewId,
    required this.overviewDetails,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.overview,
  });

  factory VehicleOverViewDetails.fromJson(Map<String, dynamic> json) {
    return VehicleOverViewDetails(
      id: json['id'],
      fkVehicleDetailsId: json['fk_vehicle_details_id'],
      fkVehicleOverviewId: json['fk_vehicle_overview_id'],
      overviewDetails: json['overview_details'],
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      overview: Overview.fromJson(json['overview']),
    );
  }
}

class Overview {
  int id;
  int fkVehicleTypeId;
  String? name;
  String? status;
  int createdBy;
  int updatedBy;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Overview({
    required this.id,
    required this.fkVehicleTypeId,
    required this.name,
    required this.status,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory Overview.fromJson(Map<String, dynamic> json) {
    return Overview(
      id: json['id'],
      fkVehicleTypeId: json['fk_vehicle_type_id'],
      name: json['name'],
      status: json['status'],
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
    );
  }
}