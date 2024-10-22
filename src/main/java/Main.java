import jakarta.persistence.*;
import model.Product;
import model.orders.Order;
import model.orders.Status;
import model.user.Role;
import model.user.User;

import java.time.LocalDate;
import java.util.List;


public class Main {
    public static void main(String[] args) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("default");
        EntityManager manager = factory.createEntityManager();

        User user = new User();
        user.setLogin("firstUser");
        user.setPassword("firstUser");
        user.setRole(Role.USER);
        user.setCreated(LocalDate.now());



        try {
            manager.getTransaction().begin();
            manager.persist(user);
            manager.getTransaction().commit();
        } catch (Exception e) {
            manager.getTransaction().rollback();
            System.out.println(e.getMessage());

        }


        Order order1 = new Order();
        order1.setStatus(Status.CREATED);
        order1.setAdress("Astana");
        order1.setCreated(LocalDate.now());




        Order order2 = new Order();
        order2.setStatus(Status.CREATED);
        order2.setAdress("Almaty");
        order2.setCreated(LocalDate.now());
        order2.setStatus(Status.IN_DELIVERY);
        try {
            manager.getTransaction().begin();
            manager.persist(order1);
            manager.persist(order2);
            manager.merge(order2);
            manager.getTransaction().commit();
        } catch (Exception e) {
            manager.getTransaction().rollback();
            System.out.println(e.getMessage());

        }

    }


}

