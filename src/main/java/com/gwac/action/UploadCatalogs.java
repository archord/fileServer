/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gwac.action;

/**
 *
 * @author xy
 */
import com.gwac.dao.ObjectCatalogDao;
import com.gwac.dao.TemplateCatalogDao;
import com.gwac.model.ObjectCatalog;
import com.gwac.model.TemplateCatalog;
import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.INPUT;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.FileUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

/**
 * from MultipleCommonFileUploadAction
 *
 * @author xy
 */
public class UploadCatalogs extends ActionSupport {

  /**
   * @param obsCat the obsCat to set
   */
  public void setObsCat(File obsCat) {
    this.obsCat = obsCat;
  }

  /**
   * @param obsCatFileName the obsCatFileName to set
   */
  public void setObsCatFileName(String obsCatFileName) {
    this.obsCatFileName = obsCatFileName;
  }

  /**
   * @param tmpCat the tmpCat to set
   */
  public void setTmpCat(File tmpCat) {
    this.tmpCat = tmpCat;
  }

  /**
   * @param tmpCatFileName the tmpCatFileName to set
   */
  public void setTmpCatFileName(String tmpCatFileName) {
    this.tmpCatFileName = tmpCatFileName;
  }

  /**
   * @param obsCcdName the obsCcdName to set
   */
  public void setObsCcdName(String obsCcdName) {
    this.obsCcdName = obsCcdName;
  }

  /**
   * @param obsFieldName the obsFieldName to set
   */
  public void setObsFieldName(String obsFieldName) {
    this.obsFieldName = obsFieldName;
  }

  /**
   * @param obsDateTime the obsDateTime to set
   */
  public void setObsDateTime(Date obsDateTime) {
    this.obsDateTime = obsDateTime;
  }

  /**
   * @param tmpCcdName the tmpCcdName to set
   */
  public void setTmpCcdName(String tmpCcdName) {
    this.tmpCcdName = tmpCcdName;
  }

  /**
   * @param tmpFieldName the tmpFieldName to set
   */
  public void setTmpFieldName(String tmpFieldName) {
    this.tmpFieldName = tmpFieldName;
  }

  /**
   * @param tmpDateTime the tmpDateTime to set
   */
  public void setTmpDateTime(Date tmpDateTime) {
    this.tmpDateTime = tmpDateTime;
  }

  private static final Log log = LogFactory.getLog(UploadCatalogs.class);

  @Resource
  private ObjectCatalogDao objCatDao;
  @Resource
  private TemplateCatalogDao tmpCatDao;

  private String echo = "";
  private File obsCat;
  private String obsCatFileName; //G021_mon_objt_181214T11194212.Fcat
  private File tmpCat;
  private String tmpCatFileName; //Temp_G033_G0013_11940425_245845922708.Fcat
  private String obsCcdName;
  private String obsFieldName;
  private Date obsDateTime;
  private String tmpCcdName;
  private String tmpFieldName;
  private Date tmpDateTime;

