package com.cn.ctbri.common;

import java.io.UnsupportedEncodingException;
import java.security.SecureRandom;
import java.security.cert.CertificateException;
import java.util.List;
import java.util.Properties;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.NewCookie;

import sun.misc.BASE64Decoder;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.cn.ctbri.controller.WafController;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.client.urlconnection.HTTPSProperties;

public class SysWorker {
	/**
	 * wafAPI服务器根路径
	 */
	
	private static String SERVER_SYS_ROOT;
	//private static String resourceId;
	//金山
	private static String SYS_jinshan_getOrderIndex;
	private static String SYS_jinshan_getUninstallInfo;
	private static String SYS_jinshan_getHostCount;
	private static String SYS_jinshan_getOauthUrl;
	
	
	 //云眼
	private static String SYS_yunyan_gettoken;
	private static String SYS_yunyan_destroyToken;
	private static String SYS_yunyan_getloginurl;
	
	static{
		try {
			Properties p = new Properties();
			p.load(WafAPIWorker.class.getClassLoader().getResourceAsStream("northAPI.properties"));
			SERVER_SYS_ROOT = p.getProperty("SERVER_SYS_ROOT");
			//resourceId = p.getProperty("resourceId");
			SYS_jinshan_getOrderIndex = p.getProperty("SYS_jinshan_getOrderIndex");
			SYS_jinshan_getUninstallInfo = p.getProperty("SYS_jinshan_getUninstallInfo");
			SYS_jinshan_getHostCount = p.getProperty("SYS_jinshan_getHostCount");
			SYS_jinshan_getOauthUrl = p.getProperty("SYS_jinshan_getOauthUrl");
			
			SYS_yunyan_gettoken = p.getProperty("SYS_yunyan_gettoken");
			SYS_yunyan_destroyToken = p.getProperty("SYS_yunyan_destroyToken");
			SYS_yunyan_getloginurl = p.getProperty("SYS_yunyan_getloginurl");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public SysWorker() {
	}
	
	/**
	 * 功能描述：获取订单状态
	 * @param companyId 企业ID（唯一标识）
	 * 		  name   企业名称，
	 *        tCount      订购的终端点数
	 * @time 2017-3-15
	 * 返回成功：{"status":"success"}
		失败：{"message":"Enterprises already have this order","status":"failed"}

	 */
	public static String getJinshanCreateOrder(String companyId, String companyName, String tCount){
		JSONObject json =new JSONObject();
		json.put("companyId", companyId);
		if (companyName.equals("")) {
			json.put("name", "nocompanyname");
		}
		else {
			json.put("name", companyName);
		}
		json.put("tCount", tCount);
		
		String url = SERVER_SYS_ROOT + SYS_jinshan_getOrderIndex;
		//创建jersery客户端配置对象
		ClientConfig config = new DefaultClientConfig();
		//检查安全传输协议设置
		buildConfig(url, config);
		//创建Jersery客户端对象
        Client client = Client.create(config);
      //连接服务器
        WebResource service = client.resource(url);
      //获取响应结果
        ClientResponse response = service.type(MediaType.APPLICATION_JSON_TYPE).post(ClientResponse.class, json.toString());
        String textEntity = response.getEntity(String.class);
//      String status = JSONObject.fromObject(textEntity).getString("status");
        System.out.println(textEntity);
        String status =JSONObject.fromObject(textEntity).getString("status");
        return status;
	}
	/**
	 * 功能描述：获取卸载密码接口
	 * @param companyId 企业ID（唯一标识）
	 * 		 
	 * @time 2017-3-15
	 * 返回成功：{"status":"success","uninstallPassword":"WGxMRHJ0"}
		失败：{"message":"Company does not exist","status":"failed"}

	 */
	public static String getJinshanUninstallInfo(String companyId){
		JSONObject json =new JSONObject();
		json.put("companyId", companyId);

		
		String url = SERVER_SYS_ROOT + SYS_jinshan_getUninstallInfo;
		//创建jersery客户端配置对象
		ClientConfig config = new DefaultClientConfig();
		//检查安全传输协议设置
		buildConfig(url, config);
		//创建Jersery客户端对象
        Client client = Client.create(config);
      //连接服务器
        WebResource service = client.resource(url);
      //获取响应结果
        ClientResponse response = service.type(MediaType.APPLICATION_JSON_TYPE).post(ClientResponse.class, json.toString());
        String textEntity = response.getEntity(String.class);
//      String status = JSONObject.fromObject(textEntity).getString("status");
        
        String status = JSONObject.fromObject(textEntity).getString("status");
        if (status.equals("success")) {
			
        	String struninstallPassword = JSONObject.fromObject(textEntity).getString("uninstallPassword");   	
        	return struninstallPassword;
		}
        else {
			return "failed";
		}

	}
	
	/**
	 * 功能描述：获取安装点数接口
	 * @param companyId 企业ID（唯一标识）
	 * 		 
	 * @time 2017-3-15
	 * 返回成功：{"status":"success","allCount":"64","installCount":"0","surplusCount":"64"}
		失败：{"message":"Company does not exist","status":"failed"}

	 */
	public static String getJinshanhostcount(String companyId){
		JSONObject json =new JSONObject();
		json.put("companyId", companyId);

		
		String url = SERVER_SYS_ROOT + SYS_jinshan_getHostCount;
		//创建jersery客户端配置对象
		ClientConfig config = new DefaultClientConfig();
		//检查安全传输协议设置
		buildConfig(url, config);
		//创建Jersery客户端对象
        Client client = Client.create(config);
      //连接服务器
        WebResource service = client.resource(url);
      //获取响应结果
        ClientResponse response = service.type(MediaType.APPLICATION_JSON_TYPE).post(ClientResponse.class, json.toString());
        String textEntity = response.getEntity(String.class);
//      String status = JSONObject.fromObject(textEntity).getString("status");
        System.out.println(textEntity);
        
        
        return textEntity;
	}
	
	/**
	 * 功能描述：获取登陆授权接口 
	 * @param companyId 企业ID（唯一标识）
	 * 		 
	 * @time 2017-3-15
	 * 返回结果：
{"url":"aHR0cDovLzYwLjIwNS4xNjkuMjIzL09hdXRoL2luZGV4P2NvbXBhbnlfaWQ9MTIzNDU2JnRpbWVzdGFtcD0xNDg5NDU3OTQ2MjI2JnNlcmNldD1ERkIwMDM2NDY3M0E3RjVDODZGRTQ0QzVDNkEwRDdFOA==","status":"success"}
url解码后：
	http://60.205.169.223/Oauth/index?company_id=123456&timestamp=1489457946226&sercet=DFB00364673A7F5C86FE44C5C6A0D7E8


	 */
	public static String getJinshanoauthurl(String companyId){
		JSONObject json =new JSONObject();
		json.put("companyId", companyId);

		
		String url = SERVER_SYS_ROOT + SYS_jinshan_getOauthUrl;
		//创建jersery客户端配置对象
		ClientConfig config = new DefaultClientConfig();
		//检查安全传输协议设置
		buildConfig(url, config);
		//创建Jersery客户端对象
        Client client = Client.create(config);
      //连接服务器
        WebResource service = client.resource(url);
      //获取响应结果
        ClientResponse response = service.type(MediaType.APPLICATION_JSON_TYPE).post(ClientResponse.class, json.toString());
        String textEntity = response.getEntity(String.class);
        String status = JSONObject.fromObject(textEntity).getString("status");
        if (status.equals("success")) {
			
        	String urlBase64 = JSONObject.fromObject(textEntity).getString("url");
        	String OrderUrl = getFromBase64(urlBase64);    	
        	return OrderUrl;
		}
        else {
			return "failed";
		}
       // System.out.println(textEntity);
       // return textEntity;
	}
	
	/**
	 * 功能描述：获取yunyan  token
	 * @param userId 用户ID（唯一标识）
	 * 		 
	 * @time 2017-3-28
	 * 返回成功："status": "success",
  	"token": "51f7fdf203668e843c895a4241f9a4ec",
  	"randomChar": "gK9XNUGANOnN23e8QjdLPFs8merlsdxf"


	 */
	public static String getYunyanToken(String userId){
		JSONObject json =new JSONObject();
		json.put("userId", userId);

		
		String url = SERVER_SYS_ROOT +SYS_yunyan_gettoken ;
		//创建jersery客户端配置对象
		ClientConfig config = new DefaultClientConfig();
		//检查安全传输协议设置
		buildConfig(url, config);
		//创建Jersery客户端对象
        Client client = Client.create(config);
      //连接服务器
        WebResource service = client.resource(url);
      //获取响应结果
        ClientResponse response = service.type(MediaType.APPLICATION_JSON_TYPE).post(ClientResponse.class, json.toString());
        String textEntity = response.getEntity(String.class);
//      String status = JSONObject.fromObject(textEntity).getString("status");
        
        String status = JSONObject.fromObject(textEntity).getString("status");
        if (status.equals("success")) {
			
        	String strtoken = JSONObject.fromObject(textEntity).getString("token");   	
        	return strtoken;
		}
        else {
			return "failed";
		}

	}
	
	
	/**
	 * 功能描述：注销yunyan  token
	 * @param userId 用户ID（唯一标识）
	 * 		 
	 * @time 2017-3-28
	 * 返回成功"status":"success"


	 */
	public static String destroyYunyanToken(String userId){
		JSONObject json =new JSONObject();
		json.put("userId", userId);

		
		String url = SERVER_SYS_ROOT +SYS_yunyan_destroyToken ;
		//创建jersery客户端配置对象
		ClientConfig config = new DefaultClientConfig();
		//检查安全传输协议设置
		buildConfig(url, config);
		//创建Jersery客户端对象
        Client client = Client.create(config);
      //连接服务器
        WebResource service = client.resource(url);
      //获取响应结果
        ClientResponse response = service.type(MediaType.APPLICATION_JSON_TYPE).post(ClientResponse.class, json.toString());
        String textEntity = response.getEntity(String.class);
//      String status = JSONObject.fromObject(textEntity).getString("status");
        
        String status = JSONObject.fromObject(textEntity).getString("status");
        if (status.equals("success")) {
			
        	return "success";
		}
        else {
			return "failed";
		}

	}
	
	/**
	 * 功能描述：获取yunyan  登录url
	 * @param token 
	 * 		 
	 * @time 2017-3-28
	 * 返回成功{"url":"http://180.153.47.196:8088/stewardweb/securityLogin.do?token=4e1a3c6fd528d4e9186ee4ef6c1edd13","status":"success"}



	 */
	public static String getYunyanloginURL(String token){
		JSONObject json =new JSONObject();
		json.put("token", token);

		
		String url = SERVER_SYS_ROOT +SYS_yunyan_getloginurl ;
		//创建jersery客户端配置对象
		ClientConfig config = new DefaultClientConfig();
		//检查安全传输协议设置
		buildConfig(url, config);
		//创建Jersery客户端对象
        Client client = Client.create(config);
      //连接服务器
        WebResource service = client.resource(url);
      //获取响应结果
        ClientResponse response = service.type(MediaType.APPLICATION_JSON_TYPE).post(ClientResponse.class, json.toString());
        String textEntity = response.getEntity(String.class);
//      String status = JSONObject.fromObject(textEntity).getString("status");
        
        String status = JSONObject.fromObject(textEntity).getString("status");
        if (status.equals("success")) {
        	String urlRes = JSONObject.fromObject(textEntity).getString("url");   	
        	return urlRes;

		}
        else {
			return "failed";
		}

	}
	
	/**
	 * 功能描述： Base64解码
	 *		 @time 2017-3-15
	 */
	
	private static String getFromBase64(String s){
		byte[] b = null;
		String result = null;
		if (s != null) {
			BASE64Decoder decoder = new BASE64Decoder();
			try {
				b = decoder.decodeBuffer(s);
				result = new String(b, "utf-8");
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		return result;
	}
	
	
	/**
	 * 功能描述： 获取安全套接层上下文对象
	 *		 @time 2015-12-31
	 */
	private static SSLContext getSSLContext() {
		//创建认证管理器
    	TrustManager[] trustAllCerts = new TrustManager[]{new X509TrustManager(){
    	    public java.security.cert.X509Certificate[] getAcceptedIssuers(){return null;}
			public void checkClientTrusted(
					java.security.cert.X509Certificate[] arg0, String arg1)
					throws CertificateException {
			}
			public void checkServerTrusted(
					java.security.cert.X509Certificate[] arg0, String arg1)
					throws CertificateException {
			}
    	}};
    	try {
    		//创建安全传输层对象
    	    SSLContext sc = SSLContext.getInstance("SSL");
    	    //初始化参数
    	    sc.init(null, trustAllCerts, new SecureRandom());
    	    HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
    	    return sc;
    	} catch (Exception e) {
    	    e.printStackTrace();
    	}
    	return null;
    }
	

	/**
	 * 功能描述：空字符串转化方法
	 * 参数描述:String str 要转化的字符
	 *		 @time 2015-12-31
	 */
	private static String nullFilter(String str) {
    	return str==null ? "" : str;
    }


    /**
	 * 功能描述：post方法请求
	 * 参数描述:String sessionId 回话ID, String taskId任务ID
	 *		 @time 2015-12-31
	 */
	private static String postMethod(String url, String xml, String sessionId) {
		//创建客户端配置对象
    	ClientConfig config = new DefaultClientConfig();
    	//通信层配置设定
		buildConfig(url,config);
		//创建客户端
		Client client = Client.create(config);
		//连接服务器
		WebResource service = client.resource(url);
		//获取响应结果
		String response = service.cookie(new NewCookie("sessionid",sessionId)).type(MediaType.APPLICATION_XML).accept(MediaType.TEXT_XML).post(String.class, xml);
		return response;
	}
	/**
	 * 功能描述：get方法请求
	 * 参数描述:String url 请求路径, String sessionId 回话ID
	 *		 @time 2015-12-31
	 */
	private static String getMethod(String url,String sessionId){
		//创建客户端配置对象
    	ClientConfig config = new DefaultClientConfig();
    	//通信层配置设定
		buildConfig(url,config);
		//创建客户端
		Client client = Client.create(config);
		//连接服务器
		WebResource service = client.resource(url);
		//获取响应结果
		String response = service.cookie(new NewCookie("sessionid",sessionId)).type(MediaType.APPLICATION_XML).accept(MediaType.TEXT_XML).get(String.class);
		return response;
	}
	/**
	 * 功能描述：安全通信配置设置
	 * 参数描述:String url 路径,ClientConfig config 配置对象
	 *		 @time 2015-12-31
	 */
	private static void buildConfig(String url,ClientConfig config) {
		if(url.startsWith("https")) {
        	SSLContext ctx = getSSLContext();
        	config.getProperties().put(HTTPSProperties.PROPERTY_HTTPS_PROPERTIES, new HTTPSProperties(
        		     new HostnameVerifier() {
        		         public boolean verify( String s, SSLSession sslSession ) {
        		             return true;
        		         }
        		     }, ctx
        		 ));
        }
	}
	   
    public static void main(String[] args)  {
//        String sites = getSites("10001", "30001");
        System.out.println("sys worker ");
        
    }
}