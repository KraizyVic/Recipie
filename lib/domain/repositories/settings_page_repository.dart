abstract class SettingsPageRepository {
  // Account Functions
  Future<void> createAccount(String username, String imageLink);
  Future<void> updateAccount(String username, String imageLink);



}