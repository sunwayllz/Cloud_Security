package com.cn.ctbri.start;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;


import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


import com.cn.ctbri.dao.CityMapper;
import com.cn.ctbri.dao.IpMapper;
import com.cn.ctbri.dao.WebsecMapper;
import com.cn.ctbri.model.City;
import com.cn.ctbri.model.Ip;
import com.cn.ctbri.model.Websec;
import com.cn.ctbri.utils.IPUtility;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;;
       
public class CircleSelect {
	private static final Logger logger =  LogManager.getLogger(CircleSelect.class);
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		while(true){
			ApplicationContext ctx=null;
			 
			try{ 
			   ctx=new ClassPathXmlApplicationContext("conf/applicationContext.xml");
			   WebsecMapper websecDao=(WebsecMapper) ctx.getBean("websecDao");
			    Long pre_maxLogId = getPropsLogId();
				//Long pre_maxLogId = 2850193l ;
			    Long maxLogId = websecDao.getMaxLogId();
			    Map<String,Long> map = new HashMap<String,Long>();
			    map.put("preLogId", pre_maxLogId);
			    map.put("maxLogId", maxLogId);
			    //本次需要更新的记录数
			    int toUpdNum = websecDao.selectToUpdNum(map);
			    //每次查询的记录数
			    int batchBlockSize = 200;
			    //需要更新最大log_id文件的次数
			    int updTimes = toUpdNum/batchBlockSize ;
			    List<Websec> seglist = null ;
			    //如果新产生的数据量比batchBlockSize小，只需要更新一次
			    if( updTimes < 1){
			    	Long offset =  websecDao.selectOffset(pre_maxLogId);
			    	Map<String,Long> map_limit = new HashMap<String,Long>();
			    	map_limit.put("offset", (offset-1));
			    	map_limit.put("seg", new Long(batchBlockSize));
			    	seglist= websecDao.selectByLimit(map_limit);
			    	int idx_seg_maxlog_id = seglist.size()-1;
			   	    Long	maxlog_id = seglist.get(idx_seg_maxlog_id).getLogId();
				    upd(ctx,seglist,maxlog_id);
			    	
			    }
			    //如果新产生的数据量比batchBlockSize大，需要更新1次或updTimes次
			    else {
			    	 Long offset = websecDao.selectOffset(pre_maxLogId);
			    	 Long maxlog_id = 0l;
			    	 for(int i = 0 ; i <= updTimes ; i++ ){
			    		
			    		
			 	    	if(i == updTimes){
			 	    		offset =  maxlog_id ;
			 		    	Map<String,Long> map_limit = new HashMap<String,Long>();
			 		    	map_limit.put("offset", (offset-1));
			 		    	map_limit.put("seg", new Long(batchBlockSize));
			 		    	seglist= websecDao.selectByLimit(map_limit); 
			 		    	int idx_seg_maxlog_id = seglist.size()-1;
			 	   	    	maxlog_id = seglist.get(idx_seg_maxlog_id).getLogId();
			 		    	upd(ctx,seglist,maxlog_id);
			 	    	}else{
			 	    		if(i==0 ){
			 	    			offset =  websecDao.selectOffset(pre_maxLogId);
				 	   	    	Map<String,Long> map_limit = new HashMap<String,Long>();
				 	   	    	map_limit.put("offset", new Long(offset-1));
				 	   	    	map_limit.put("seg", new Long(batchBlockSize));
				 	   	    	seglist= websecDao.selectByLimit(map_limit);
				 	   	        int idx_seg_maxlog_id = seglist.size()-1;
				 	   	    	maxlog_id = seglist.get(idx_seg_maxlog_id).getLogId();
				 	   	    	
				 	   	    	upd(ctx,seglist,maxlog_id);
			 	    		}else {
			 	    			offset = offset + batchBlockSize;
			 	    			Map<String,Long> map_limit = new HashMap<String,Long>();
				 	   	    	map_limit.put("offset", new Long(offset-1));
				 	   	    	map_limit.put("seg", new Long(batchBlockSize));
				 	   	    	seglist= websecDao.selectByLimit(map_limit);
				 	   	        int idx_seg_maxlog_id = seglist.size()-1;
				 	   	    	maxlog_id = seglist.get(idx_seg_maxlog_id).getLogId();
				 	   	    	upd(ctx,seglist,maxlog_id);
			 	    		}
			 	    			
			 	    	}
			 	    		
			 	    }
			    }
			 }catch(Exception e){
				e.printStackTrace();
			} 
			
		}
	   
	}
	private static Long getPropsLogId(){
		Long logid= 0l ;
		 Properties prop = new Properties();     
	     try{
	         //读取属性文件a.properties
	    	 //String path=System.getProperty("user.dir");
	 	     //InputStream in = new BufferedInputStream (new FileInputStream(path+"/conf/maxLogid.properties"));
	 	  //  InputStream in = new LogController().getClass().getResourceAsStream("/conf/maxLogId.properties");
	    	// InputStream in = Thread.currentThread().getContextClassLoader().getResourceAsStream("conf/maxLogid.properties");
	    	 	String str1 = new CircleSelect().getClass().getProtectionDomain().getCodeSource().getLocation().getPath();
		     	System.out.println(str1);
		     	String str2 = new File(str1).getParent() + "/conf/maxLogid.properties";
		        System.out.println(str2);
		 		InputStream in = new BufferedInputStream(new FileInputStream(str2));
		    	 prop.load(in);     ///加载属性列表
		         Iterator<String> it=prop.stringPropertyNames().iterator();
		         while(it.hasNext()){
		             String key=it.next();
		             System.out.println(key+":"+prop.getProperty(key));
		             logid = Long.parseLong((String)prop.get(key));
		         }
		         in.close();   
		     }catch(Exception e){
	    	 
	         System.out.println("maxLogid.properties文件读取失败： "+e);
	     }
	     return logid;
	 } 
	private static void  upd(ApplicationContext ctx,List<Websec> _segList,Long seg_maxLogid){
		
		List<Websec> udpList = new ArrayList<Websec>();
		 CityMapper cityDao=(CityMapper) ctx.getBean("cityDao");
		IpMapper ipDao=(IpMapper) ctx.getBean("ipDao");
		WebsecMapper websecDao = (WebsecMapper)ctx.getBean("websecDao");
		for(Websec websec : _segList){
			
			Websec upd = null;
			//设置攻击源的ip的经纬度和所在国家城市信息
			if(websec.getSrcIp() != null && !websec.getSrcIp().equals("") 
					&& !websec.getSrcIp().equals("192.168.0.1")){//只有攻击源ip不为空的情况，才新建对象
				upd = new Websec();
				Ip srcIp = getLocationId(websec.getSrcIp(),ipDao);
				if(srcIp != null){//通过ip查到了经纬度地址，则设置 标志位为1，表示有效
					upd.setIpLatlongValid(1);
					upd.setSrcLatitude(srcIp.getLatitude());
					upd.setSrcLongitude(srcIp.getLongitude());
					City srccity = cityDao.selectByPrimaryKey(srcIp.getLocationId());
					if(srccity != null){
						upd.setSrcCity(srccity.getCityName());
						upd.setSrcCountry(srccity.getCountryName());
						upd.setSrcCountryCode(srccity.getCountryIsoCode());
						upd.setSrcSubdivision1(srccity.getSubdivision1Name());
						upd.setSrcSubdivision2(srccity.getSubdivision2Name());
					}					
					
				}else{//通过ip没查到经纬度地址，则设置 标志位为-1，表示无效
					upd.setIpLatlongValid(-1);
				}
				//继续设置攻击目标信息
				//只有domain不是不为none，才是有效的攻击目标地址，设置目的ip的经纬度和所在国家城市信息
				if(websec.getDomain() != null && !websec.getDomain().equalsIgnoreCase("None")){
					if(websec.getDstIp() != null && !websec.getDstIp().equals("")){
						Ip dstIp = getLocationId(websec.getDstIp(),ipDao);
						if(dstIp != null){
							
							upd.setDstLatitude(dstIp.getLatitude());
							upd.setDstLongitude(dstIp.getLongitude());
							City dstcity = cityDao.selectByPrimaryKey(dstIp.getLocationId());
							if(dstcity != null){
								upd.setDstCity(dstcity.getCityName());
								upd.setDstCountry(dstcity.getCountryName());
								upd.setDstCountryCode(dstcity.getCountryIsoCode());
								upd.setDstSubdivision1(dstcity.getSubdivision1Name());
								upd.setDstSubdivision2(dstcity.getSubdivision2Name());
							}					
							
						}
				   }
			    }
				upd.setLogId(websec.getLogId());
				udpList.add(upd)	;
				System.out.println("======更新结束============Logid： "+upd.getLogId()+"============ipLatlongValid: "+upd.getIpLatlongValid());
				
			}else{//攻击源地址未查到，就不查被攻击目标端了
				System.out.println("======源地址"+websec.getSrcIp()+"未查到或无意义，什么也没做============Logid： "+websec.getLogId()+"============ipLatlongValid: "+websec.getIpLatlongValid());
				
			}
	}
		if(udpList.size() > 0){
			System.out.println("=====需要提交的记录条数：  ==== "+udpList.size());
			
			 Map<String,List<Websec>> map = new HashMap<String,List<Websec>>();
			
				System.out.println("======开始提交所有"+udpList.size()+"条记录============");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
			    System.out.println(sdf.format(getStartTime()));  
			    
			    map.put("list", udpList);
			     websecDao.batchUpd(map);
			    System.out.println("======结束提交所有"+udpList.size()+"条记录============");
				System.out.println(sdf.format(getEndTime())); 
				
		}
	
		updProps(seg_maxLogid);
		
		return  ;
	}
	/**
	 * @param ipv4
	 * @param ipDao
	 * @return 根据地址返回经纬度和城市id
	 */
	private static Ip getLocationId(String ipv4,IpMapper ipDao){
		Ip ip = null;
		Long ipLong = IPUtility.ip2long(ipv4);
		List<Ip> list = (ArrayList<Ip>)ipDao.getLatLongByIp(ipLong);
		//若根据ip返回的经纬度记录超过1条，那么返回netmask最大的那条记录
		if(list.size() > 1 ){
			int netmask_biggest = 0;
			for(int i = 0 ; i<list.size() ; i++){
				if(netmask_biggest < list.get(i).getNetmask()){
					netmask_biggest = list.get(i).getNetmask() ;
					ip = list.get(i);
				}
					
			}
			
		}else if(list.size() == 1)
			ip = list.get(0);
			
		return ip;
	}
	  
	    private static Date getStartTime() {  
	        Calendar todayStart = Calendar.getInstance();  
	        return todayStart.getTime();  
	    }  
	  
	    private static Date getEndTime() {  
	        Calendar todayEnd = Calendar.getInstance();  
	        return todayEnd.getTime();  
	    }  
	    private static void updProps(Long logid){
			 Properties prop = new Properties();     
		     try{
		         //读取属性文件a.properties
		    	// String path=System.getProperty("user.dir");
		 		//保存属性到properties文件
		    	//InputStream o = Thread.currentThread().getContextClassLoader().getResourceAsStream("conf/maxLogid.properties").;
		    	//File f = new File(o.);
		    	 //URL url = LogController.class.getClassLoader().getResource("conf/maxLogid.properties");
		    	// File file = new File(url.getFile());
		    	 //FileOutputStream oFile = new FileOutputStream(file.getPath(), false);//true表示追加打开,false表示新写入
		    	 //System.out.println(o.toString());
		    	 String str1 = new LogController().getClass().getProtectionDomain().getCodeSource().getLocation().getPath();
			     
			     	System.out.println(str1);
			     	String str2 = new File(str1).getParent() + "/conf/maxLogid.properties";
			     	
			     	System.out.println(str2);
		    	FileOutputStream oFile = new FileOutputStream(str2, false);//true表示追加打开,false表示新写入
		    	 
		    	 
		    	 prop.setProperty("log_id", Long.toString(logid));
		         prop.store(oFile, "The New properties file");
		         oFile.close();
		         logger.info("更新文件最大id： "+logid +"\n");
		     }
		     catch(Exception e){
		         System.out.println(e);
		     }
			 
		}
		
		
}