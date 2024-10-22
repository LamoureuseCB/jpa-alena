import jakarta.persistence.*;
import model.Category;
import model.Product;

import java.util.List;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("default");
        EntityManager manager = factory.createEntityManager();


//        findAll
//        TypedQuery<Category> query = manager.createQuery("select c from Category c", Category.class);
//        List<Category> categoryList = query.getResultList();
//       categoryList.forEach(category -> System.out.println(categoryList));
//
////       findById
//        Category foundById = manager.find(Category.class,1);
//        System.out.println(foundById);
////        findByName
//       TypedQuery<Category> query1 = manager.createQuery(("select c from Category c where c.name = ?1"), Category.class);
//        query.setParameter(1, "Процессоры");
//        Category category = query.getSingleResult();

//        insert
//        Category category1 = new Category();
//        category1.setName("Phones");
//        try{
//            manager.getTransaction().begin();
//            manager.persist(category1);
//            manager.getTransaction().commit();
//        }catch(Exception e){
//            manager.getTransaction().rollback();
//            System.out.println(e.getMessage());
//
//        }

//        Scanner scanner = new Scanner(System.in);
//        System.out.println("Введите название категории:");
//        String categoryName = scanner.nextLine();
//
//        TypedQuery<Category> typedQuery = manager.createQuery(("select c from Category c where c.name = ?1"), Category.class);
//        typedQuery.setParameter(1, "Наушники");
//        List<Category> categories = typedQuery.getResultList();
//        if (categories.isEmpty()) {
//            Category headPhone = new Category();
//            headPhone.setName("Наушники");
//            try {
//                manager.getTransaction().begin();
//                manager.persist(headPhone);
//                manager.getTransaction().commit();
//                System.out.println("Категория " + categoryName + "успешно добавлена");
//            } catch (Exception e) {
//                manager.getTransaction().rollback();
//                System.out.println("Ошибка при добавлении новой категории " + e.getMessage());
//            }
//        } else {
//            System.out.println("Категория " + categoryName + " уже существует");
//        }


        Scanner scanner = new Scanner(System.in);
        TypedQuery<Category> query = manager.createQuery("select c from Category c", Category.class);
        List<Category> categoryList = query.getResultList();
        System.out.println("Выберите номер категории:");
        categoryList.forEach(category -> System.out.println(category.getId() + "." + category.getName()));
        int categoryId = Integer.parseInt(scanner.nextLine());
        Category productCategory = manager.find(Category.class, categoryId);
        if (productCategory == null) {
            return;
        }

        Product product = new Product();
        System.out.println("Введите название товара:");
        String productName = scanner.nextLine();
        product.setName(productName);

        System.out.println("Введите стоимость товара:");
        double productPrice = scanner.nextDouble();
        product.setPrice(productPrice);
        product.setCategory(productCategory);
        try {
            manager.getTransaction().begin();
            manager.persist(product);
            manager.getTransaction().commit();
        } catch (Exception e) {
            manager.getTransaction().rollback();
            System.out.println(e.getMessage());

        }


    }


}

