import jakarta.persistence.*;
import model.Category;
import model.Option;
import model.Product;
import model.Value;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;


public class Main {
    public static void main(String[] args) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("default");
        EntityManager manager = factory.createEntityManager();

//        User user = new User();
//        user.setLogin("firstUser");
//        user.setPassword("firstUser");
//        user.setRole(Role.USER);
//        user.setCreated(LocalDate.now());
//
//        Product product1 = manager.find(Product.class, 1);
//        Product product2 = manager.find(Product.class, 2);
//
//        Order order = new Order();
//        order.setStatus(Status.CREATED);
//        order.setAdress("Astana");
//        order.setCreated(LocalDate.now());
//        order.setUser(user);
//
//        OrderProduct orderProduct1 = new OrderProduct();
//        orderProduct1.setProduct(product1);
//        orderProduct1.setQuantity(5);
//
//        OrderProduct orderProduct2 = new OrderProduct();
//        orderProduct2.setProduct(product2);
//        orderProduct2.setQuantity(3);
//
//        orderProduct1.setOrder(order);
//        orderProduct2.setOrder(order);
//
//        try {
//            manager.getTransaction().begin();
//            manager.persist(user);
//            manager.persist(order);
//            manager.persist(orderProduct1);
//            manager.persist(orderProduct2);
//            manager.getTransaction().commit();
//
//        } catch (Exception e) {
//            manager.getTransaction().rollback();
//            System.out.println(e.getMessage());
//        }

//        дз

        Scanner scanner = new Scanner(System.in);

        try {
            System.out.println("Введите ID товара:");
            int itemId = Integer.parseInt(scanner.nextLine());
            TypedQuery<Product> itemQuery = manager.createQuery(("select p from Product p where p.id = :id"), Product.class);
            itemQuery.setParameter("id", itemId);
            Product product = itemQuery.getSingleResult();
            Category itemCategory = product.getCategory();
            String itemName = product.getName();

            System.out.println("Введите название товара [" + itemName + "]:");
            String newItemName = scanner.nextLine();
            product.setName(newItemName);

            System.out.println("Введите стоимость товара [" + product.getPrice() + "]:");
            double newItemPrice = Double.parseDouble(scanner.nextLine());
            product.setPrice(newItemPrice);

            List<Value> itemValueList = new ArrayList<>();
            for (Option option : itemCategory.getOptionList()) {
                for (Value value : option.getValueList()) {
                    System.out.println(option.getName() + "[" + value.getName() + "]:");
                    String itemValue = scanner.nextLine();
                    Value newItemValue = new Value();
                    newItemValue.setName(itemValue);
                    newItemValue.setOption(option);
                    newItemValue.setProduct(product);
                    itemValueList.add(newItemValue);
                }
            }
            product.setValueList(itemValueList);

            manager.getTransaction().begin();
            manager.merge(product);
            manager.getTransaction().commit();
            System.out.println("Товар обновлён");
        } catch (Exception e) {
            manager.getTransaction().rollback();
            System.out.println("Ошибка при попытке обновления товара " + e.getMessage());
        }
    }
}


