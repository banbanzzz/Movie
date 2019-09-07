package com.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.alibaba.fastjson.JSONObject;
import com.entity.Comment;
import com.entity.User;
import com.github.pagehelper.PageInfo;
import com.service.ICommentService;
import com.service.IMovieService;
import com.service.IUserService;

/**
 *  评论管理模块
 * @author Wxj
 */
@Controller
@RequestMapping("/comment")
public class CommentController {

	@Resource
	private ICommentService commentService;
	@Resource
	private IUserService userService;
	@Resource
	private IMovieService movieService;
	//用户： 修改评论、增加评论
		//管理员：x 删除评论、 修改评论
		//x查询用户的评论
	@RequestMapping("findAllComments")
	@ResponseBody
	public JSONObject findAllComments() {
		JSONObject obj = new JSONObject();
		List<Comment> list = commentService.findAllComments();
		for(Comment comment: list) {
			comment.setComment_user(userService.findUserById(comment.getUser_id()));
		}
		obj.put("code", 0);
		obj.put("msg","");
		obj.put("count", list.size());
		obj.put("data", list);
		return obj;
	}
	//测试 info.getTotal
	@RequestMapping("findAllCommentsPage")
	@ResponseBody
	public JSONObject findAllCommentsPage(@RequestParam(value="page",defaultValue="1")Integer page,@RequestParam(value="limit",defaultValue="10")Integer limit,String keyword) {
		PageInfo<Comment> info = commentService.findAllCommentsBySplitPage(page, limit, keyword);
		//System.out.println(info);
		for(Comment comment : info.getList()) {
			comment.setComment_user(userService.findUserById(comment.getUser_id()));
		}
		JSONObject obj = new JSONObject();
		obj.put("code", 0);
		obj.put("msg", "");
		obj.put("count", info.getTotal());
		obj.put("data", info.getList());
		return obj;
	}
	
	@RequestMapping("addCommentByUser")
	@ResponseBody
	public JSONObject addCommentByUser(@RequestParam("movie_id")long movie_id,@RequestParam("comment_content")String comment_content,HttpServletRequest request) {
		User user = (User)request.getSession().getAttribute("user");
		JSONObject obj = new JSONObject();
		if(user == null) {
			obj.put("code",200);
			obj.put("msg", "您未登录,登录之后才可评论~");
		}else {
			Comment comment = new Comment();
			comment.setComment_content(comment_content);
			comment.setMovie_id(movie_id);
			comment.setUser_id(user.getUser_id());
			comment.setComment_time(new Date());
			Integer rs = commentService.addComemnt(comment);
			if(rs > 0) {
				Integer rs2 = movieService.addCommentCount(comment.getMovie_id());
				if(rs2 > 0) {
					obj.put("code", 0);
					obj.put("msg", "评论成功~");
				}else {
					obj.put("code",200);
					obj.put("msg", "评论失败2~");
				}
			}else {
				obj.put("code",200);
				obj.put("msg", "评论失败~");
			}
		}
		return obj;
	}
	
	@RequestMapping("updateComment")
	@ResponseBody
	public JSONObject updateComment(@RequestParam("comment_id")long comment_id,@RequestParam("comment_content")String comment_content) {
		JSONObject obj = new JSONObject();
		Comment comment = this.commentService.findCommentById(comment_id);
		comment.setComment_time(new Date());
		comment.setComment_content(comment_content);
		Integer rs = commentService.updateComment(comment);
		if(rs > 0) {
			obj.put("code", 0);
			obj.put("msg", "修改成功~");
		}else {
			obj.put("code",200);
			obj.put("msg", "修改失败~");
		}
		return obj;
	}
	
	@RequestMapping("deleteComemnt")
	@ResponseBody
	public JSONObject deleteComment(@RequestParam("comment_id")long comment_id) {
		JSONObject obj = new JSONObject();
		Integer rs2 = movieService.delCommentCount(commentService.findCommentById(comment_id).getMovie_id());
		Integer rs = commentService.deleteComment(comment_id);
		if(rs > 0) {
			obj.put("code", 0);
			obj.put("msg", "删除成功~");
		}else {
			obj.put("code", 200);
			obj.put("msg", "删除失败~");
		}
		return obj;
	}
	
	@RequestMapping("findCommentsByUserName")
	@ResponseBody
	public JSONObject findCommentsByUserName(@RequestParam(value="page",defaultValue="1")Integer page,@RequestParam(value="limit",defaultValue="10")Integer limit,@RequestParam("user_name")String user_name) {
		PageInfo<Comment> info = commentService.findCommentsByUserName(page, limit, user_name);
		//System.out.println(info);
		for(Comment comment : info.getList()) {
			comment.setComment_user(userService.findUserById(comment.getUser_id()));
		}
		JSONObject obj = new JSONObject();
		obj.put("code", 0);
		obj.put("msg", "");
		obj.put("count", info.getTotal());
		obj.put("data", info.getList());
		return obj;
	}
}
