class ApiService {
  static const String baseUrl = "https://projectiv.in/zobpot/public/api/";

  static const String getStateUrl = "${baseUrl}states";
  static const String getCityUrl = "${baseUrl}cities/";
  static const String getAreaUrl = "${baseUrl}area-list";
  static const String getpincodeUrl = "${baseUrl}zipcodes/";
  static const String postPincodeUrl = "${baseUrl}zipcodes";

  static const String jobCategoriesUrl = "${baseUrl}job-categories";

  static String getSubCategoriesUrl(int categoryId) {
    return "${baseUrl}sub-categories/$categoryId";
  }

  static String getSkillsUrl(int categoryId, int subCategoryId) {
    return "${baseUrl}skills/$categoryId/$subCategoryId";
  }
}
