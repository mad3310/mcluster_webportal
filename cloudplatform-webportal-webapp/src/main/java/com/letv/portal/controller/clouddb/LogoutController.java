package com.letv.portal.controller.clouddb;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.letv.common.session.Session;
import com.letv.common.session.SessionServiceImpl;
import com.letv.common.util.ConfigUtil;
import com.letv.common.util.HttpsClient;
import com.letv.portal.service.ILoginService;

@Controller
@RequestMapping(value="/account")
public class LogoutController{

	public static final String DASHBORAD_ADDRESS = "/dashboard";
	
	@Value("${oauth.auth.http}")
	private String OAUTH_AUTH_HTTP;
	@Value("${webportal.local.http}")
	private String WEBPORTAL_LOCAL_HTTP;
	
	@Autowired
	private ILoginService loginService;
	
	@Autowired
	private SessionServiceImpl sessionService;
	
	/**Methods Name: logout <br>
	 * Description: 用户登出<br>
	 * @author name: liuhao1
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/logout",method=RequestMethod.GET)   //http://localhost:8080/account/logout
	public void logout(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		loginService.logout();
		request.getSession().invalidate();
		
		StringBuffer buffer = new StringBuffer();
		buffer.append("http://uc.letvcloud.com/logout.do?backUrl=http://matrix.letvcloud.com:8081/dashboard");
		response.sendRedirect(buffer.toString());
   }
}
