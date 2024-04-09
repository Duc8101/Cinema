package org.example.cinemamanagement.Entity;

import jakarta.persistence.*;
import org.example.cinemamanagement.Const.FilmConst;
import org.springframework.lang.NonNull;

import java.util.*;

@Entity
@Table(name = "films")
public class Film {
    public Film() {
        shows = new ArrayList<>();
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "film_id", nullable = false)
    private int filmId;

    @Column(name = "title", nullable = false, columnDefinition = "nvarchar(" + FilmConst.MAX_LENGTH_TITLE + ")")
    private String title;

    @Column(name = "year", nullable = false)
    private int year;

    @ManyToOne
    @JoinColumn(name = "genre_id")
    private Genre genre;

    @ManyToOne
    @JoinColumn(name = "country_code", columnDefinition = "nchar(" + FilmConst.MAX_LENGTH_COUNTRY_CODE + ")")
    private Country country;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "film")
    private List<Show> shows;

    public int getFilmId() {
        return filmId;
    }

    public void setFilmId(int filmId) {
        this.filmId = filmId;
    }

    @NonNull
    public String getTitle() {
        return title;
    }

    public void setTitle(@NonNull String title) {
        this.title = title;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    @NonNull
    public Genre getGenre() {
        return genre;
    }

    public void setGenre(@NonNull Genre genre) {
        this.genre = genre;
    }

    @NonNull
    public Country getCountry() {
        return country;
    }

    public void setCountry(@NonNull Country country) {
        this.country = country;
    }

    @NonNull
    public List<Show> getShows() {
        return shows;
    }

    public void setShows(@NonNull List<Show> shows) {
        this.shows = shows;
    }
}
