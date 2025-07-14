class ApiService {
  static const String baseUrl = "https://projectiv.in/zobpot/public/api/";
  
  ///Registartion Api
  static const String postnonSkillRegistrationUrl = "${baseUrl}register";

  ///State,City,Pincode Get Api
   static const String getStateUrl = "${baseUrl}states";
  static const String getCityUrl = "${baseUrl}cities/";
  static const String getpincodeUrl = "${baseUrl}zipcodes/";
}
