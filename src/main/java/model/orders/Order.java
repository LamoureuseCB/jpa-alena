package model.orders;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import model.Product;
import model.Value;

import java.time.LocalDate;
import java.util.List;

@Getter
@Setter
@ToString
@Entity
@Table(name = "orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Enumerated
    private Status status;

    private String adress;
    private LocalDate created;
    @OneToMany(mappedBy = "order")
    private List<OrderProduct> orderProducts;

}
