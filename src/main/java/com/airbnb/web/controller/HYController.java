package com.airbnb.web.controller;

import java.util.List;

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
		 List<?> list = new IListService() {
			@Override
			public List<?> execute(Object o) {
				return mapper.selectList(cmd);
			}
		}.execute(cmd);
		System.out.println("넘어온 리스트 확인:::"+list);
		return list;
	}
	/*@RequestMapping(value="/put/selecthostel", method=RequestMethod.POST)
	public @ResponseBody Object selecthostel(@RequestBody Residence resi){
		 logger.info("HYcontroller selecthostel{}." ,"진입 ");
		 System.out.println("넘어온 호스트 시리얼:::"+resi.getHostSerial());
		return null;
	}*/

/*	@RequestMapping(value="/put/searchCity", method=RequestMethod.POST)
	public @ResponseBody Object searchCity(@RequestBody Command cmdPo){
		 logger.info("HYcontroller selecthostel{}." ,"진입 ");
		 System.out.println("넘어온 호스트 시리얼:::"+cmdPo.getAction());
		 residence= (Residence) new IGetService() {
			@Override
			public Object execute(Object o) {
				return mapper.selectOne(cmd);
			}
		}.execute(cmd); 
		System.out.println("result find by host serial=="+residence);
		return null;
	}*/
	
}
