package com.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.entity.Cinema;
import com.entity.Hall;
import com.entity.Schedule;
import com.mapper.CinemaMapper;
import com.mapper.HallMapper;
import com.mapper.ScheduleMapper;
import com.service.ICinemaService;

@Service
public class CinemaServiceImp implements ICinemaService{
	@Autowired
	private CinemaMapper cinemaMapper;
	@Autowired
	private HallMapper hallMapper;
	@Autowired
	private ScheduleMapper scheduleMapper;
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public Cinema findCinemaById(long cinema_id) {
		Cinema cinema = this.cinemaMapper.findCinemaById(cinema_id);
		List<Hall> list = this.hallMapper.findHallByCinemaId(cinema_id);
		cinema.setHallList(list);
		return cinema;
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<Cinema> findCinemasByMovieId(long movie_id) {
		List<Cinema> cinemaList = this.cinemaMapper.findCinemasByMovieId(movie_id);
		for(Cinema cinema : cinemaList) {
			List<Hall> hallList = this.hallMapper.findHallByCinemaId(cinema.getCinema_id());
			for(Hall hall : hallList) {
				hall.setScheduleList(this.scheduleMapper.findScheduleByCinemaAndMovieAndHall(hall.getHall_id(), hall.getCinema_id(), movie_id));
			}
			cinema.setHallList(hallList);
		}
		return cinemaList;
	}

	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public Integer addCinema(Cinema cinema) {
		return this.cinemaMapper.addCinema(cinema);
	}

	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public Integer updateCinema(Cinema cinema) {
		return this.cinemaMapper.updateCinema(cinema);
	}

	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public Integer deleteCinema(long cinema_id) {
		return this.cinemaMapper.deleteCinema(cinema_id);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<Cinema> findAllCinemas() {
		List<Cinema> list = this.cinemaMapper.findAllCinemas();
		for(Cinema cinema : list) {
			List<Hall> hallList = this.hallMapper.findHallByCinemaId(cinema.getCinema_id());
			cinema.setHallList(hallList);
		}
		return list;
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<Cinema> findCinemasLikeName(String cinema_name) {
		List<Cinema> list = this.cinemaMapper.findCinemasLikeName(cinema_name);
		for(Cinema cinema : list) {
			List<Hall> hallList = this.hallMapper.findHallByCinemaId(cinema.getCinema_id());
			cinema.setHallList(hallList);
		}
		return list;
	}
	
}
