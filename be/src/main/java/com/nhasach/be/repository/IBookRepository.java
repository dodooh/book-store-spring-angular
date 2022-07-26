package com.nhasach.be.repository;

import com.nhasach.be.model.Book;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IBookRepository extends JpaRepository<Book, String> {

    Page<Book> findAllByNameContaining(String keyword, Pageable pageable);
}
