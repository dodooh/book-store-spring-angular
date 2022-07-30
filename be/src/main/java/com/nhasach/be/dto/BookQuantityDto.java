package com.nhasach.be.dto;

import com.nhasach.be.model.Book;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class BookQuantityDto {
    private Book book;
    private Integer quantity;
}
