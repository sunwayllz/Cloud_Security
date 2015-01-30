package com.cn.ctbri.controller;


import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.htmlparser.util.NodeList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.cn.ctbri.cfg.Configuration;
import com.cn.ctbri.entity.Asset;
import com.cn.ctbri.entity.OrderAsset;
import com.cn.ctbri.entity.User;
import com.cn.ctbri.service.IAssetService;
import com.cn.ctbri.service.IOrderAssetService;
import com.cn.ctbri.util.GetNetContent;
/**
 * 创 建 人  ：  邓元元
 * 创建日期：  2015-1-16
 * 描        述：  我的资产
 * 版        本：  1.0
 */
@Controller
public class MyAssetsController {
	@Autowired
	IAssetService assetService;
	@Autowired
	IOrderAssetService orderAssetService;
	/**
	 * 功能描述： 我的资产页面
	 * 参数描述： Model model,HttpServletRequest request
	 *		 @time 2015-1-16
	 */
	@RequestMapping("/userAssetsUI.html")
	public String userBillUI(Model model,HttpServletRequest request){
		User globle_user = (User) request.getSession().getAttribute("globle_user");
		List<Asset> list = assetService.findByUserId(globle_user.getId());
		model.addAttribute("list",list);
		return "/source/page/userCenter/userAssets";
	}
	/**
	 * 功能描述： 添加资产
	 * 参数描述： Model model
	 *		 @time 2015-1-16
	 */
	@RequestMapping("/addAsset.html")
	public String addAsset(Model model,Asset asset,HttpServletRequest request){
		User globle_user = (User) request.getSession().getAttribute("globle_user");
		asset.setUserid(globle_user.getId());//用户ID
		asset.setCreate_date(new Date());//创建日期
		asset.setStatus(0);//资产状态(1：已验证，0：未验证)
		String name = "";//资产名称
		String addr = "";//资产地址
		//处理页面输入中文乱码的问题
		try {
			//name = URLDecoder.decode(asset.getName(), "UTF-8");
			name=new String(asset.getName().getBytes("ISO-8859-1"), "UTF-8");
			addr=new String(asset.getAddr().getBytes("ISO-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		asset.setName(name);
		asset.setAddr(addr);
		assetService.saveAsset(asset);
		return "redirect:/userAssetsUI.html";
	}

	/**
	 * 功能描述：检查资产是否可以被删除
	 * 参数描述：Asset asset ,HttpServletResponse response
	 *		 @time 2015-1-19
	 */
	@RequestMapping("/checkdelete.html")
	public void checkdelete(Asset asset,HttpServletResponse response){
		//检查订单资产表里面是否含有此资产
		List<OrderAsset> list = orderAssetService.findAssetById(asset.getId());
		int count = 0;
		if(list.size()>0){
			count = list.size();
		}
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("count", count);
		//object转化为Json格式
		JSONObject JSON = objectToJson(response, m);
		try {
			// 把数据返回到页面
			writeToJsp(response, JSON);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 功能描述： 把数据返回到页面
	 * 参数描述： HttpServletResponse response, JSONObject JSON
	 * @throws Exception 
	 *		 @time 2014-12-31
	 */
	private void writeToJsp(HttpServletResponse response, JSONObject JSON)
			throws IOException {
		response.getWriter().write(JSON.toString());
		response.getWriter().flush();
	}
	/**
	 * 功能描述：  object转化为Json格式
	 * 参数描述： HttpServletResponse response,Map<String, Object> m
	 * @throws Exception 
	 *		 @time 2014-12-31
	 */
	private JSONObject objectToJson(HttpServletResponse response,
			Map<String, Object> m) {
		JSONObject JSON = JSONObject.fromObject(m);
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json;charset=UTF-8");
		return JSON;
	}
	/**
	 * 功能描述：修改资产
	 * 参数描述： Model model
	 *		 @time 2015-1-19
	 */
	@RequestMapping("/editAsset.html")
	public String editAsset(Asset asset){
		int id = asset.getId();
		Asset newAsset = assetService.findById(id);
		String name = "";//资产名称
		try {
			name=new String(asset.getName().getBytes("ISO-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		if(!(name.equals(newAsset.getName())&&asset.getAddr().equals(newAsset.getAddr()))){
			asset.setName(name);
			asset.setStatus(0);
			assetService.updateAsset(asset);
		}
		return "redirect:/userAssetsUI.html";
	}
	/**
	 * 功能描述：删除资产
	 * 参数描述： Model model
	 *		 @time 2015-1-19
	 */
	@RequestMapping("/deleteAsset.html")
	public String delete(Asset asset){
		assetService.delete(asset.getId());
		return "redirect:/userAssetsUI.html";
	}
	/**
	 * 功能描述：联合搜索
	 * 参数描述： Model model,Asset asset,HttpServletRequest request
	 *		 @time 2015-1-19
	 */
	@RequestMapping("/searchAssetCombine.html")
	public String searchAssetsCombine(Model model,Asset asset,HttpServletRequest request){
		User globle_user = (User) request.getSession().getAttribute("globle_user");
		asset.setUserid(globle_user.getId());//将用户登录用户的id赋值到asset中
		String name = "";
		try {
			name = new String(asset.getName().getBytes("ISO-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		asset.setName(name);
		List<Asset> result = assetService.searchAssetsCombine(asset);//根据userid 资产状态 和资产名称联合查询
		model.addAttribute("list",result);		//传对象到页面
		model.addAttribute("status",asset.getStatus());//回显资产类型	
		model.addAttribute("name",name);
		//回显资产名称
		return "/source/page/userCenter/userAssets";
	}
	/**
	 * 功能描述：检查资产是否通过验证
	 * 参数描述： Asset asset
	 *		 @time 2015-1-19
	 *	返回值：无
	 */
	@RequestMapping("/asset_verification.html")
	public void asset_verification(HttpServletRequest request,HttpServletResponse response){
		int id = Integer.valueOf(request.getParameter("id"));
		Asset _asset = assetService.findById(id);
		String path = _asset.getAddr();
		//获取验证方式:代码验证 ;上传文件验证
		String verification_msg;
		Map<String, Object> m = new HashMap<String, Object>();
		try {
//			URL url =new URL(path);
//			HttpClient httpClient = HttpClient.New(url);
//			OutputStream outputStream = httpClient.getOutputStream();
			verification_msg = new String(request.getParameter("codeStyle").getBytes("ISO-8859-1"), "UTF-8");
			//代码验证
			if(verification_msg.equals("codeVerification")){
				 //获取已知代码
				 String code1 = String.valueOf(request.getParameter("code1"));
				 NodeList rt= GetNetContent.getNodeList(path);
				 String str= rt.toString();
				 if(str.contains(code1)){
					 m.put("msg", 1);//验证成功
				 }else{
					 m.put("msg", 0);//验证失败
				 }
			}
			//上传文件验证
			if(verification_msg.equals("fileVerification")){
				try{
					String newPath = path+"key.txt";//http://localhost:8080/cloud-security-platform/验证文件.txt
					URL fileUrl = new URL(newPath);
					HttpURLConnection conn = (HttpURLConnection) fileUrl.openConnection();
					DataInputStream input = new DataInputStream(conn.getInputStream());
					StringBuffer sb = new StringBuffer();
					int len = 0;
					while ((len = input.read()) != -1) {
	
						sb.append((char) len);
					}
					String toStringSb = sb.toString();
					input.close();
					if(toStringSb!=null&&toStringSb.equals(Configuration.getFileContent())){
						m.put("msg", 1);//验证成功
					}else{
						m.put("msg", 0);//验证失败
					}
				
				}catch (Exception e) {
					m.put("msg",0);//验证失败
					e.printStackTrace();
				}
			}
			 JSONObject JSON = objectToJson(response, m);
			// 把数据返回到页面
			writeToJsp(response, JSON);
		} catch (Exception e) {
			m.put("msg",0);//验证失败
			JSONObject JSON = objectToJson(response, m);
				// 把数据返回到页面
			try {
				writeToJsp(response, JSON);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
	}
	
	/**
	 * 功能描述：资产验证
	 * 参数描述： Asset asset
	 *		 @time 2015-1-19
	 *	返回值：redirect:/userAssetsUI.html
	 */
	@RequestMapping("/verificationAsset.html")
	public String verificationAsset(Asset asset){
		asset.setStatus(1);
		assetService.updateAsset(asset);
		return "redirect:/userAssetsUI.html";
	}
	//================下载=================
    private String type;// 文件的MIME类型
    
	public String getType() {
		return type;
	}
	
	/**
	 * 功能描述：下载导入模板
	 * 参数描述：HttpServletRequest request,HttpServletResponse response
	 *		 @time 2015-1-21
	 */
	@RequestMapping("/download.html")
	public void download(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String fileName = request.getParameter("fileName");
		fileName = new String(fileName.getBytes("ISO-8859-1"), "UTF-8");//反编译解决路径乱码
		//获取文件路径
		String path = request.getSession().getServletContext().getRealPath("/source/download");
		File file = new File(path+"/"+fileName);
		response.setHeader("Content-Disposition", "attachment; filename=" + new String(fileName.getBytes("GBK"), "ISO-8859-1") + ";");//文件的下载方式：attachment：附件
		// 通常文件名称得到mime类型
		type = request.getSession().getServletContext().getMimeType(fileName);
		//将路径path转化成输入流
		InputStream in = new FileInputStream(file);
		//将输入流的数据放置到模型驱动对象的InputStream的属性中
		ByteArrayOutputStream out = new ByteArrayOutputStream(1024);
		byte[] temp = new byte[1024];
		int size = 0;
		while ((size = in.read(temp)) != -1) {
			out.write(temp, 0, size);
		}
		in.close();
		ServletOutputStream os = response.getOutputStream();
		os.write(out.toByteArray());
		os.flush();
		os.close();
		return;
	}
}