  @Action(value = "uploadCatalogs", results = {
    @Result(location = "manage/result.jsp", name = SUCCESS)
    ,
    @Result(location = "manage/result.jsp", name = INPUT)
    ,
    @Result(location = "manage/result.jsp", name = ERROR)})
  public String upload() {

    long startTime = System.nanoTime();
    long endTime = 0;
//    System.out.println("obsCatFileName=" + obsCatFileName);
//    System.out.println("tmpCatFileName=" + tmpCatFileName);
//    System.out.println("obsCcdName=" + obsCcdName);
//    System.out.println("obsFieldName=" + obsFieldName);
//    System.out.println("obsDateTime=" + obsDateTime);
//    System.out.println("tmpCcdName=" + tmpCcdName);
//    System.out.println("tmpFieldName=" + tmpFieldName);
//    System.out.println("tmpDateTime=" + tmpDateTime);

    String result = SUCCESS;
    boolean flag = true;
    echo = "";

    //必须传输数据文件
    //Error, must transform data file
    if (obsCatFileName == null || tmpCatFileName == null || obsCatFileName.isEmpty() || tmpCatFileName.isEmpty()) {
      echo = echo + "Error, must upload data obsCat and set tmpCatFileName.\n";
      flag = false;
    }

    //计算数据文件大小
    long fileTotalSize = 0;
    if (obsCat != null) {
      fileTotalSize += obsCat.length();
    }
    if (tmpCat != null) {
      fileTotalSize += tmpCat.length();
    }
    int i = 0;
    if (fileTotalSize * 1.0 / 1048576 > 2000.0) {
      echo = echo + "total file size is " + fileTotalSize * 1.0 / 1048576 + " beyond 2000MB";
      flag = false;
    }
    log.debug("fileTotalSize:" + fileTotalSize * 1.0 / 1048576 + "MB");

    if (flag) {
      try {
	String rootPath = getText("gwacDataRootDirectory");
	String gwacCatalogs = getText("gwacCatalogs");
	if (rootPath.charAt(rootPath.length() - 1) != '/') {
	  rootPath += "/";
	}
	String tcamName = obsCatFileName.substring(0, 4);//G021_mon_objt_181214T11194212.Fcat
	int TIdx = obsCatFileName.indexOf('T');
	String dateStr = obsCatFileName.substring(TIdx - 6, TIdx);
	String relativePath = dateStr + "/" + tcamName;
	String storePath = rootPath + gwacCatalogs + "/" + relativePath;
	File tfile = new File(storePath);
	if (!tfile.exists()) {
	  tfile.mkdirs();
	}
	
	i = 0;
	try {
	  if (obsCat != null) {
	    String tfilename = obsCatFileName;
	    log.debug("receive file " + tfilename);
	    File destFile = new File(storePath, tfilename);
	    //如果存在，必须删除，否则FileUtils.moveFile报错FileExistsException
	    if (destFile.exists()) {
	      log.warn(destFile + " already exist, delete it.");
	      FileUtils.forceDelete(destFile);
	    }
	    FileUtils.moveFile(obsCat, destFile);
	  }
	  if (tmpCat != null) {
	    String tfilename = tmpCatFileName;
	    log.debug("receive file " + tfilename);
	    File destFile = new File(storePath, tfilename);
	    if (destFile.exists()) {
	      log.warn(destFile + " already exist, delete it.");
	      FileUtils.forceDelete(destFile);
	    }
	    FileUtils.moveFile(tmpCat, destFile);
	  }

	  TemplateCatalog tmpCat1 = new TemplateCatalog();
	  tmpCat1.setName(tmpCatFileName);
	  tmpCat1.setPath(relativePath);
	  tmpCat1.setDateUt(tmpDateTime);
	  tmpCat1.setCamName(tmpCcdName);
	  tmpCat1.setSkyName(tmpFieldName);
	  if (!tmpCatDao.exist(tmpCat1)) {
	    tmpCatDao.save(tmpCat1);
	  }
	  ObjectCatalog objCat1 = new ObjectCatalog();
	  objCat1.setName(obsCatFileName);
	  objCat1.setPath(relativePath);
	  objCat1.setDateUt(obsDateTime);
	  objCat1.setCamName(obsCcdName);
	  objCat1.setSkyName(obsFieldName);
	  objCat1.setTcId(tmpCat1.getTcId());
	  objCat1.setIsUpload(true);
	  objCat1.setIsProcess(false);
	  objCatDao.save(objCat1);

	  echo = "upload success";
	} catch (IOException ex) {
	  log.error("delete or move file errror ", ex);
	  echo = "upload failure";
	}
	endTime = System.nanoTime();
      } catch (Exception ex) {
	log.error("delete or move file errror ", ex);
	echo = "upload failure";
      }
    } else {
      result = ERROR;
    }

    double time1 = 1.0 * (endTime - startTime) / 1e9;
    log.debug("upload  total time: " + time1 + "s, ");

    log.debug(echo);
    sendResultMsg(echo);
    return null;
  }

  public void sendResultMsg(String msg) {

    HttpServletResponse response = ServletActionContext.getResponse();
    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out;
    try {
      out = response.getWriter();
      out.print(msg);
    } catch (IOException ex) {
      log.error("response error: ", ex);
    }
  }

  /**
   * @return the echo
   */
  public String getEcho() {
    return echo;
  }

}
