package com.fh.controller.tm.tmprojecttenderassociation;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
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
import com.fh.service.tm.tmprojecttenderassociation.TmProjectTenderAssociationManager;

/** 
 * 说明：项目与投标单位关联表
 * 创建人：FH Q313596790
 * 创建时间：2017-05-26
 */
@Controller
@RequestMapping(value="/tmprojecttenderassociation")
public class TmProjectTenderAssociationController extends BaseController {
	
	String menuUrl = "tmprojecttenderassociation/list.do"; //菜单地址(权限用)
	@Resource(name="tmprojecttenderassociationService")
	private TmProjectTenderAssociationManager tmprojecttenderassociationService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增TmProjectTenderAssociation");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("TMPROJECTTENDERASSOCIATION_ID", this.get32UUID());	//主键
		pd.put("PROJECT_ID", "");	//项目id
		pd.put("REFUND_TIME", Tools.date2Str(new Date()));	//退费时间
		pd.put("TOTAL_RECEIVABLES", "0");	//应收款合计
		pd.put("TOTAL_REFUNDS", "0");	//应退款合计
		pd.put("ACTUAL_INCOME", "0");	//实习收入
		pd.put("CREATE_TIME", Tools.date2Str(new Date()));	//创建时间
		tmprojecttenderassociationService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除TmProjectTenderAssociation");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		tmprojecttenderassociationService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改TmProjectTenderAssociation");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		tmprojecttenderassociationService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表TmProjectTenderAssociation");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = tmprojecttenderassociationService.list(page);	//列出TmProjectTenderAssociation列表
		mv.setViewName("tm/tmprojecttenderassociation/tmprojecttenderassociation_list");
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
		mv.setViewName("tm/tmprojecttenderassociation/tmprojecttenderassociation_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
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
		pd = tmprojecttenderassociationService.findById(pd);	//根据ID读取
		mv.setViewName("tm/tmprojecttenderassociation/tmprojecttenderassociation_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除TmProjectTenderAssociation");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			tmprojecttenderassociationService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出TmProjectTenderAssociation到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("项目id");	//1
		titles.add("投标单位id");	//2
		titles.add("保证金(业务)");	//3
		titles.add("标书款(业务)");	//4
		titles.add("保证金(财务)");	//5
		titles.add("标书款(财务)");	//6
		titles.add("财务收费渠道 1:现金 2:银行");	//7
		titles.add("退费金");	//8
		titles.add("退费渠道 1现金 2银行");	//9
		titles.add("退费时间");	//10
		titles.add("退费到帐时间");	//11
		titles.add("服务费");	//12
		titles.add("是否通知领导修改 0:不通知 1:通知");	//13
		titles.add("折扣率");	//14
		titles.add("应收款合计");	//15
		titles.add("应退款合计");	//16
		titles.add("实习收入");	//17
		titles.add("创建时间");	//18
		titles.add("中标状态 0:待评标 1:中标 2:未中标(如果又交钱,则自动新增一条新数据) 3:中标完结 4:未中标完结");	//19
		dataMap.put("titles", titles);
		List<PageData> varOList = tmprojecttenderassociationService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("PROJECT_ID"));	    //1
			vpd.put("var2", varOList.get(i).getString("TENDER_UNIT_ID"));	    //2
			vpd.put("var3", varOList.get(i).get("MARGIN_BUSINESS").toString());	//3
			vpd.put("var4", varOList.get(i).get("TENDER_SECTION_BUSINESS").toString());	//4
			vpd.put("var5", varOList.get(i).get("MARGIN_FINANCE").toString());	//5
			vpd.put("var6", varOList.get(i).get("TENDER_SECTION_FINANCE").toString());	//6
			vpd.put("var7", varOList.get(i).get("FINANCE_CHARGE_CHANNELS").toString());	//7
			vpd.put("var8", varOList.get(i).get("REFUND_FEE").toString());	//8
			vpd.put("var9", varOList.get(i).get("REFUND_CHANNEL").toString());	//9
			vpd.put("var10", varOList.get(i).getString("REFUND_TIME"));	    //10
			vpd.put("var11", varOList.get(i).getString("REFUND_TIME_TO_ARRIVE"));	    //11
			vpd.put("var12", varOList.get(i).get("SERVICE_CHARGE").toString());	//12
			vpd.put("var13", varOList.get(i).get("SERVICE_CHARGE_FLAG").toString());	//13
			vpd.put("var14", varOList.get(i).get("DISCOUNT_RATE").toString());	//14
			vpd.put("var15", varOList.get(i).get("TOTAL_RECEIVABLES").toString());	//15
			vpd.put("var16", varOList.get(i).get("TOTAL_REFUNDS").toString());	//16
			vpd.put("var17", varOList.get(i).get("ACTUAL_INCOME").toString());	//17
			vpd.put("var18", varOList.get(i).getString("CREATE_TIME"));	    //18
			vpd.put("var19", varOList.get(i).get("BID_STATUS").toString());	//19
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
