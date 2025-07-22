class Routes {
  static const String _development = "https://2197f754a9a8.ngrok-free.app";
  static const String _endpoint = "$_development/api";

  //---- ROUTES

  //---- Auth
  static const String register = "$_endpoint/register";
  static const String login = "$_endpoint/login";
  static const String logout = "$_endpoint/logout";
  static const String user = "$_endpoint/profile";
}
