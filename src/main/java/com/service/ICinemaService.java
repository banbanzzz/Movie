package com.service;

import java.util.List;

import com.entity.Cinema;

public interface ICinemaService {
	Cinema findCinemaById(long cinema_id);
	Integer addCinema(Cinema cinema);
	Integer updateCinema(Cinema cinema);
	Integer deleteCinema(long cinema_id);
	List<Cinema> findAllCinemas();
	List<Cinema> findCinemasLikeName(String cinema_name);
	List<Cinema> findCinemasByMovieId(long movie_id);
}
