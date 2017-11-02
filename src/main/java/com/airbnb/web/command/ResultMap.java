package com.airbnb.web.command;

import lombok.Data;

@Data
public class ResultMap {
   /*common ResultMap*/
    
   /*common bongki ...*/
	private String name,birthdate;
   /*common heekyung */
	private String hostSerial, memberId, residenceName, price, zipcode, detailImg, infoImg, resiContent, addr, limit;
	private String wifi, bedNum, pet, essentialItem, parking, bathroomNum, tv, washingMac, airCondi, kitchen,
	boardSeq, reviewStar, contents, regdate, rsvSeq, checkin, checkout, adult, teen, child, solddays, resPrice, disable;
	int revAvg; 
   /*common jiwon.... */
	private String title,cateName, cateLevel, cateSeq,date, sale;
	private String gender,rowNum, totalCnt,colYear, colMonth, colArea, colCount,colPrice, colDate,blyearSales, lyearSales, tyearSales;

	
	/*common yongju */
   /*common juyeon */
   
}