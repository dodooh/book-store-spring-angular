package com.nhasach.be.model;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;

@Entity
@Getter
@Setter
@NoArgsConstructor
@JsonIgnoreProperties({"cartDetailList", "flag"})

public class Book {
    @Id
    @GeneratedValue(generator = "book-id-generator")
    @GenericGenerator(name = "book-id-generator",
        parameters = @org.hibernate.annotations.Parameter(name = "prefix", value = "BK"),
        strategy = "com.nhasach.be.utils.IdentityCodeGenerator")
    private String bookId;
    private String name;
    private String code;
    private String translator;
    private Integer totalPage;
    private Double price;
    private Integer quantity;
    @Column(columnDefinition = "LONGTEXT")
    private String description;
    private String dimension;
    private String publisherDate;
    private String img;
    private Boolean flag = true;

    @ManyToOne
    @JoinColumn(name = "author_id", referencedColumnName = "authorId")
    private Author author;

    @ManyToOne
    @JoinColumn(name = "publisher_id", referencedColumnName = "publisherId")
    private Publisher publisher;

    @ManyToOne
    @JoinColumn(name = "category_id", referencedColumnName = "categoryId")
    private Category category;

    @OneToMany(mappedBy = "book")
    private List<CartDetail> cartDetailList;

    @Override
    public String toString() {
        return "Book{" + "bookId='" + bookId + '\'' + ", name='" + name + '\'' + ", code='" + code + '\'' + ", translator='" + translator + '\''
            + ", totalPage=" + totalPage + ", price=" + price + ", quantity=" + quantity + ", description='" + description + '\'' + ", dimension='"
            + dimension + '\'' + ", publisherDate='" + publisherDate + '\'' + ", img='" + img + '\'' + ", flag=" + flag + '}';
    }
}
