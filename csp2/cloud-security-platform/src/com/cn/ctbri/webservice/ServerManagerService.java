package com.cn.ctbri.webservice;

import java.io.File;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cn.ctbri.common.Constants;
import com.cn.ctbri.entity.Advertisement;
import com.cn.ctbri.entity.ScanType;
import com.cn.ctbri.entity.Serv;
import com.cn.ctbri.entity.ServiceAPI;
import com.cn.ctbri.entity.ServiceDetail;
import com.cn.ctbri.service.IAdvertisementService;
import com.cn.ctbri.service.IApiPriceService;
import com.cn.ctbri.service.IPriceService;
import com.cn.ctbri.service.IScanTypeService;
import com.cn.ctbri.service.IServDetailService;
import com.cn.ctbri.service.IServService;
import com.cn.ctbri.service.IServiceAPIService;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;

/**
 * 创 建 人  ：  zhang_shaohua
 * 创建日期：  2016-6-20
 * 描        述：  接收运营管理系统请求接口
 * 版        本：  1.0
 */
@Component
@Path("servermanager")
public class ServerManagerService {
	@Autowired
	IAdvertisementService adService;
	@Autowired
	IServService servService;
	@Autowired
	IServiceAPIService servAPIService;
	@Autowired
	IServDetailService servDetailService;
	@Autowired
	IScanTypeService scanTypeService;
	@Autowired
	IPriceService priceService;
	@Autowired
	IApiPriceService apiPriceService;
	
	/**
	 * 功能描述：广告添加
	 * */
	@POST
	@Path("/advertisement/vindicateAD")
	@Produces(MediaType.APPLICATION_JSON)
	public String addAdvertisement(String dataJson){
		JSONObject json = new JSONObject();
		try {
			JSONObject jsonObj = new JSONObject().fromObject(dataJson);
			
//			String adId = jsonObj.getString("AdId");
			String adName = jsonObj.getString("AdName");
			String adImage = jsonObj.getString("AdImage");
			int type = jsonObj.getInt("AdType");
			int order = jsonObj.getInt("AdOrder");
			String adStartDate = jsonObj.getString("AdStartDate");
			String adEndDate = jsonObj.getString("AdEndDate");
			String adCreateDate = jsonObj.getString("AdCreateDate");
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟  
			Date startDate = sdf.parse(adStartDate);
			Date endDate = sdf.parse(adEndDate);
			Date createDate = sdf.parse(adCreateDate);
			
			Advertisement ad = new Advertisement();
//			ad.setId(Integer.valueOf(adId));
			ad.setName(adName);
			ad.setImage(adImage);
			ad.setType(type);
			ad.setOrderIndex(order);
			ad.setStartDate(startDate);
			ad.setEndDate(endDate);
			ad.setCreateDate(createDate);
			int adId = adService.insert(ad);
			
			json.put("code", 200);//返回200表示成功
			json.put("messaage", "广告图片上传成功");
			json.put("adId", adId);
		} catch (Exception e) {
			e.printStackTrace();
			
			json.put("code", 400);//返回400表示失败
			json.put("messaage", "广告图片上传失败");
		}
        
		return json.toString();
	}
	
	/**
	 * 功能描述：广告删除
	 * */
	@POST
	@Path("/advertisement/delAD/{ADId}")
	@Produces(MediaType.APPLICATION_JSON)
	public String deleteAdvertisement(@PathParam("ADId") int adId){
		JSONObject json = new JSONObject();
		
		try {
			Advertisement ad = adService.findById(adId);
			//图片删除
			String imageName = ad.getImage();
			if (imageName != null && !imageName.equals("")) {
				//获取根目录  E:/apache-tomcat-X.X.XX/webapps/csp/WEB-INF/classes/  
				String path = this.getClass().getClassLoader().getResource("/").getPath();
				path = URLDecoder.decode(path, "UTF-8");
				
				path = path.substring(0, path.lastIndexOf("/"));  //E:\apache-tomcat-X.X.XX\webapps\csp\WEB-INF/classes
				path = path.substring(0, path.lastIndexOf("/"));  //E:\apache-tomcat-X.X.XX\webapps\csp\WEB-INF
				path = path.substring(0, path.lastIndexOf("/"));  //E:\apache-tomcat-X.X.XX\webapps\csp\
				path = path +"/source/images/ad/" + imageName;
				File imageFile = new File(path);
				if (imageFile.exists()) {
					imageFile.delete();
				}
			}
			
			adService.delete(adId);
			
			
			json.put("code", 200);//返回200表示成功
			json.put("message", "删除广告成功");
		} catch(Exception e){
			e.printStackTrace();
			json.put("code", 400);//返回400表示失败
			json.put("message", "删除广告失败");
		}
		
		return json.toString();
	}
	
