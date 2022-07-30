package com.nhasach.be.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;

@Entity
@Getter
@Setter
@NoArgsConstructor
@JsonIgnoreProperties({"carts"})
public class Customer {
    @Id
    @GeneratedValue(generator = "customer-id-generator")
    @GenericGenerator(name = "customer-id-generator",
        parameters = @org.hibernate.annotations.Parameter(name = "prefix", value = "CS"),
        strategy = "com.nhasach.be.utils.IdentityCodeGenerator")
    private String customerId;
    private String name;
    private String dateOfBirth;
    private String phone;
    private String email;
    private String address;
    private Boolean gender;
    @OneToOne
    @JoinColumn(name = "customer_username", referencedColumnName = "username")
    private Users customerUsername;
    @OneToMany(mappedBy = "customer")
    private List<Cart> carts;
}
