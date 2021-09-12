package com.cos.webproject.domain.planeticket;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import lombok.Data;

@Data
@Entity
public class PlaneTicket {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String depairportnm; // 출발공항
	private String arrairportnm; // 도착공항
	private Long depplandtime; // 출발시간
	private Long arrplandtime;  // 도착시간
	private int price; // 가격
	private String vihicleId; // 비해기종
}
