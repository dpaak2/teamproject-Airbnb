package com.airbnb.web.command;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import com.airbnb.web.constant.Extension;
import com.airbnb.web.constant.Path;

import lombok.Data;


@Data
@Lazy
@Component
public class Command {
protected String dir,action, page,pageNumber,search,view,column,startRow,endRow,kitchen,serial,cate,common;

	public void process() {
		/*VIEW�� �����ش�*/
		this.view=(dir.equals("home"))?
				"/WEB-INF/view/common/home.jsp":
			Path.VIEW+dir+Path.SEPARATOR+page+Extension.JSP;
		System.out.println("�̵�������:"+this.view);
	}

}
