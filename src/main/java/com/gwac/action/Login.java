package com.gwac.action;

import com.gwac.dao.UserInfoDAO;
import com.gwac.model.UserInfo;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionSupport;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.struts2.convention.annotation.ExceptionMapping;
import org.apache.struts2.interceptor.SessionAware;

@Result(name = "error", location = "/error.jsp")
@ExceptionMapping(exception = "java.lang.Exception", result = "error")
public class Login extends ActionSupport implements SessionAware {

  private static final long serialVersionUID = 7968544374444173511L;
  private static final Log log = LogFactory.getLog(Login.class);

  private Map<String, Object> session;

  @Resource
  private UserInfoDAO userDao;

  private String loginName;
  private String loginPass;
  private String echo;
  private Map msg;

  @Action(value = "/user-login", results = {
    @Result(name = "input", location = "login.jsp"),
    @Result(name = "index", location = "manage/pfile-upload.jsp"),
    @Result(name = "json", type = "json", params = {"root", "msg"})
  })
  public String userLogin() throws Exception {

    String result = SUCCESS;
    msg = new HashMap<>();

    UserInfo user = new UserInfo();
    user.setLoginName(loginName);
    user.setPassword(loginPass);

    List users = userDao.findUser(user);
    System.out.println(loginName);
    if (users.isEmpty()) {
    System.out.println(1);
      msg.put("flag", "0");
    } else {
    System.out.println(2);
      UserInfo tuser = (UserInfo) users.get(0);
      tuser.setPassword("");
      msg.put("flag", "1");
      msg.put("userInfo", tuser);
      session.put("userInfo", tuser);
    }
    return "index";
  }

  public String getEcho() {
    return echo;
  }

  /**
   * @return the loginName
   */
  public String getLoginName() {
    return loginName;
  }

  /**
   * @param loginName the loginName to set
   */
  public void setLoginName(String loginName) {
    this.loginName = loginName;
  }

  /**
   * @return the loginPass
   */
  public String getLoginPass() {
    return loginPass;
  }

  /**
   * @param loginPass the loginPass to set
   */
  public void setLoginPass(String loginPass) {
    this.loginPass = loginPass;
  }

  /**
   * @return the msg
   */
  public Map getMsg() {
    return msg;
  }

  @Override
  public void setSession(Map<String, Object> map) {
    this.session = map;
  }

}
