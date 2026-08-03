abstract class ApiConsumer {
  Future<dynamic> get(String path,{dynamic data, Map<String, dynamic>? query
  ,  bool isFromData=false});

  Future<dynamic> post(String path, {Object? data, Map<String, dynamic>? query
  ,  bool isFromData=false}
  );

  Future<dynamic> delete(
    String path,{Object? data, Map<String, dynamic>? query
  ,  bool isFromData=false}
  
  
      );

  Future<dynamic> patch(String path, {Object? data, Map<String, dynamic>? query
  ,  bool isFromData=false});
}
