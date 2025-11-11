package com.service;

import java.io.IOException;
import java.util.List;

import com.dao.ServiceDao;
import com.entity.Service;

public class ServiceService {

    private ServiceDao serviceDao;

    public ServiceService() {
    	
        try {
            serviceDao = new ServiceDao();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void reservation(Service service,int uId,int pId) {
    	try {
            serviceDao.add(service,uId,pId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Service> getAllService() {
        try {
            return serviceDao.findAllService();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Error getting all services", e);
        }
    }
    
    public Service getServiceBYsId(int sId){
    	 Service service = new Service();
    	try {
    		
            service = serviceDao.findServiceBYsId(sId).get(0);
          
            
            } catch (Exception e) {
            e.printStackTrace();
        }
    	return service;
    }
    public List<Service> getServiceBYuId(int uId){
    	
   	try {
   		
           return serviceDao.findServiceBYuId(uId);
         
           
           } catch (Exception e) {
           e.printStackTrace();
           throw new RuntimeException("Error getting services", e);
       }
   
   }

    // 更新服务状态
    public void updateState(Service service,String newState) {
        try {
            serviceDao.updateState(service,newState);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
//	public static void main(String argc[]){
//	
//			Service service = new Service();
//			ServiceService service1 = new ServiceService();
//			List<Service> serviceList = service1.getServiceBYuId(1);
//			 for (Service service3 : serviceList) 
//				 System.out.println(service3);
//			
//				
//			
//			
//	
//}
}
