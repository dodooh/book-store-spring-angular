package com.nhasach.be.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
public class UserRole {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer userRoleId;

    @ManyToOne
    @JoinColumn(name = "username", referencedColumnName = "username")
    private Users users;
    @ManyToOne
    @JoinColumn(name = "role", referencedColumnName = "roleId")
    private Roles roles;

    public UserRole(Users users, Roles roles) {
        this.users = users;
        this.roles = roles;
    }
}
