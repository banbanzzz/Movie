package com.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.entity.User;
import com.github.pagehelper.PageInfo;
import com.service.IUserService;
import com.util.UUIDUtil;
/**
 * 用户管理模块 
 * update: 2019年7月9日17:18:50 
 * @author Wxj
 */
@Controller
@RequestMapping("/user")
public class UserController {
	//@Autowired
	@Resource
	private IUserService userService;
	
	@RequestMapping("login")
	@ResponseBody
	public JSONObject login(String user_name,String user_pwd,HttpServletRequest request) {
		JSONObject obj = new JSONObject();
		User user = userService.login(user_name, user_pwd);
		if(user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			if(user.getUser_role() == 0) {
				obj.put("msg", "usersuccess");
				obj.put("data", user);
				return obj;
			}else {
				obj.put("msg", "adminsuccess");
				obj.put("data", user);
				return obj;
			}
		}
		obj.put("msg", "fail");
		return obj;
	}
	
	@RequestMapping("logout")
	@ResponseBody
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		return "index";
	}
	
	@RequestMapping("register")
	@ResponseBody
	public String register(User user) {
		List<User> list = userService.findUserByName(user.getUser_name());
		if(list.size() > 0) {
			return "fail";
		}else {
			Integer rs = userService.addUser(user);
			if(rs > 0) {
				return "success";
			}else {
				return "fail";
			}
		}
	}
	
	@RequestMapping("updateUser")
	@ResponseBody
	public String updateUser(User user) {
		Integer rs = userService.updateUserInfo(user);
		if(rs > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@RequestMapping("modifyUserPwd")
	@ResponseBody
	public String modifyUserPwd(@RequestParam("oldPwd")String oldPwd,@RequestParam("newPwd")String newPwd,HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		if(user.getUser_pwd().equals(oldPwd)) {
			user.setUser_pwd(newPwd);
			userService.updateUserInfo(user);
			session.removeAttribute("user");
			return "success";
		}else {
			return "fail";
		}
	}
	
	@RequestMapping("findAllUser")
	@ResponseBody
	public JSONObject findAllUser(@RequestParam(value="page",defaultValue="1")Integer page,@RequestParam(value="limit",defaultValue="10")Integer limit,String keyword) {
		PageInfo<User> info = userService.findAllUserBySplitPage(page, limit, keyword);
		JSONObject obj = new JSONObject();
		obj.put("msg", "");
		obj.put("code", 0);
		obj.put("count", info.getTotal());
		obj.put("data", info.getList());
		return obj;
	}
	
	@RequestMapping("findAllUserInfos")
	@ResponseBody
	public JSONObject findAllUserInfos() {
		JSONObject obj = new JSONObject();
		List<User> list = userService.findAllUserInfos();
		obj.put("msg","");
		obj.put("code",0);
		obj.put("count",list.size());
		obj.put("data", list);
		return obj;
	}
	
	@RequestMapping("findUserInfosByName")
	@ResponseBody
	public JSONObject findUserInfosByName(@RequestParam("user_name")String user_name) {
		JSONObject obj = new JSONObject();
		List<User> list = userService.findUserLikeName(user_name);
		obj.put("msg","");
		obj.put("code",0);
		obj.put("count",list.size());
		obj.put("data", list);
		return obj;
	}

	@RequestMapping("/uploadHeadImg")
	@ResponseBody
	public JSONObject uploadHeadImg(@RequestParam(value="file",required=false) MultipartFile file,User user,HttpServletRequest request) throws IOException {
		JSONObject obj = new JSONObject();
		if(file != null) {
			String str = file.getOriginalFilename();
			System.out.println("file:"+str);
			String name = UUIDUtil.getUUID() + str.substring(str.lastIndexOf("."));
			System.out.println("name:"+name);
			String path = request.getServletContext().getRealPath("/upload/head") + "/" + name;
			System.out.println("path:"+path);
			String filePath = "../upload/head/" + name;
			user.setUser_headImg(filePath);
			file.transferTo(new File(path));  
			System.out.println("文件写入成功,Path:" + path);
		}else {
			user.setUser_headImg(this.userService.findUserById(user.getUser_id()).getUser_headImg());
			user.setUser_pwd(this.userService.findUserById(user.getUser_id()).getUser_pwd());
		}
		Integer rs = userService.updateUserInfo(user);
		if(rs > 0) {
			obj.put("code", 0);
			obj.put("msg", "");
			obj.put("data",user);
		}else {
			obj.put("code", 200);
			obj.put("msg", "");
		}
		return obj;
	}
	
	/**
	 * 测试Api
	 * @param file
	 * @param user_name
	 * @param request
	 * @return
	 */
	@RequestMapping("test")
	@ResponseBody
	public JSONObject uploadImg(@RequestParam(value="file",required=false) MultipartFile file,@RequestParam("user_name")String user_name,HttpServletRequest request) {
		System.out.println(file);
		JSONObject obj = new JSONObject();
		if(file == null) {
			System.out.println("null");
		}else {
			String str = file.getOriginalFilename();
			System.out.println("file:"+str);
			String name = UUIDUtil.getUUID() + str.substring(str.lastIndexOf("."));
			System.out.println("name:"+name);
			String path = request.getServletContext().getRealPath("/upload/head") + "/" + name;
			System.out.println("path:"+path);
			String filePath = "upload/head/" + name;
			System.out.println(filePath);
			try {
				file.transferTo(new File(path));	
				System.out.println("文件写入成功,Path:" + path);
			}catch(IOException ex) {
				ex.printStackTrace();
			}
			obj.put("file", name);
			obj.put("user_name",user_name);
		}
		return obj;
	}
}
