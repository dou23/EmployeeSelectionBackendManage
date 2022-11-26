class ESApi {
  static String BaseUrl() {
    return "http://127.0.0.1:9023/api/";
  }

  ///登录
  static const String login = "auth/admin/login";
  ///获取员工列表
  static const String employeeList = "user/list";
  ///添加员工
  static const String addEmployee = "auth/user/register";
  ///删除员工
  static const String delEmployee = "user/del";
  ///编辑员工信息
  static const String editEmployee = "user/edit";
  ///评选内容模板列表
  static const String selectionContentList = "user/selection/content/list";
  ///评选内容模板列表
  static const String selectionContentCreate = "user/selection/content/create";
  ///删除指定评选内容模板
  static const String selectionContentDel = "user/selection/content/del";
  ///编辑指定评选内容模板
  static const String selectionContentEdit = "user/selection/content/edit";
}
