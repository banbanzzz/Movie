package com.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.entity.Comment;

@Repository
public interface CommentMapper {
	//用户： 修改评论、增加评论
	//管理员： 删除评论、 修改评论
	//查询用户的评论
	Comment findCommentById(long comment_id);
	Integer addComemnt(Comment comment);
	Integer updateComment(Comment comment);
	Integer deleteComment(long comment_id);
	List<Comment> findAllComments();
	List<Comment> findCommentsByMoiveId(long movie_id);
	List<Comment> findCommentsByUserName(String user_name);
}
