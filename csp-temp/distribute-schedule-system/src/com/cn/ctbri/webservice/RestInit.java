package com.cn.ctbri.webservice;

import org.codehaus.jackson.jaxrs.JacksonJsonProvider;
import org.glassfish.jersey.filter.LoggingFilter;
import org.glassfish.jersey.server.ResourceConfig;
import org.springframework.web.filter.RequestContextFilter;


public class RestInit extends ResourceConfig {  
	  
    public RestInit() {  
  
        packages("com.cn.ctbri.webservice");//包路径下符合要求的类将被发布成webservice  
        register(JacksonJsonProvider.class);//注册json支持  
        register(RequestContextFilter.class);
    }  
  
}
