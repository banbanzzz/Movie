package com.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.entity.Hall;
import com.entity.Order;
import com.entity.Schedule;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mapper.CinemaMapper;
import com.mapper.HallMapper;
import com.mapper.MovieMapper;
import com.mapper.OrderMapper;
import com.mapper.ScheduleMapper;
import com.service.IScheduleService;

@Service
public class ScheduleServiceImp implements IScheduleService{
	@Autowired
	private ScheduleMapper scheduleMapper;
	@Autowired
	private HallMapper hallMapper;
	@Autowired
	private MovieMapper movieMapper;
	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private CinemaMapper cinemaMapper;
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public Schedule findScheduleById(long schedule_id) {
		Schedule schedule = this.scheduleMapper.findScheduleById(schedule_id);
		Hall hall = this.hallMapper.findHallById(schedule.getHall_id());
		hall.setHall_cinema(this.cinemaMapper.findCinemaById(hall.getCinema_id()));
		schedule.setSchedule_hall(hall);
		schedule.setSchedule_movie(this.movieMapper.findMovieById(schedule.getMovie_id()));
		List<Order> list = this.orderMapper.findOrdersByScheduleId(schedule_id);
		schedule.setOrderList(list);
		return schedule;
	}

	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public Integer addSchedule(Schedule schedule) {
		return this.scheduleMapper.addSchedule(schedule);
	}

	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public Integer updateSchedule(Schedule schedule) {
		return this.scheduleMapper.updateSchedule(schedule);
	}

	/**
	 * 场次下架功能 而非删除
	 */
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public Integer deleteSchedule(long schedule_id) {
		return this.scheduleMapper.deleteSchedule(schedule_id);
	}

	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public Integer addScheduleRemain(long schedule_id) {
		return this.scheduleMapper.addScheduleRemain(schedule_id);
	}

	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public Integer delScheduleRemain(long schedule_id) {
		return this.scheduleMapper.delScheduleRemain(schedule_id);
	}
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public PageInfo<Schedule> findScheduleByMovieName(Integer page,Integer limit,String movie_name) {
		PageHelper.startPage(page, limit);
		List<Schedule> schedules = this.scheduleMapper.findScheduleByMovieName(movie_name);
		for(Schedule schedule: schedules) {
			Hall hall = this.hallMapper.findHallById(schedule.getHall_id());
			hall.setHall_cinema(this.cinemaMapper.findCinemaById(hall.getCinema_id()));
			schedule.setSchedule_hall(hall);
			schedule.setSchedule_movie(this.movieMapper.findMovieById(schedule.getMovie_id()));
			List<Order> list = this.orderMapper.findOrdersByScheduleId(schedule.getSchedule_id());
			schedule.setOrderList(list);
		}
		PageInfo<Schedule> info = new PageInfo<Schedule>(schedules);
		return info;
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public PageInfo<Schedule> findOffScheduleByMovieName(Integer page, Integer limit, String movie_name) {
		PageHelper.startPage(page, limit);
		List<Schedule> schedules = this.scheduleMapper.findOffScheduleByMovieName(movie_name);
		for(Schedule schedule: schedules) {
			Hall hall = this.hallMapper.findHallById(schedule.getHall_id());
			hall.setHall_cinema(this.cinemaMapper.findCinemaById(hall.getCinema_id()));
			schedule.setSchedule_hall(hall);
			schedule.setSchedule_movie(this.movieMapper.findMovieById(schedule.getMovie_id()));
			List<Order> list = this.orderMapper.findOrdersByScheduleId(schedule.getSchedule_id());
			schedule.setOrderList(list);
		}
		PageInfo<Schedule> info = new PageInfo<Schedule>(schedules);
		return info;
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public PageInfo<Schedule> findAllScheduleByState(Integer page,Integer limit,int schedule_state) {
		PageHelper.startPage(page, limit);
		List<Schedule> schedules = this.scheduleMapper.findScheduleByState(schedule_state);
		for(Schedule schedule: schedules) {
			Hall hall = this.hallMapper.findHallById(schedule.getHall_id());
			hall.setHall_cinema(this.cinemaMapper.findCinemaById(hall.getCinema_id()));
			schedule.setSchedule_hall(hall);
			schedule.setSchedule_movie(this.movieMapper.findMovieById(schedule.getMovie_id()));
			List<Order> list = this.orderMapper.findOrdersByScheduleId(schedule.getSchedule_id());
			schedule.setOrderList(list);
		}
		PageInfo<Schedule> info = new PageInfo<Schedule>(schedules);
		return info;
	}
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public PageInfo<Schedule> findAllSchedule(Integer page,Integer limit) {
		PageHelper.startPage(page, limit);
		List<Schedule> schedules = this.scheduleMapper.findAllSchedule();
		for(Schedule schedule: schedules) {
			Hall hall = this.hallMapper.findHallById(schedule.getHall_id());
			hall.setHall_cinema(this.cinemaMapper.findCinemaById(hall.getCinema_id()));
			schedule.setSchedule_hall(hall);
			schedule.setSchedule_movie(this.movieMapper.findMovieById(schedule.getMovie_id()));
			List<Order> list = this.orderMapper.findOrdersByScheduleId(schedule.getSchedule_id());
			schedule.setOrderList(list);
		}
		PageInfo<Schedule> info = new PageInfo<Schedule>(schedules);
		return info;
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<Schedule> findScheduleByCinemaAndMovie(long cinema_id, long movie_id) {
		return this.scheduleMapper.findScheduleByCinemaAndMovie(cinema_id, movie_id);
	}
	
	/**
	 * selectSeat页面提供接口
	 */
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<Schedule> findScheduleByCineamIdAndMovieId(long cinema_id, long movie_id) {
		List<Schedule> list = this.scheduleMapper.findScheduleByCinemaAndMovie(cinema_id, movie_id);
		for(Schedule schedule: list) {
			Hall hall = this.hallMapper.findHallById(schedule.getHall_id());
			hall.setHall_cinema(this.cinemaMapper.findCinemaById(hall.getCinema_id()));
			schedule.setSchedule_hall(hall);
			schedule.setSchedule_movie(this.movieMapper.findMovieById(schedule.getMovie_id()));
		}
		return list;
	}
	
	
}
