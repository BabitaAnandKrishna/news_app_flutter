import 'package:flutter/cupertino.dart';
import 'package:news_app_flutter/Models/CategoryModel.dart';

List<CategoryModel> getCategory() {
  List<CategoryModel> myCategory = new List<CategoryModel>();
  CategoryModel categoryModel = new CategoryModel();

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Business";
  categoryModel.imageUrl ="";
  myCategory.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.imageUrl = "";
  myCategory.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "General";
  categoryModel.imageUrl = "";
  myCategory.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName  = "Health";
  categoryModel.imageUrl = "";
  myCategory.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName  = "Science";
  categoryModel.imageUrl = "";
  myCategory.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName  = "Sports";
  categoryModel.imageUrl = "";
  myCategory.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName  = "Technology";
  categoryModel.imageUrl = "";
  myCategory.add(categoryModel);

  return myCategory;
}