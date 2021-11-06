package com.suhao.crud.controller;

import com.suhao.crud.pojo.Books;
import com.suhao.crud.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping(value = "/book")
public class BookController {

    @Autowired
    @Qualifier(value = "BookServiceImpl")
    private BookService bookService;

    @RequestMapping(value = "/getAll")
    public String getAllBooks(Model model){
        List<Books> booksList = bookService.getAllBooks();
        model.addAttribute("books", booksList);
        return "allBooks";
    }

    @RequestMapping(value = "/toCreatePage")
    public String toCreatePage(){
        return "createBook";
    }

    @RequestMapping(value = "/addBook")
    public String addBook(Books book){
        bookService.addBook(book);
        return "redirect:/book/getAll";
    }

    @RequestMapping(value = "/toEditPage")
    public String toEditPage(Model model, int id){
        Books book = bookService.getBookById(id);
        model.addAttribute("book", book);
        return "editBook";
    }

    @RequestMapping(value = "/editBook")
    public String editBook(Books book){
        //System.out.println(book);
        bookService.editBook(book);
        return "redirect:/book/getAll";
    }

    @RequestMapping(value = "/deleteBook")
    public String deleteBook(int id){
        bookService.deleteBook(id);
        return "redirect:/book/getAll";
    }
}