	/**
	 * 功能描述：广告排序
	 * */
	@POST
	@Path("/advertisement/sortAD")
	@Produces(MediaType.APPLICATION_JSON)
	public String sortAdvertisement(String dataJson){
		JSONObject json = new JSONObject();
		try {
			JSONObject jsonObj = new JSONObject().fromObject(dataJson);
			
			String adId1 = jsonObj.getString("AdId1");
			int adOrder1 = jsonObj.getInt("AdOrder1");
			
			String adId2 = jsonObj.getString("AdId2");
			int adOrder2 = jsonObj.getInt("AdOrder2");
			
			
			
			Advertisement ad = new Advertisement();
			ad.setId(Integer.valueOf(adId1));
			ad.setOrderIndex(adOrder1);
			adService.update(ad);
			
			ad.setId(Integer.valueOf(adId2));
			ad.setOrderIndex(adOrder2);
			adService.update(ad);
			
			json.put("code", 200);//返回200表示成功
			json.put("messaage", "广告排序成功");
		} catch (Exception e) {
			e.printStackTrace();
			
			json.put("code", 400);//返回400表示失败
			json.put("messaage", "广告排序失败");
		}
        
		return json.toString();
	}
	
	/**
	 * 功能描述：添加服务
	 * */
	@POST
	@Path("/server/addserver")
	@Produces(MediaType.APPLICATION_JSON)
	public String addService(String dataJson){
		JSONObject json = new JSONObject();
		try {
			JSONObject jsonObj = new JSONObject().fromObject(dataJson);
			
			int parent = jsonObj.getInt("parent");
			int type = jsonObj.getInt("type");
			String name = jsonObj.getString("name");
			String remarks = jsonObj.getString("remarks");
			String homeIcon = jsonObj.getString("homeIcon");
			String categoryIcon = jsonObj.getString("categoryIcon");
			String detailIcon = jsonObj.getString("detailIcon");
			
			int serviceId = 0;
			if (parent==6) {
				//API服务
				ServiceAPI service = new ServiceAPI();
				service.setName(name);
				service.setParentC(parent);
				service.setType(type);
				service.setRemarks(remarks);
				service.setHomeIcon(homeIcon);
				service.setCategoryIcon(categoryIcon);
				service.setDetailIcon(detailIcon);
				serviceId = servAPIService.insert(service);
			}else{
				Serv service = new Serv();
				service.setName(name);
				service.setParentC(parent);
				service.setType(type);
				service.setRemarks(remarks);
				service.setHomeIcon(homeIcon);
				service.setCategoryIcon(categoryIcon);
				service.setDetailIcon(detailIcon);
				serviceId= servService.insert(service);
				
			}
			
			json.put("code", 200);//返回200表示成功
			json.put("messaage", "添加服务成功");
			json.put("serviceId", serviceId);
		} catch (Exception e) {
			e.printStackTrace();
			
			json.put("code", 400);//返回400表示失败
			json.put("messaage", "添加服务失败");
		}
        
		return json.toString();
	}
	
