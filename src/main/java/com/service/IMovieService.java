package com.service;

import java.util.List;

import com.entity.Movie;

public interface IMovieService {
	Movie findMovieById(long movie_id);
	Movie findMovieByName(String movie_cn_name);
	Integer addMovie(Movie movie);
	Integer deleteMovie(long movie_id);
	Integer updateMovie(Movie movie);
	Integer delCommentCount(long movie_id);
	Integer changeMovieBoxOffice(float price,long movie_id);
	Integer addCommentCount(long movie_id);
	List<Movie> findAllMovies(int movie_state);
	List<Movie> findMoviesLikeName(String name);
	List<Movie> findMoviesLikeType(String type);
	//上映时间  参评人数  评分
	List<Movie> sortMovieByDate();
	List<Movie> sortMovieByCount();
	List<Movie> sortMovieByScore();
	List<Movie> sortMovieByBoxOffice();
}
