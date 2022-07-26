package com.nhasach.be.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@JsonIgnoreProperties({"userRoleList", "customer", "password"})
public class Users {
    @Id
    @Column(columnDefinition = "VARCHAR(30)")
    private String username;
    private String password;
    @Column(columnDefinition = "BIT")
    private boolean flag = true;
    @OneToMany(mappedBy = "users", fetch = FetchType.EAGER)
    private List<UserRole> userRoleList;
    @OneToOne(mappedBy = "customerUsername")
    private Customer customer;

    public Users(String username, String password) {
        this.username = username;
        this.password = password;
    }
}
