package com.service.imp;	

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.entity.Comment;
import com.entity.Movie;
import com.mapper.CommentMapper;
import com.mapper.MovieMapper;
import com.mapper.UserMapper;
import com.service.IMovieService;

@Service
public class MovieServiceImp implements IMovieService{
	@Autowired
	private MovieMapper movieMapper;
	@Autowired
	private CommentMapper commentMapper;
	@Autowired
	private UserMapper userMapper;

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public Movie findMovieById(long movie_id) {
		Movie movie = this.movieMapper.findMovieById(movie_id);
		List<Comment> list = this.commentMapper.findCommentsByMoiveId(movie_id);
		for(Comment comment : list) {
			comment.setComment_user(this.userMapper.findUserById(comment.getUser_id()));
		}
		movie.setCommentList(list);
		return movie;
	}
	
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public Integer changeMovieBoxOffice(float price, long movie_id) {
		return this.movieMapper.changeMovieBoxOffice(price, movie_id);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public Movie findMovieByName(String movie_cn_name) {
		return this.movieMapper.findMovieByName(movie_cn_name);
	}

	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public Integer addCommentCount(long movie_id) {
		return this.movieMapper.addMovieCommentCount(movie_id);
	}
	
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public Integer delCommentCount(long movie_id) {
		return this.movieMapper.deleteMovieCommentCount(movie_id);
	}

	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public Integer addMovie(Movie movie) {
		return this.movieMapper.addMovie(movie);
	}

	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public Integer deleteMovie(long movie_id) {
		return this.movieMapper.deleteMovie(movie_id);
	}

	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public Integer updateMovie(Movie movie) {
		return this.movieMapper.updateMovie(movie);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<Movie> findAllMovies(int movie_state) {
		return this.movieMapper.findAllMovies(movie_state);
	}
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<Movie> findMoviesLikeName(String name) {
		return this.movieMapper.findMoviesLikeName(name);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<Movie> findMoviesLikeType(String type) {
		return this.movieMapper.findMoviesLikeType(type);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<Movie> sortMovieByDate() {
		return this.movieMapper.sortMovieByDate();
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<Movie> sortMovieByCount() {
		return this.movieMapper.sortMovieByCount();
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<Movie> sortMovieByScore() {
		return this.movieMapper.sortMovieByScore();
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<Movie> sortMovieByBoxOffice() {
		return this.movieMapper.sortMovieByBoxOffice();
	}
	
	
}
