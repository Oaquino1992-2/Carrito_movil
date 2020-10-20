import 'package:flutter_ecommerce/model/category.dart';
import 'package:flutter_ecommerce/services/mocks/categories_mock.dart';

class CategoryService {
  final categoryMock = CategoriesMock();
  CategoryService();

  List<Category> getCategoriesForMenu() {
    List<Category> categories = categoryMock.getCategories();

    return [
      categories[0],
      categories[1],
      categories[2]
    ];
  }

  List<Category> getAllCategories() {
    return categoryMock.getCategories();
  }

  Category getCategoryById(int id) {
    List<Category> categories = categoryMock.getCategories();
    for (var i = 0; i < categories.length; i++) {
      if (categories[i].id == id) {
        return categories[i];
      }
    }

    return null;
  }
}
