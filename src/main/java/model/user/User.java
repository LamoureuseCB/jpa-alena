package model.user;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import model.orders.Order;
import model.review.Review;


import java.time.LocalDate;
import java.util.List;

@Getter
@Setter
@Table(name = "users")
@Entity
@ToString
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Enumerated
    private Role role;

    private String login;

    private String password;

    private LocalDate created;
    @OneToMany(mappedBy = "user")
    @ToString.Exclude
    private List<Review> reviewList;

    @OneToMany(mappedBy = "user")
    @ToString.Exclude
    private List<Order> orderList;
}
