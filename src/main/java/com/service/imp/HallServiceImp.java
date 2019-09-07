package com.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.entity.Hall;
import com.mapper.CinemaMapper;
import com.mapper.HallMapper;
import com.service.IHallService;

@Service
public class HallServiceImp implements IHallService{
	@Autowired
	private HallMapper hallMapper;
	@Autowired
	private CinemaMapper cinemaMapper;
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public Hall findHallById(long hall_id) {
		Hall hall = this.hallMapper.findHallById(hall_id);
		hall.setHall_cinema(this.cinemaMapper.findCinemaById(hall.getCinema_id()));
		return hall;
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public Hall findHallByCinemaAndHallName(String cinema_name, String hall_name) {
		return this.hallMapper.findHallByCinemaAndHallName(cinema_name, hall_name);
	}

	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public Integer addHall(Hall hall) {
		return this.hallMapper.addHall(hall);
	}

	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public Integer updateHall(Hall hall) {
		return this.hallMapper.updateHall(hall);
	}

	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public Integer deleteHall(long hall_id) {
		return this.hallMapper.deleteHall(hall_id);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<Hall> findHallByCinemaId(long cinema_id) {
		List<Hall> list = this.hallMapper.findHallByCinemaId(cinema_id);
		for(Hall hall : list) {
			hall.setHall_cinema(this.cinemaMapper.findCinemaById(hall.getCinema_id()));
		}
		return list;
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<Hall> findAllHalls() {
		List<Hall> list = this.hallMapper.findAllHalls();
		for(Hall hall : list) {
			hall.setHall_cinema(this.cinemaMapper.findCinemaById(hall.getCinema_id()));
		}
		return list;
	}
	
	
}
