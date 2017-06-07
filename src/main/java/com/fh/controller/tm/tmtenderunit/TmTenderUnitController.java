package com.fh.controller.tm.tmtenderunit;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import com.fh.service.tm.tmtenderunittype.TmTenderUnitTypeManager;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.util.AppUtil;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.util.Tools;
import com.fh.service.tm.tmtenderunit.TmTenderUnitManager;
import com.fh.service.tm.tmecerttype.TmEcertTypeManager;
import com.fh.service.tm.tmtenderecert.TmTenderEcertManager;

/** 
 * 说明：投标单位管理
 * 创建人：FH Q313596790
 * 创建时间：2017-05-25
 */
@Controller
@RequestMapping(value="/tmtenderunit")
public class TmTenderUnitController extends BaseController {
	
	String menuUrl = "tmtenderunit/list.do"; //菜单地址(权限用)
	@Resource(name="tmtenderunitService")
	private TmTenderUnitManager tmtenderunitService;

	@Resource(name="tmtenderunittypeService")
	private TmTenderUnitTypeManager tmtenderunittypeService;
	//注入，因为在goAdd()中访问了另外一个表单的service

	@Resource(name="tmecerttypeService")
	private TmEcertTypeManager tmecerttypeService;
	@Resource(name="tmtenderecertService")
	private TmTenderEcertManager tmtenderecertService;
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增TmTenderUnit");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		/*String mainKey = this.get32UUID();*///主键
	/*	String mainKey2 = this.get32UUID();*///主键2
		pd.put("TMTENDERUNIT_ID",  this.get32UUID());
		pd.put("TMTENDERECERT_ID",this.get32UUID());
		pd.put("CREATE_TIME", Tools.date2Str(new Date()));	//创建时间
		tmtenderunitService.save(pd);
		tmtenderecertService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除TmTenderUnit");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();

		PageData pd2 = new PageData();
		pd2=tmtenderecertService.findById(pd);
		tmtenderecertService.delete(pd2);
		tmtenderunitService.delete(pd);


		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改TmTenderUnit");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();/*
		PageData pd2 = new PageData();
		pd2=tmtenderecertService.findById(pd);*/
		tmtenderecertService.edit(pd);
		tmtenderunitService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表TmTenderUnit");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = tmtenderunitService.list(page);	//列出TmTenderUnit列表
		mv.setViewName("tm/tmtenderunit/tmtenderunit_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("tm/tmtenderunit/tmtenderunit_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		List<PageData>	tmtenderunittypes = tmtenderunittypeService.listAll(null);
		//后台获取数据保存在tmtenderunittypes 中
		mv.addObject("tmtenderunittypes",tmtenderunittypes);
		//将数据传给前端页面
		List<PageData>	tmecerttypes = tmecerttypeService.listAll(null);
		//配置表证书类型：包括证书id TMECERTTYPE_ID，证书类型名称 ECERT_NAME  和创建时间
		mv.addObject("tmecerttypes",tmecerttypes);
		List<PageData>	tmtenderecerts = tmtenderecertService.listAll(null);
		//关联表电子证书：包括 证书id TMTENDERECERT_ID 投标单位 TENDER_UNIT_ID，证书类型ECERT_TYPE，证书名称 ECERT_NAME，图片url 和创建时间
		mv.addObject("tmtenderecerts",tmtenderecerts);
		return mv;
	}	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = tmtenderunitService.findById(pd);	//根据ID读取
		PageData pd2 = new PageData();
		pd2 = this.getPageData();
		pd2 = tmtenderecertService.findById(pd);	//根据ID读取
		mv.setViewName("tm/tmtenderunit/tmtenderunit_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		mv.addObject("pd2", pd2);
		List<PageData>	tmtenderunittypes = tmtenderunittypeService.listAll(null);
		//后台获取数据保存在tmtenderunittypes 中
		mv.addObject("tmtenderunittypes",tmtenderunittypes);
		//将数据传给前端页面
		List<PageData>	tmecerttypes = tmecerttypeService.listAll(null);
		//配置表证书类型：包括证书id TMECERTTYPE_ID，证书类型名称 ECERT_NAME  和创建时间
		mv.addObject("tmecerttypes",tmecerttypes);
		List<PageData>	tmtenderecerts = tmtenderecertService.listAll(null);
		//关联表电子证书：包括 证书id TMTENDERECERT_ID 投标单位 TENDER_UNIT_ID，证书类型ECERT_TYPE，证书名称 ECERT_NAME，图片url 和创建时间
		mv.addObject("tmtenderecerts",tmtenderecerts);
		return mv;
	}	
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除TmTenderUnit");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			tmtenderunitService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出TmTenderUnit到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("投标单位名称");	//1
		titles.add("投标人名称");	//2
		titles.add("单位地址");	//3
		titles.add("联系人");	//4
		titles.add("联系电话");	//5
		titles.add("电子邮箱");	//6
		titles.add("单位分类");	//7
		titles.add("开户银行");	//8
		titles.add("银行账户");	//9
		titles.add("创建时间");	//10
		dataMap.put("titles", titles);
		List<PageData> varOList = tmtenderunitService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("TENDER_UNIT_NAME"));	    //1
			vpd.put("var2", varOList.get(i).getString("TENDER_USER_NAME"));	    //2
			vpd.put("var3", varOList.get(i).getString("UNIT_LOCATION"));	    //3
			vpd.put("var4", varOList.get(i).getString("CONTACT_PERSON"));	    //4
			vpd.put("var5", varOList.get(i).getString("CONTACT_PHONE"));	    //5
			vpd.put("var6", varOList.get(i).getString("CONTACT_EMAIL"));	    //6
			vpd.put("var7", varOList.get(i).get("TENDER_UNIT_TYPE").toString());	//7
			vpd.put("var8", varOList.get(i).getString("BANK"));	    //8
			vpd.put("var9", varOList.get(i).getString("BANK_ACCOUNT"));	    //9
			vpd.put("var10", varOList.get(i).getString("CREATE_TIME"));	    //10
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
