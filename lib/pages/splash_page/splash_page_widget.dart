import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPageWidget extends StatefulWidget {
  const SplashPageWidget({super.key});

  static String routeName = 'SplashPage';
  static String routePath = '/';

  @override
  State<SplashPageWidget> createState() => _SplashPageWidgetState();
}

class _SplashPageWidgetState extends State<SplashPageWidget> {
  @override
  void initState() {
    super.initState();
    _checkStoredUrl();
  }

  Future<void> _checkStoredUrl() async {
    // Small delay for splash effect
    await Future.delayed(const Duration(milliseconds: 500));

    if (!mounted) return;

    final storageService = StorageService();
    final storedUrl = await storageService.getCompanyUrl();

    if (storedUrl != null && storedUrl.isNotEmpty) {
      // URL exists, navigate to webview
      context.goNamed(
        'WebViewPage',
        pathParameters: {'url': Uri.encodeComponent(storedUrl)},
      );
    } else {
      // No URL stored, navigate to company input page
      context.goNamed('CompanyInputPage');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: FlutterFlowTheme.of(context).primary,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
              child: Text(
                'Loading...',
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

