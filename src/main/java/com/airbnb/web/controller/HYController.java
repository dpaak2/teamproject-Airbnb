package com.airbnb.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.airbnb.web.command.Command;
import com.airbnb.web.domain.Residence;
import com.airbnb.web.mapper.HYMapper;
import com.airbnb.web.service.IGetService;
import com.airbnb.web.service.IListService;

@RestController
public class HYController {
	private static final Logger logger = LoggerFactory.getLogger(HYController.class);
	@Autowired Command cmd;
	@Autowired HYMapper mapper;
	@Autowired Residence residence;
	@RequestMapping("/put/listhostels")
	public @ResponseBody List<?> listHostels(){
		 logger.info("HYcontroller listHostels{}." ,"진입 ");
		 @SuppressWarnings("unchecked")
		List<Residence> list = (List<Residence>) new IListService() {
			@Override
			public List<?> execute(Object o) {
				return mapper.selectList(cmd);
			}
		}.execute(cmd);
		System.out.println("hy넘어온 리스트 확인:::"+list);
		return list;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value="/put/searchCity", method=RequestMethod.POST)
	public @ResponseBody Object searchCity(@RequestBody Command cmdPo){
		 logger.info("HYcontroller selecthostel{}." ,"진입 ");
		 System.out.println("넘어온 city Name:::"+cmdPo.getAction());
		 cmd.setAction(cmdPo.getAction());
		 List<Residence> searchCity= new ArrayList<>();
		  searchCity=  (List<Residence>) new IGetService() {
			@Override
			public Object execute(Object o) {
				return mapper.selectList(cmd);
			}
		}.execute(cmd); 
		Map<String,Object> map = new HashMap<>();
		for(int i=0; i<searchCity.size(); i++) {
			map.put("key"+i, searchCity.get(i));
			
		}
		System.out.println(map.get("key1"));
		//searchCity.add(residence);
		System.out.println("result find by host serial=="+searchCity);
		return map;
	}
	
}
