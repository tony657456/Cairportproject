package com.cos.webproject.web.dto;

import lombok.Data;

@Data
public class TicketReqDto {
	private String depairportnm; // 출발공항
	private String arrairportnm; // 도착공항
	private String depplandtime; // 출발시간
	private String arrplandtime;  // 도착시간
}
