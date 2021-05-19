class SettingList{
  String name;
  SettingItemType type;
  bool checked;
  SettingList(this.name,this.type,this.checked);
}
enum SettingItemType{
  ControlCenter,
  Login,

}