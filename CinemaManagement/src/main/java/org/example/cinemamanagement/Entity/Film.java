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

    @Column(name = "genre_id", nullable = false)
    private int genreId;

    @Column(name = "title", nullable = false, length = FilmConst.MAX_LENGTH_TITLE)
    @NonNull
    private String title;

    @Column(name = "year", nullable = false)
    private int year;

    @Column(name = "country_code", nullable = false, length = FilmConst.MAX_LENGTH_COUNTRY_CODE)
    private String countryCode;

    @ManyToOne
    private Genre genre;

    @ManyToOne
    private Country country;

    @OneToMany(cascade = CascadeType.ALL)
    private List<Show> shows;

    public Film(int genreId, @NonNull String title, int year, @NonNull String countryCode) {
        this.genreId = genreId;
        this.title = title;
        this.year = year;
        this.countryCode = countryCode;
    }

    public int getFilmId() {
        return filmId;
    }

    public void setFilmId(int filmId) {
        this.filmId = filmId;
    }

    public int getGenreId() {
        return genreId;
    }

    public void setGenreId(int genreId) {
        this.genreId = genreId;
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
    public String getCountryCode() {
        return countryCode;
    }

    public void setCountryCode(@NonNull String countryCode) {
        this.countryCode = countryCode;
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
