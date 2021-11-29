class APIPath {
  static String meal(String uid, String mealId) => 'users/$uid/meals/$mealId';
  static String meals(String uid) => 'users/$uid/meals';
}
