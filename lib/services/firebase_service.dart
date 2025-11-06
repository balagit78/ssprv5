import 'dart:convert';
import 'package:http/http.dart' as http;

class FirebaseService {
  static final FirebaseService _instance = FirebaseService._internal();
  factory FirebaseService() => _instance;
  FirebaseService._internal();

  // Public Firestore REST API project configuration
  // Note: Database is (default)
  static const String _projectId = 'admingloves-1bd9a';

  /// Main method: Checks if a company name exists in Firebase and returns the mapped URL
  /// Performs EXACT matching only:
  /// 1. Exact document ID match (case-insensitive, spaces removed)
  /// 2. Query by 'name' field if it exists (exact match)
  /// Returns null if company not found
  /// 
  /// Examples:
  /// - "admingloves1" will only match document "admingloves1"
  /// - "admingloves2" will only match document "admingloves2"
  /// - "AdminGloves1" will match document "admingloves1" (case-insensitive)
  Future<String?> getCompanyUrl(String companyName) async {
    try {
      final trimmedName = companyName.trim();
      final normalizedName = trimmedName.toLowerCase().replaceAll(' ', '');

      // Try normalized doc id first
      final url1 = await _fetchUrlForDocId(normalizedName);
      if (url1 != null && url1.isNotEmpty) return url1;

      // Fallback to exact trimmed name as doc id
      if (trimmedName != normalizedName) {
        final url2 = await _fetchUrlForDocId(trimmedName);
        if (url2 != null && url2.isNotEmpty) return url2;
      }

      return null;
    } catch (e) {
      // Ignore and just report null to the UI
      return null;
    }
  }

  Future<String?> _fetchUrlForDocId(String docId) async {
    final uri = Uri.parse(
        'https://firestore.googleapis.com/v1/projects/$_projectId/databases/(default)/documents/companies/$docId');

    final resp = await http.get(uri);
    if (resp.statusCode != 200) return null;

    final Map<String, dynamic> jsonBody = json.decode(resp.body);
    final fields = jsonBody['fields'] as Map<String, dynamic>?;
    if (fields == null) return null;
    final urlField = fields['url'] as Map<String, dynamic>?;
    if (urlField == null) return null;
    return urlField['stringValue'] as String?;
  }
}

