package genre_movies;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

import java.util.List;

public class GenreMovieMain {
    static EntityManagerFactory factory = Persistence.createEntityManagerFactory("default");
    static EntityManager manager = factory.createEntityManager();

    public static void main(String[] args) {
        List<Movie> movies = manager.createQuery("select m from Movie m", Movie.class).getResultList();
//        movies.forEach(movie -> System.out.println(movie.getTitle() + " " + movie.getGenres()));
        List<Integer> genreIds = List.of(1, 11, 12);
        addGenresToMovie(74,genreIds);
        manager.close();
        factory.close();
    }

    static void addGenresToMovie(int movieId, List<Integer> genresId) {
        try {
            Movie movie = manager.find(Movie.class, movieId);
            manager.getTransaction().begin();
            for (Integer i : genresId) {
                Genre genre = manager.find(Genre.class, i);
                if (genre != null) {
                    genre.getMovies().add(movie);
                    movie.getGenres().add(genre);
                }
                manager.merge(genre);

            }
            manager.merge(movie);
            manager.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

    }
}


