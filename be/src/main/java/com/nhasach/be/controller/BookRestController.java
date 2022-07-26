package com.nhasach.be.controller;

import com.nhasach.be.model.Book;
import com.nhasach.be.service.IBookService;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin
@RequestMapping("api/books")
public class BookRestController {

    @Autowired
    private IBookService bookService;

    @GetMapping("")
    public ResponseEntity<?> getList(@RequestParam Optional<Integer> page, @RequestParam Optional<Integer> size, @RequestParam Optional<String> sort,
        @RequestParam Optional<String> dir, @RequestParam Optional<String> keyword)
    {
        Direction direction = Direction.ASC;
        if (dir.isPresent() && "desc".equals(dir.get())) {
            direction = Direction.DESC;
        }
        String sortField = sort.orElse("bookId");
        Sort sortRequest = Sort.by(direction, sortField);
        Page<Book> bookPage = this.bookService.findAll(keyword.orElse(""), PageRequest.of(page.orElse(0), size.orElse(5), sortRequest));
        return new ResponseEntity<>(bookPage, HttpStatus.OK);
    }

    @GetMapping("{bookID}")
    public ResponseEntity<?> findById(@PathVariable("bookID") String bookId)
    {
        Optional<Book> book = this.bookService.findById(bookId);
        if (book.isPresent()) {
            return new ResponseEntity<>(book.get(), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping("relatives/{bookID}")
    public ResponseEntity<?> get20Relatives(@PathVariable("bookID") String bookId)
    {
        Optional<Book> book = this.bookService.findById(bookId);
        if (book.isPresent()) {
            Set<Book> bookByAuthor = book.get().getAuthor().getBookSet();
            Set<Book> bookByCategory = book.get().getCategory().getBookSet();
            bookByCategory.addAll(bookByAuthor);
            bookByCategory.remove(book.get());
            return new ResponseEntity<>(bookByCategory, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

}
