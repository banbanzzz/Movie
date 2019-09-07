package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.entity.Movie;

@Repository
public interface MovieMapper {
	Movie findMovieById(long movie_id);
	Movie findMovieByName(String movie_cn_name);
	Integer addMovie(Movie movie);
	Integer deleteMovie(long movie_id);
	Integer updateMovie(Movie movie);
	Integer deleteMovieCommentCount(long movie_id);
	Integer addMovieCommentCount(long movie_id);
	Integer changeMovieBoxOffice(@Param("movie_boxOffice")float movie_boxOffice,@Param("movie_id")long movie_id);
	List<Movie> findAllMovies(int movie_state);
	List<Movie> findMoviesLikeName(String name);
	List<Movie> findMoviesLikeType(String type);
	//上映时间  参评人数  评分
	List<Movie> sortMovieByDate();
	List<Movie> sortMovieByCount();
	List<Movie> sortMovieByScore();
	//票房排序
	List<Movie> sortMovieByBoxOffice();
}