	/**
	 * 功能描述：服务删除
	 * */
	@POST
	@Path("/server/deleteserver")
	@Produces(MediaType.APPLICATION_JSON)
	public String deleteService(String dataJson){
		JSONObject json = new JSONObject();
		
		try {
			JSONObject jsonObj = new JSONObject().fromObject(dataJson);
			
			int serviceId = jsonObj.getInt("serviceId");
			int parent = jsonObj.getInt("parent");
			
			String serviceIcon = null;
			if(parent == 6) {	//删除API服务
				//删除服务图标
				ServiceAPI serviceAPI = servAPIService.findById(serviceId);
				serviceIcon = serviceAPI.getHomeIcon();
				deleteImage("serviceIcon", serviceIcon);
				
				serviceIcon = serviceAPI.getCategoryIcon();
				deleteImage("serviceIcon", serviceIcon);
				
				serviceIcon = serviceAPI.getDetailIcon();
				deleteImage("serviceIcon", serviceIcon);
				
				//删除service_api表数据
				servAPIService.deleteById(serviceId);
				//删除price_api表数据
				apiPriceService.delPrice(serviceId);
				
				
			} else {				//删除服务
				//删除服务图标
				Serv service = servService.findById(serviceId);
				if (service != null) {
					serviceIcon = service.getHomeIcon();
					deleteImage("serviceIcon", serviceIcon);
					
					serviceIcon = service.getCategoryIcon();
					deleteImage("serviceIcon", serviceIcon);
					
					serviceIcon = service.getDetailIcon();
					deleteImage("serviceIcon", serviceIcon);
				}
				
				//删除服务详情的图片
				String detailImage = null; 
				ServiceDetail servDetail = servDetailService.findByServId(serviceId);
				if(null != servDetail) {
					detailImage = servDetail.getDetailIcon(); 
					deleteImage("serviceDetail", detailImage);
				}
				
				//删除service表数据
				servService.deleteById(serviceId);
				
				//删除service详情表数据
				servDetailService.delete(serviceId, parent);
				
				//删除scanType表数据
				scanTypeService.deleteByServiceId(serviceId);
				
				//删除price表数据
				priceService.delPrice(serviceId);
			}
			
			json.put("code", 200);//返回200表示成功
			json.put("message", "删除服务成功");
		} catch(Exception e){
			e.printStackTrace();
			json.put("code", 400);//返回400表示失败
			json.put("message", "删除服务失败");
		}
		
		return json.toString();
	}
	
	private void deleteImage(String folderName, String imageNames) throws Exception{
		if (imageNames == null || imageNames.equals("") || imageNames.equals(";")) {
			return;
		}
		
		String[] imageNameArray = imageNames.split(";");
		//获取根目录  例 E:/apache-tomcat-X.X.XX/webapps/csp/WEB-INF/classes/  
		String path = this.getClass().getClassLoader().getResource("/").getPath();
		path = URLDecoder.decode(path, "UTF-8");
		
		path = path.substring(0, path.lastIndexOf("/"));  //E:\apache-tomcat-X.X.XX\webapps\csp\WEB-INF/classes
		path = path.substring(0, path.lastIndexOf("/"));  //E:\apache-tomcat-X.X.XX\webapps\csp\WEB-INF
		path = path.substring(0, path.lastIndexOf("/"));  //E:\apache-tomcat-X.X.XX\webapps\csp\
		path = path +"/source/images/serviceIcon/"+ folderName+"/";
		for (String imageName : imageNameArray) {
			String imagePath = path + imageName;
			File imageFile = new File(imagePath);
			if (imageFile.exists()) {
				imageFile.delete();
			}
		}
	}
	
	/**
	 * 功能描述：修改服务
	 * */
	@POST
	@Path("/server/updateserver")
	@Produces(MediaType.APPLICATION_JSON)
	public String updateService(String dataJson){
		JSONObject json = new JSONObject();
		try {
			JSONObject jsonObj = new JSONObject().fromObject(dataJson);
			
			int serviceId = jsonObj.getInt("serviceId");
			int parent = jsonObj.getInt("parent");
			int type = jsonObj.getInt("type");
			String name = jsonObj.getString("name");
			String remarks = jsonObj.getString("remarks");
			String homeIcon = jsonObj.getString("homeIcon");
			String categoryIcon = jsonObj.getString("categoryIcon");
			String detailIcon = jsonObj.getString("detailIcon");
			
			if (parent==6) {
				//API服务
				ServiceAPI service = new ServiceAPI();
				service.setId(serviceId);
				service.setName(name);
				service.setParentC(parent);
				service.setType(type);
				service.setRemarks(remarks);
				service.setHomeIcon(homeIcon);
				service.setCategoryIcon(categoryIcon);
				service.setDetailIcon(detailIcon);
				servAPIService.updateById(service);
			}else{
				Serv service = new Serv();
				service.setId(serviceId);
				service.setName(name);
				service.setParentC(parent);
				service.setType(type);
				service.setRemarks(remarks);
				service.setHomeIcon(homeIcon);
				service.setCategoryIcon(categoryIcon);
				service.setDetailIcon(detailIcon);
				servService.updateById(service);
			}
			
			json.put("code", 200);//返回200表示成功
			json.put("messaage", "修改服务成功");
			json.put("serviceId", serviceId);
		} catch (Exception e) {
			e.printStackTrace();
			
			json.put("code", 400);//返回400表示失败
			json.put("messaage", "修改服务失败");
		}
        
		return json.toString();
	}
	
