import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static final StorageService _instance = StorageService._internal();
  factory StorageService() => _instance;
  StorageService._internal();

  static const String _companyUrlKey = 'company_url';
  static const String _companyNameKey = 'company_name';

  /// Save company URL to local storage
  Future<bool> saveCompanyUrl(String url) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.setString(_companyUrlKey, url);
    } catch (e) {
      print('Error saving company URL: $e');
      return false;
    }
  }

  /// Get company URL from local storage
  Future<String?> getCompanyUrl() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_companyUrlKey);
    } catch (e) {
      print('Error getting company URL: $e');
      return null;
    }
  }

  /// Save company name to local storage
  Future<bool> saveCompanyName(String name) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.setString(_companyNameKey, name);
    } catch (e) {
      print('Error saving company name: $e');
      return false;
    }
  }

  /// Get company name from local storage
  Future<String?> getCompanyName() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_companyNameKey);
    } catch (e) {
      print('Error getting company name: $e');
      return null;
    }
  }

  /// Clear all stored company data
  Future<bool> clearCompanyData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_companyUrlKey);
      await prefs.remove(_companyNameKey);
      return true;
    } catch (e) {
      print('Error clearing company data: $e');
      return false;
    }
  }

  /// Check if company URL exists in storage
  Future<bool> hasCompanyUrl() async {
    final url = await getCompanyUrl();
    return url != null && url.isNotEmpty;
  }
}

