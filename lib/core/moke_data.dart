import "dart:convert";
//installStatus 1:未安装 2:下载中 3:安装中 4：安装失败
List<Map<String,dynamic>> mokeJson=[
  {
    "id":1,
    "name":"Just Focus",
    "tag":"效率",
    "icon":"icon",
    "size":1000,
    "installed":false,
    "installStatus":1
  },
  {
    "id":2,
    "name":"网易云音乐",
    "tag":"音乐",
    "icon":"icon",
    "size":1000,
    "installed":false,
    "installStatus":1
  },
  {
    "id":3,
    "name":"剪映专业版",
    "tag":"视频创作",
    "icon":"icon",
    "size":1000,
    "installed":false,
    "installStatus":1
  },
  {
    "id":4,
    "name":"djay - DJ应用&混音器",
    "tag":"混合音乐",
    "icon":"icon",
    "size":1000,
    "installed":false,
    "installStatus":2
  },
  {
    "id":5,
    "name":"Things",
    "tag":"效率",
    "icon":"icon",
    "size":1000,
    "installed":false,
    "installStatus":3
  },
  {
    "id":6,
    "name":"钉钉",
    "tag":"阿里巴巴",
    "icon":"icon",
    "size":1000,
    "installed":false,
    "installStatus":4
  }
];


List<MokeModelEntity> mokeModelEntityFromJson(str) => List<MokeModelEntity>.from(str.map((x) => MokeModelEntity.fromJson(x)));

String mokeModelEntityToJson(List<MokeModelEntity> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MokeModelEntity {
  MokeModelEntity({
    this.id,
    this.name,
    this.tag,
    this.icon,
    this.size,
    this.installed,
    this.installStatus,
  });

  int id;
  String name;
  String tag;
  String icon;
  int size;
  bool installed;
  int installStatus;

  factory MokeModelEntity.fromJson(Map<String, dynamic> json) => MokeModelEntity(
    id: json["id"],
    name: json["name"],
    tag: json["tag"],
    icon: json["icon"],
    size: json["size"],
    installed: json["installed"],
    installStatus: json["installStatus"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "tag": tag,
    "icon": icon,
    "size": size,
    "installed": installed,
    "installStatus": installStatus,
  };
}