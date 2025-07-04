class UrlHelper {
  static String extractQueryParams(String url) {
    final uri = Uri.parse(url);
    return uri.hasQuery ? '?${uri.query}' : '';
  }
}