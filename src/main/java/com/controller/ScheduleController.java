package com.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.entity.Cinema;
import com.entity.Hall;
import com.entity.Movie;
import com.entity.Order;
import com.entity.Schedule;
import com.github.pagehelper.PageInfo;
import com.service.ICinemaService;
import com.service.IHallService;
import com.service.IMovieService;
import com.service.IScheduleService;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	@Resource
	private IScheduleService scheduleService;
	@Resource
	private IMovieService movieService;
	@Resource
	private ICinemaService cinemaService;
	@Resource
	private IHallService hallService;
	
	@RequestMapping("findScheduleById")
	@ResponseBody
	public JSONObject findScheduleById(@RequestParam("schedule_id")long schedule_id) {
		JSONObject obj = new JSONObject();
		Schedule schedule = scheduleService.findScheduleById(schedule_id);
		obj.put("code", 0);
		obj.put("data",schedule);
		return obj;
	}
	
	@RequestMapping("findAllScheduleByState")
	@ResponseBody
	public JSONObject findAllScheduleByState(@RequestParam(value="page",defaultValue="1")Integer page,@RequestParam(value="limit",defaultValue="10")Integer limit,@RequestParam("schedule_state")int schedule_state) {
		JSONObject obj = new JSONObject();
		PageInfo<Schedule> info = scheduleService.findAllScheduleByState(page, limit, schedule_state);
		ArrayList<Integer> incomeArr = new ArrayList<Integer>();
		for(int j = 0;j < info.getList().size();j++) {
			List<Order> orderList = info.getList().get(j).getOrderList();
			int income = 0;
			for(int i = 0;i < orderList.size();i++) {
				income += orderList.get(i).getOrder_price();
			}
			incomeArr.add(income);
		}
		obj.put("code", 0);
		obj.put("count", info.getTotal());
		obj.put("data", info.getList());
		obj.put("income", incomeArr);
		return obj;
	}
	
	@RequestMapping("findAllSchedule")
	@ResponseBody
	public JSONObject findAllSchedule(@RequestParam(value="page",defaultValue="1")Integer page,@RequestParam(value="limit",defaultValue="10")Integer limit) {
		JSONObject obj = new JSONObject();
		PageInfo<Schedule> info = scheduleService.findAllSchedule(page, limit);
		List<Movie> movieList = movieService.findAllMovies(1);
		List<Cinema> cinemaList = cinemaService.findAllCinemas();
		ArrayList<String> movieArr = new ArrayList<String>();
		ArrayList<Integer> incomeArr = new ArrayList<Integer>();
		for(int j = 0;j < info.getList().size();j++) {
			List<Order> orderList = info.getList().get(j).getOrderList();
			int income = 0;
			for(int i = 0;i < orderList.size();i++) {
				income += orderList.get(i).getOrder_price();
			}
			incomeArr.add(income);
		}
		for(int i = 0;i < movieList.size();i++) {
			movieArr.add(movieList.get(i).getMovie_cn_name());
		}
		ArrayList<Object> cinema = new ArrayList<>();
		for(int i = 0;i < cinemaList.size();i++) {
			JSONObject cinemaObj = new JSONObject();
			List<Hall> hallList = hallService.findHallByCinemaId(cinemaList.get(i).getCinema_id());
			ArrayList<String> hallArr = new ArrayList<String>();
			for(int j = 0;j < hallList.size();j++) {
				hallArr.add(hallList.get(j).getHall_name());
			}
			cinemaObj.put(cinemaList.get(i).getCinema_name(), hallList);
			cinema.add(cinemaObj);
		}
		obj.put("code", 0);
		obj.put("count", info.getTotal());
		obj.put("data", info.getList());
		obj.put("movieName", movieArr);
		obj.put("cinema", cinema);
		obj.put("income", incomeArr);
		return obj;
	}
	
	@RequestMapping("findScheduleByMovieName")
	@ResponseBody
	public JSONObject findScheduleByMovieName(@RequestParam(value="page",defaultValue="1")Integer page,@RequestParam(value="limit",defaultValue="10")Integer limit,@RequestParam("movie_name")String movie_name) {
		JSONObject obj = new JSONObject();
		PageInfo<Schedule> info = scheduleService.findScheduleByMovieName(page,limit,movie_name);
		ArrayList<Integer> incomeArr = new ArrayList<Integer>();
		for(int j = 0;j < info.getList().size();j++) {
			List<Order> orderList = info.getList().get(j).getOrderList();
			int income = 0;
			for(int i = 0;i < orderList.size();i++) {
				income += orderList.get(i).getOrder_price();
			}
			incomeArr.add(income);
		}
		obj.put("code", 0);
		obj.put("count", info.getTotal());
		obj.put("data", info.getList());
		obj.put("income", incomeArr);
		return obj;
	}
	
	@RequestMapping("findOffScheduleByMovieName")
	@ResponseBody
	public JSONObject findOffScheduleByMovieName(@RequestParam(value="page",defaultValue="1")Integer page,@RequestParam(value="limit",defaultValue="10")Integer limit,@RequestParam("movie_name")String movie_name) {
		JSONObject obj = new JSONObject();
		PageInfo<Schedule> info = scheduleService.findOffScheduleByMovieName(page, limit, movie_name);
		ArrayList<Integer> incomeArr = new ArrayList<Integer>();
		for(int j = 0;j < info.getList().size();j++) {
			List<Order> orderList = info.getList().get(j).getOrderList();
			int income = 0;
			for(int i = 0;i < orderList.size();i++) {
				income += orderList.get(i).getOrder_price();
			}
			incomeArr.add(income);
		}
		obj.put("code", 0);
		obj.put("count", info.getTotal());
		obj.put("data", info.getList());
		obj.put("income", incomeArr);
		return obj;
	}
	
	@RequestMapping("findScheduleByCinemaAndMovie")
	@ResponseBody
	public JSONObject findScheduleByCinemaAndMovie(@RequestParam("cinema_id")long cinema_id,@RequestParam("movie_id")long movie_id) {
		JSONObject obj = new JSONObject();
		List<Schedule> list = scheduleService.findScheduleByCineamIdAndMovieId(cinema_id, movie_id);
		obj.put("code",0);
		obj.put("count",list.size());
		obj.put("data", list);
		return obj;
	}
	
	@RequestMapping("addSchedule")
	@ResponseBody
	public JSONObject addSchedule(@RequestParam("movie_name")String movie_name,@RequestParam("hall_name")String hall_name,@RequestParam("cinema_name")String cinema_name,
			@RequestParam("schedule_price")int schedule_price,@RequestParam("schedule_startTime")String schedule_startTime) {
		JSONObject obj = new JSONObject();
		Schedule schedule = new Schedule();
		Hall hall = this.hallService.findHallByCinemaAndHallName(cinema_name, hall_name);
		schedule.setMovie_id(this.movieService.findMovieByName(movie_name).getMovie_id());
		schedule.setHall_id(hall.getHall_id());
		schedule.setSchedule_price(schedule_price);
		schedule.setSchedule_startTime(schedule_startTime);
		schedule.setSchedule_remain(hall.getHall_capacity());
		Integer rs = this.scheduleService.addSchedule(schedule);
		if(rs > 0) {
			obj.put("code", 0);
			obj.put("mgs", "增加成功~");
		}else {
			obj.put("code", 200);
			obj.put("mgs", "增加失败~");
		}
		return obj;
	}
	
	@RequestMapping("updateSchedulePrice")
	@ResponseBody
	public JSONObject updateSchedulePrice(@RequestParam("schedule_id")long schedule_id,@RequestParam("schedule_price")int schedule_price) {
		JSONObject obj = new JSONObject();
		Schedule schedule = new Schedule();
		schedule.setSchedule_id(schedule_id);
		schedule.setSchedule_price(schedule_price);
		Integer rs = this.scheduleService.updateSchedule(schedule);
		if(rs > 0) {
			obj.put("code", 0);
			obj.put("mgs", "修改成功~");
		}else {
			obj.put("code", 200);
			obj.put("mgs", "修改失败~");
		}
		return obj;
	} 
	
	@RequestMapping("offlineSchedule")
	@ResponseBody
	public JSONObject offlineSchedule(@RequestParam("schedule_id")long schedule_id) {
		JSONObject obj = new JSONObject();
		Integer rs = this.scheduleService.deleteSchedule(schedule_id);
		if(rs > 0) {
			obj.put("code", 0);
			obj.put("mgs", "下架成功~");
		}else {
			obj.put("code", 200);
			obj.put("mgs", "下架失败~");
		}
		return obj;
	}
	
	
	
	
	/**
	 * 测试类Api 根据电影id找到所有放映该电影的影院列表
	 * @param movie_id
	 * @return
	 */
	@RequestMapping("findCinemasByMovieId")
	@ResponseBody
	public JSONObject findCinemasByMovieId(@RequestParam("movie_id")long movie_id) {
		JSONObject obj = new JSONObject();
		List<Cinema> list = this.cinemaService.findCinemasByMovieId(movie_id);
		obj.put("code", 0);
		obj.put("count", list.size());
		obj.put("data", list);
		return obj;
	}
	/**
	 * 测试专用api
	 */
	@RequestMapping("testHall")
	@ResponseBody
	public JSONObject testHall(@RequestParam("hall_name")String hall_name,@RequestParam("cinema_name")String cinema_name) {
		Hall hall = this.hallService.findHallByCinemaAndHallName(cinema_name, hall_name);
		JSONObject obj = new JSONObject();
		obj.put("data", hall);
		return obj;
	}
}
