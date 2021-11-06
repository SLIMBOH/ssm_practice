package com.suhao.crud.service;

import com.suhao.crud.pojo.Books;
import java.util.List;

public interface BookService {

    public int addBook(Books book);

    public int deleteBook(int id);

    public int editBook(Books book);

    public List<Books> getAllBooks();

    public Books getBookById(int id);

}
