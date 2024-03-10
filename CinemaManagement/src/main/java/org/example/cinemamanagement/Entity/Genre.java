package org.example.cinemamanagement.Entity;

import jakarta.persistence.*;
import org.example.cinemamanagement.Const.GenreConst;
import org.springframework.lang.NonNull;

import java.util.*;

@Entity
@Table(name = "genres")
public class Genre {
    public Genre() {
        films = new ArrayList<>();
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "genre_id", nullable = false)
    private int genreId;

    @Column(name = "name", nullable = false, length = GenreConst.MAX_LENGTH_NAME)
    private String name;

    @OneToMany(cascade = CascadeType.ALL)
    private List<Film> films;

    public Genre(@NonNull String name) {
        this.name = name;
    }

    public int getGenreId() {
        return genreId;
    }

    public void setGenreId(int genreId) {
        this.genreId = genreId;
    }

    @NonNull
    public String getName() {
        return name;
    }

    public void setName(@NonNull String name) {
        this.name = name;
    }

    public List<Film> getFilms() {
        return films;
    }

    public void setFilms(List<Film> films) {
        this.films = films;
    }
}
