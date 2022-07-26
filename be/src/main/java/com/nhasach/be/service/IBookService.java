package com.nhasach.be.service;

import com.nhasach.be.model.Book;
import java.util.Optional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface IBookService {

    Page<Book> findAll(String keyword, Pageable pageable);

    Optional<Book> findById(String bookId);
}