	/**
	 * 功能描述：服务详情维护
	 * */
	@POST
	@Path("/serverDetail/vindicateDetail")
	@Produces(MediaType.APPLICATION_JSON)
	public String saveServDetails(String dataJson){
		JSONObject json = new JSONObject();
		try {
			JSONObject jsonObj = new JSONObject().fromObject(dataJson);
			
			int serviceId = jsonObj.getInt("serviceId");
			int parentC = jsonObj.getInt("parent");
			String priceTitle = jsonObj.getString("priceTitle");		//价格标题
			String typeTitle = jsonObj.getString("typeTitle");			//选类型标题
			int servType = jsonObj.getInt("servType");					//选类型(0:单次和长期,1:长期,2:单次)
			String servRatesTitle = jsonObj.getString("servRatesTitle");//服务频率标题
			String scanTypeStr = jsonObj.getString("scanType");			//服务频率
			String servIcon = jsonObj.getString("servIcon");			//服务详情图片
			
			//删除服务详情表数据
//			Map<String, Object> map = new HashMap<String, Object>();
//			map.put("servId", serviceId);
//			map.put("parent", parentC);
			servDetailService.delete(serviceId, parentC);
			
			//删除scanType表数据
			scanTypeService.deleteByServiceId(serviceId);
			
			//删除price表数据
			priceService.delPrice(serviceId);
			
			//新增服务频率
			if (servType== 0 || servType==1) {  //0:单次和长期,1:长期
				String[] scanTypeArray = scanTypeStr.split(",");
				for(int i=0; i<scanTypeArray.length; i++){
					ScanType scanType = new ScanType();
					scanType.setServiceId(serviceId);
					scanType.setScan_type(Integer.valueOf(scanTypeArray[i]));
					
					String scanTypeName = Constants.SCAN_TYPE_MAP.get(scanTypeArray[i]);
					if (scanTypeName != null && !scanTypeName.equals("")) {
						scanType.setScan_name(scanTypeName);
						scanTypeService.insert(scanType);
					}
				}
			}else {
				servRatesTitle="";
			}
			
			//新增服务详情
			ServiceDetail sd = new ServiceDetail();
			sd.setServiceId(serviceId);
			sd.setPriceTitle(priceTitle);
			sd.setTypeTitle(typeTitle);
			sd.setServType(servType);
			sd.setRatesTitle(servRatesTitle);
			sd.setDetailIcon(servIcon);
			sd.setCreateTime(new Date());
			sd.setParentC(parentC);
			sd.setDetailFlag("0");
			servDetailService.insert(sd);
			
			
			
			json.put("code", 200);//返回200表示成功
			json.put("messaage", "修改服务详情成功");
			json.put("serviceId", serviceId);
		} catch (Exception e) {
			e.printStackTrace();
			
			json.put("code", 400);//返回400表示失败
			json.put("messaage", "修改服务详情失败");
		}
        
		return json.toString();
	}
	
	public static void main(String[] args){
		//组织发送内容JSON
		JSONObject json = new JSONObject();
		
		ClientConfig config = new DefaultClientConfig();
		//检查安全传输协议设置
        Client client = Client.create(config);
      //连接服务器
        WebResource service = client.resource("http://localhost:8080/csp/rest/servermanager/advertisement/delAD/"+8);
        ClientResponse response = service.type(MediaType.APPLICATION_JSON_TYPE).post(ClientResponse.class,json.toString());        
        System.out.println(response.toString());

        String addresses = response.getEntity(String.class);
        System.out.println(addresses);
	}

}
