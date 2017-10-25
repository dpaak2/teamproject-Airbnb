package com.airbnb.web.domain;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class BoardCate {
	private String
	boardSeq,
	cateName,
	cateLevel,
	cateParentId,
	cateSection;
}
