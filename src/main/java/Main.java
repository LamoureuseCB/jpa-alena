import jakarta.persistence.*;
import model.Category;

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

        Scanner scanner = new Scanner(System.in);
        System.out.println("Введите название категории:");
        String categoryName = scanner.nextLine();

        TypedQuery<Category> typedQuery = manager.createQuery(("select c from Category c where c.name = ?1"), Category.class);
        typedQuery.setParameter(1, "Наушники");
        List<Category> categories = typedQuery.getResultList();
        if (categories.isEmpty()) {
            Category headPhone = new Category();
            headPhone.setName("Наушники");
            try {
                manager.getTransaction().begin();
                manager.persist(headPhone);
                manager.getTransaction().commit();
                System.out.println("Категория " + categoryName + "успешно добавлена");
            } catch (Exception e) {
                manager.getTransaction().rollback();
                System.out.println("Ошибка при добавлении новой категории " + e.getMessage());
            }
        } else {
            System.out.println("Категория " + categoryName + " уже существует");
        }
    }
}

