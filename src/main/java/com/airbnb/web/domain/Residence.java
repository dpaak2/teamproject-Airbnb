package com.airbnb.web.domain;

import org.springframework.stereotype.Component;
import lombok.Data;

@Component
@Data
public class Residence {
	private String 
		hostSerial,
		memberId,
		limit,
		residenceName,
		price,
		zipcode,
		detailImg,
		infoImg,
		resiContent,
		addr;
}