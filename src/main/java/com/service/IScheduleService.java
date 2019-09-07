package com.service;

import java.util.List;

import com.entity.Schedule;
import com.github.pagehelper.PageInfo;

public interface IScheduleService {
	Schedule findScheduleById(long schedule_id);
	Integer addSchedule(Schedule schedule);
	Integer updateSchedule(Schedule schedule);
	Integer deleteSchedule(long schedule_id);
	Integer addScheduleRemain(long schedule_id);
	Integer delScheduleRemain(long schedule_id);
	PageInfo<Schedule> findScheduleByMovieName(Integer page,Integer limit,String movie_name);
	PageInfo<Schedule> findOffScheduleByMovieName(Integer page,Integer limit,String movie_name);
	PageInfo<Schedule> findAllSchedule(Integer page,Integer limit);
	PageInfo<Schedule> findAllScheduleByState(Integer page,Integer limit,int schedule_state);
	List<Schedule> findScheduleByCinemaAndMovie(long cinema_id,long movie_id);
	List<Schedule> findScheduleByCineamIdAndMovieId(long cinema_id,long movie_id);
}
