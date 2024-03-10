package org.example.cinemamanagement.Entity;

import jakarta.persistence.*;
import org.example.cinemamanagement.Const.CountryConst;
import org.springframework.lang.NonNull;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "countries")
public class Country {
    public Country() {
        films = new ArrayList<>();
    }

    @Id
    @Column(name = "country_code", nullable = false, length = CountryConst.MAX_LENGTH_COUNTRY_CODE)
    private String countryCode;

    @Column(name = "country_name", nullable = false, length = CountryConst.MAX_LENGTH_COUNTRY_NAME)
    private String countryName;

    @OneToMany(cascade = CascadeType.ALL)
    private List<Film> films;

    public Country(@NonNull String countryCode, @NonNull String countryName) {
        this.countryCode = countryCode;
        this.countryName = countryName;
    }

    @NonNull
    public String getCountryCode() {
        return countryCode;
    }

    public void setCountryCode(@NonNull String countryCode) {
        this.countryCode = countryCode;
    }

    @NonNull
    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(@NonNull String countryName) {
        this.countryName = countryName;
    }
    @NonNull
    public List<Film> getFilms() {
        return films;
    }

    public void setFilms(@NonNull List<Film> films) {
        this.films = films;
    }
}
