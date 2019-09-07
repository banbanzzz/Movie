package com.service.imp;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.entity.Comment;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mapper.CommentMapper;
import com.service.ICommentService;

@Service
public class CommentServiceImp implements ICommentService{

	@Autowired
	private CommentMapper commentMapper;
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public Comment findCommentById(long comment_id) {
		return this.commentMapper.findCommentById(comment_id);
	}

	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public Integer addComemnt(Comment comment) {
		return this.commentMapper.addComemnt(comment);
	}

	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public Integer updateComment(Comment comment) {
		return this.commentMapper.updateComment(comment);
	}

	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public Integer deleteComment(long comment_id) {
		return this.commentMapper.deleteComment(comment_id);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<Comment> findAllComments() {
		return this.commentMapper.findAllComments();
	}
	
	
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public PageInfo<Comment> findAllCommentsBySplitPage(Integer page, Integer limit, String keyword) {
		PageHelper.startPage(page, limit);
		List<Comment> list = new ArrayList<Comment>();
		if(keyword != null && !keyword.trim().equals("")) {
			System.out.println("keyword:"+keyword);
			list = this.commentMapper.findCommentsByUserName(keyword);
		}else {
			//System.out.println("keyword:"+keyword);
			list = this.commentMapper.findAllComments();
		}
		PageInfo<Comment> info = new PageInfo<Comment>(list);
		return info;
	}
	
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public PageInfo<Comment> findCommentsByUserName(Integer page, Integer limit,String user_name) {
		PageHelper.startPage(page,limit);
		List<Comment> list = new ArrayList<Comment>();
		list = this.commentMapper.findCommentsByUserName(user_name);
		PageInfo<Comment> info = new PageInfo<Comment>(list);
		return info;
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<Comment> findCommentsByMovieId(long movie_id) {
		return this.commentMapper.findCommentsByMoiveId(movie_id);
	}

	
	
}
