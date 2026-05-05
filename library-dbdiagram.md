Table book {
  id int [pk]
  name string
  isbn int
  category_id int
  bookshelf_id int
}
table category{
  id int
  name string
  gendre string
}

table bookshelf {
  id int
  name string

}
Table librarian {
  id int [pk]
  name string
  adress string
  phone string
}


Table borrowing {
  id int [pk]
  name string
  adress string
  phone string
  librarian_id int
  book_id int
}
Ref: book.id > borrowing.book_id
Ref: librarian.id > borrowing.librarian_id  
Ref: category.id > book.category_id
Ref: bookshelf.id - book.bookshelf_id