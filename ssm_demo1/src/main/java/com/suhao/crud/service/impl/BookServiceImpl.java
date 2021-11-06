package com.suhao.crud.service.impl;

import com.suhao.crud.dao.BookMapper;
import com.suhao.crud.pojo.Books;
import com.suhao.crud.service.BookService;

import java.util.List;

public class BookServiceImpl implements BookService {

    private BookMapper bookMapper;

    public void setBookMapper(BookMapper bookMapper) {
        this.bookMapper = bookMapper;
    }

    public int addBook(Books book) { return bookMapper.addBook(book);}

    public int deleteBook(int id) {
        return bookMapper.deleteBook(id);
    }

    public int editBook(Books book) {
        return bookMapper.editBook(book);
    }

    public List<Books> getAllBooks() {
        return bookMapper.getAllBooks();
    }

    public Books getBookById(int id) {
        return bookMapper.getBookById(id);
    }

    public BookMapper getBookMapper() {
        return bookMapper;
    }
}
