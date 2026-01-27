class Routes {
  static const String _development = "https://animekid.farishasyim.my.id";
  static const String _endpoint = "$_development/api";

  //---- ROUTES

  //---- Auth
  static const String register = "$_endpoint/register";
  static const String login = "$_endpoint/login";
  static const String logout = "$_endpoint/logout";
  static const String user = "$_endpoint/profile";

  //---- Recipes
  static const String recipes = "$_endpoint/recipes";
  static const String recipesExplore = "$_endpoint/explore/groups";

  //---- Recommendation
  static const String recommendation = "$_endpoint/recommendations/moora";

  //---- Alat
  static const String alat = "$_endpoint/alats";

  //---- Bahan
  static const String bahan = "$_endpoint/bahans";
}
