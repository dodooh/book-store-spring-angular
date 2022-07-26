package com.nhasach.be.service.impl;

import com.nhasach.be.model.Book;
import com.nhasach.be.repository.IBookRepository;
import com.nhasach.be.service.IBookService;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class BookService implements IBookService {
    @Autowired
    private IBookRepository bookRepository;

    @Override
    public Page<Book> findAll(String keyword, Pageable pageable) {
        return this.bookRepository.findAllByNameContaining(keyword, pageable);
    }

    @Override
    public Optional<Book> findById(String bookId) {
        return this.bookRepository.findById(bookId);
    }
}
