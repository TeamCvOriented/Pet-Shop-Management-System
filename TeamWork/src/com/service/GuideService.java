package com.service;
import java.util.ArrayList;
import java.util.List;

import com.entity.*;
import com.dao.*;
public class GuideService {
public List<Guide> findAllGuide(){
	GuideDao guideDao=new GuideDao();
	List<Guide> list=new ArrayList<Guide>();
	try {
		 list =guideDao.findAllGuide();
    } catch (Exception e) {
        e.printStackTrace();
    }
	return list;
}
public Guide findGuidebygId(int gId){
	GuideDao guideDao=new GuideDao();
	Guide guide=new Guide();
	try {
		guide =guideDao.findGuidebygId(gId).get(0);
    } catch (Exception e) {
        e.printStackTrace();
    }
	return guide;
}
public void manage_addGuide(Guide guide){
	GuideDao guideDao=new GuideDao();
    try {
        guideDao.addGuide(guide);
   } catch (Exception e) {
       e.printStackTrace();
   }
}
public void manage_deleteGuide(int gId){
	
    try {
    	GuideDao guideDao=new GuideDao();
        guideDao.deleteGuide(gId);
   } catch (Exception e) {
       e.printStackTrace();
   }
}
//public static void main(String argc[]){
//
//	Guide guide=new Guide();
//		GuideService service1 = new GuideService();
//		
//		guide=service1.findGuidebygId(1);
//		 System.out.println(guide.getgTitle());
//
//}
}
