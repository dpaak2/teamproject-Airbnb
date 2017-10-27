package com.airbnb.web.command;

import lombok.Data;

@Data
public class ResultMap {
   /*common ResultMap*/

   /*common bongki ...*/
	private String rsvSeq,residenceName,name,checkout,checkin,birthdate;
   /*common heekyung */
	private String hostSerial, memberId, price, zipcode, detailImg, infoImg, resiContent, addr, adult, teen, child;
	private String wifi, bedNum, pet, essentialItem, parking, bathroomNum, tv, washingMac, airCondi, kitchen,
	boardSeq, reviewStar, contents, regdate;
	int revAvg; 
   /*common jiwon.... */
	private String title,cateName, cateLevel, cateSeq,date, sale;
   /*common yongju */
   /*common juyeon */
   
}