import 'package:movies_app/tabs/browse_tab/data/models/category.dart';

class CategoriesResponse {
  CategoriesResponse({
    required this.categories,
  });
  late final List<Category> categories;

  CategoriesResponse.fromJson(Map<String, dynamic> json){
    categories = List.from(json['genres']).map((e)=>Category.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['genres'] = categories.map((e)=>e.toJson()).toList();
    return _data;
  }
}

