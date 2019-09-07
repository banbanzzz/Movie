package com.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.entity.Cinema;

@Repository
public interface CinemaMapper {
	Cinema findCinemaById(long cinema_id);
	Integer addCinema(Cinema cinema);
	Integer updateCinema(Cinema cinema);
	Integer deleteCinema(long cinema_id);
	List<Cinema> findAllCinemas();
	List<Cinema> findCinemasLikeName(String cinema_name);
	List<Cinema> findCinemasByMovieId(long movie_id);
}
