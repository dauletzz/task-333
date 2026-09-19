class Book {
  String title;
  String author;
  double price;
  bool isBorrowed;
  
  Book({
    required this.title,
    required this.author,
    required this.price,
    this.isBorrowed = false,
  });
}

class Library {
  List<Book> _books = [];
  void addBook(Book book) {
    _books.add(book);
  }
  List<Book> getAvailableBooks(){
    return _books.where((book) => book.isBorrowed == false).toList();
  }
  double getTotalValue(){
    return _books.fold(0.0, (total, book)=> total + book.price);
  }
}

void main(){
  Library library = Library();
  library.addBook(Book(
    title: "The Alchemist",
    author: "Paulo Coelho",
    price: 15.99,
  ));
  library.addBook(Book(
    title: "1984",
    author: "George Orwell",
    price: 12.50,
    isBorrowed: true,
  ));
  library.addBook(Book(
    title: "Atomic Habits",
    author: "James Clear",
    price: 20.00,
  ));
  
  print("Available Books:");
  for(var book in library.getAvailableBooks()){
    print("${book.title} by ${book.author} - \$${book.price}");
  }
  print("\nTotal Collection Value: \$${library.getTotalValue()}");
}
