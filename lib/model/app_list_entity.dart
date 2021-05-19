import 'dart:convert';

List<AppOriginListEntity> appOriginListEntityFromJson(String str) => List<AppOriginListEntity>.from(json.decode(str).map((x) => AppOriginListEntity.fromJson(x)));

String appOriginListEntityToJson(List<AppOriginListEntity> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AppOriginListEntity {
  AppOriginListEntity({
    this.id,
    this.info,
  });

  int id;
  Info info;

  factory AppOriginListEntity.fromJson(Map<String, dynamic> json) => AppOriginListEntity(
    id: json["id"],
    info: Info.fromJson(json["info"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "info": info.toJson(),
  };
}

class Info {
  Info({
    this.locales,
  });

  List<Locale> locales;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    locales: List<Locale>.from(json["locales"].map((x) => Locale.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "locales": List<dynamic>.from(locales.map((x) => x.toJson())),
  };
}

class Locale {
  Locale({
    this.language,
    this.name,
    this.slogan,
    this.description,
    this.changelog,
    this.icon,
    this.cover,
    this.tags,
    this.screenshots,
  });

  String language;
  String name;
  String slogan;
  String description;
  String changelog;
  String icon;
  String cover;
  List<String> tags;
  List<String> screenshots;

  factory Locale.fromJson(Map<String, dynamic> json) => Locale(
    language: json["language"],
    name: json["name"],
    slogan: json["slogan"],
    description: json["description"],
    changelog: json["changelog"],
    icon: json["icon"],
    cover: json["cover"],
    tags: List<String>.from(json["tags"].map((x) => x)),
    screenshots: List<String>.from(json["screenshots"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "language": language,
    "name": name,
    "slogan": slogan,
    "description": description,
    "changelog": changelog,
    "icon": icon,
    "cover": cover,
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "screenshots": List<dynamic>.from(screenshots.map((x) => x)),
  };
}


class Package {
  Package({
    this.name,
    this.blob,
    this.size,
    this.version,
    this.archs,
    this.signed,
    this.publishStatus,
    this.packageFormatCheck,
    this.packageSafetyCheck,
    this.packageSign,
    this.packagePublish,
  });

  String name;
  String blob;
  int size;
  String version;
  dynamic archs;
  bool signed;
  String publishStatus;
  dynamic packageFormatCheck;
  dynamic packageSafetyCheck;
  dynamic packageSign;
  dynamic packagePublish;

  factory Package.fromRawJson(String str) => Package.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Package.fromJson(Map<String, dynamic> json) => Package(
    name: json["name"] == null ? null : json["name"],
    blob: json["blob"] == null ? null : json["blob"],
    size: json["size"] == null ? null : json["size"],
    version: json["version"] == null ? null : json["version"],
    archs: json["archs"],
    signed: json["signed"] == null ? null : json["signed"],
    publishStatus: json["publish_status"] == null ? null : json["publish_status"],
    packageFormatCheck: json["PackageFormatCheck"],
    packageSafetyCheck: json["PackageSafetyCheck"],
    packageSign: json["PackageSign"],
    packagePublish: json["package_publish"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "blob": blob == null ? null : blob,
    "size": size == null ? null : size,
    "version": version == null ? null : version,
    "archs": archs,
    "signed": signed == null ? null : signed,
    "publish_status": publishStatus == null ? null : publishStatus,
    "PackageFormatCheck": packageFormatCheck,
    "PackageSafetyCheck": packageSafetyCheck,
    "PackageSign": packageSign,
    "package_publish": packagePublish,
  };
}

List<DownloadListEntity> downloadListEntityFromJson(String str) => List<DownloadListEntity>.from(json.decode(str).map((x) => DownloadListEntity.fromJson(x)));

String downloadListEntityToJson(List<DownloadListEntity> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DownloadListEntity {
  DownloadListEntity({
    this.appId,
    this.appName,
    this.scoreTotal,
    this.scoreCount,
    this.downloadCount,
  });

  int appId;
  String appName;
  int scoreTotal;
  int scoreCount;
  int downloadCount;

  factory DownloadListEntity.fromJson(Map<String, dynamic> json) => DownloadListEntity(
    appId: json["app_id"],
    appName: json["app_name"],
    scoreTotal: json["score_total"],
    scoreCount: json["score_count"],
    downloadCount: json["download_count"],
  );

  Map<String, dynamic> toJson() => {
    "app_id": appId,
    "app_name": appName,
    "score_total": scoreTotal,
    "score_count": scoreCount,
    "download_count": downloadCount,
  };
}
class AppListEntity {
  AppListEntity({
    this.id,
    this.icon,
    this.name,
    this.tags,
    this.slogan,
    this.description,
    this.cover,
    this.screenshots,
  });

  int id;
  String name;
  String slogan;
  String description;
  String icon;
  String cover;
  List<String> tags;
  List<String> screenshots;
}
