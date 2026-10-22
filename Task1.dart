// Абстрактний клас LibraryItem
abstract class LibraryItem {
  final String title;
  final int year;

  LibraryItem({required this.title, required this.year});

  String describe();
}

// Клас Book
class Book extends LibraryItem {
  final String author;

  Book({required String title, required int year, required this.author})
    : super(title: title, year: year);

  @override
  String describe() {
    return '$title ($year) – $author';
  }
}

// Клас Magazine
class Magazine extends LibraryItem {
  final int issueNumber;

  Magazine({
    required String title,
    required int year,
    required this.issueNumber,
  }) : super(title: title, year: year);

  @override
  String describe() {
    return '$title ($year), випуск $issueNumber';
  }
}

// Клас Library
class Library {
  final List<LibraryItem> _items = [];

  void addItem(LibraryItem item) {
    _items.add(item);
  }

  List<LibraryItem> findByYear(int year) {
    return _items.where((item) => item.year == year).toList();
  }

  List<String> get allDescriptions {
    return _items.map((item) => item.describe()).toList();
  }

  LibraryItem? findOldest() {
    if (_items.isEmpty) return null;

    LibraryItem oldest = _items.first;
    for (var item in _items) {
      if (item.year < oldest.year) {
        oldest = item;
      }
    }
    return oldest;
  }
}

void main() {
  final library = Library();
  library.addItem(Book(title: 'Dart у дії', year: 2022, author: 'І. Петренко'));
  library.addItem(Magazine(title: 'Mobile Dev', year: 2023, issueNumber: 5));

  final from2022 = library.findByYear(2022);
  print('Знайдено за 2022 рік: ${from2022.length} елемент');

  final descriptions = library.allDescriptions;
  print('Описи всіх елементів:');
  for (var desc in descriptions) {
    print('$desc');
  }

  final oldest = library.findOldest();
  if (oldest != null) {
    print('Найстаріший елемент: ${oldest.describe()}');
  }
}
