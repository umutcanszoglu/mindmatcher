import 'package:get/get.dart';
import 'package:mindmatcher/models/category_model.dart';
import 'package:mindmatcher/models/word_model.dart';
import 'package:mindmatcher/services/api.dart';

class CategoryController extends GetxController {
  final categories = <CategoryModel>[].obs;
  final selectedCategories = <CategoryModel>[].obs;
  final gameWords = <String>[].obs;
  final wordModels = <WordModel>[].obs;

  final isLoading = true.obs;

  Future<void> wordPool() async {
    selectedCategories.clear();
    for (var category in categories) {
      if (category.isSelected) {
        selectedCategories.add(category);
      }
    }

    final wordsList = await Future.wait(
      selectedCategories.map(
        (e) async {
          final words = await Api.getWords(e.category);
          return words!.values.first.map<String>(
            (e) => e.toString(),
          );
        },
      ),
    );
    gameWords.clear();
    for (final words in wordsList) {
      gameWords.addAll(words.map<String>((e) => e.toString()));
    }
  }

  Future<List<String>> getGameWords() async {
    await wordPool();
    final wordList = <String>[];

    gameWords.shuffle();
    for (int i = 0; i < gameWords.length / selectedCategories.length; i++) {
      wordList.add(gameWords[i]);
    }
    return wordList;
  }

  @override
  void onInit() async {
    final cat = await Api.getCategories();
    for (var category in cat) {
      final model = CategoryModel(category: category, isSelected: false);
      categories.add(model);
    }

    isLoading.value = false;

    super.onInit();
  }
}
