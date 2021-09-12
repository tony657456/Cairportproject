package com.cos.webproject.web.dto;

import lombok.Data;


@Data
public class TicketGoBackDto {
	private int id;

	private String airlinenm;
	
	private String depairportnm; // 출발공항
	private String arrairportnm; // 도착공항
	private Long depplandtime; // 출발시간
	private Long arrplandtime;  // 도착시간

	private int price;
	private String vihicleId;
	private String leadtime;
}
