package com.fh.controller.tm.tmprojecttenders;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.annotation.Resource;

import com.fh.service.tm.tmprojectservicetype.TmProjectServiceTypeManager;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
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
import com.fh.service.tm.tmprojecttenders.TmProjectTendersManager;

/**
 * 说明：项目的标段
 * 创建人：FH Q313596790
 * 创建时间：2017-06-03
 */
@Controller
@RequestMapping(value = "/tmprojecttenders")
public class TmProjectTendersController extends BaseController {

    String menuUrl = "tmprojecttenders/list.do"; //菜单地址(权限用)
    @Resource(name = "tmprojecttendersService")
    private TmProjectTendersManager tmprojecttendersService;

    @Resource(name = "tmprojectservicetypeService")
    private TmProjectServiceTypeManager tmprojectservicetypeService;//项目服务类型的service

    /**
     * 保存
     *
     * @param
     * @throws Exception
     */
    @RequestMapping(value = "/save")
    public ModelAndView save() throws Exception {
        logBefore(logger, Jurisdiction.getUsername() + "事务处理TmProjectTenders");
        if (!Jurisdiction.buttonJurisdiction(menuUrl, "add")) {
            return null;
        } //校验权限
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        tmprojecttendersService.tranManageAll(pd);//事务处理
        mv.addObject("msg", "success");
        mv.setViewName("save_result");
        return mv;
    }

    /**
     * 去管理标段页面
     *
     * @param
     * @throws Exception
     */
    @RequestMapping(value = "/goAdd")
    public ModelAndView goAdd() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        mv.setViewName("tm/tmprojecttenders/tmprojecttenders_edit");
        mv.addObject("msg", "save");
        mv.addObject("pd", pd);//项目id  PROJECT_ID
        mv.addObject("tenders", tmprojecttendersService.findByProjectId(pd));//根据项目id查到当前所有标段
        mv.addObject("projectServiceTypeList", tmprojectservicetypeService.listAll(null));//项目服务类别
        return mv;
    }

    /**
     * 导出到excel
     *
     * @param
     * @throws Exception
     */
    @RequestMapping(value = "/excel")
    public ModelAndView exportExcel() throws Exception {
        logBefore(logger, Jurisdiction.getUsername() + "导出TmProjectTenders到excel");
        if (!Jurisdiction.buttonJurisdiction(menuUrl, "cha")) {
            return null;
        }
        ModelAndView mv = new ModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        Map<String, Object> dataMap = new HashMap<String, Object>();
        List<String> titles = new ArrayList<String>();
        titles.add("归属项目id");    //1
        titles.add("项目标段名称");    //2
        titles.add("报价分上限");    //3
        titles.add("标段服务类别");    //4
        dataMap.put("titles", titles);
        List<PageData> varOList = tmprojecttendersService.listAll(pd);
        List<PageData> varList = new ArrayList<PageData>();
        for (int i = 0; i < varOList.size(); i++) {
            PageData vpd = new PageData();
            vpd.put("var1", varOList.get(i).getString("PROJECT_ID"));        //1
            vpd.put("var2", varOList.get(i).getString("PROJECT_TENDER_NAME"));        //2
            vpd.put("var3", varOList.get(i).get("QUOTES").toString());    //3
            vpd.put("var4", varOList.get(i).get("SERVICE_TYPE").toString());    //4
            varList.add(vpd);
        }
        dataMap.put("varList", varList);
        ObjectExcelView erv = new ObjectExcelView();
        mv = new ModelAndView(erv, dataMap);
        return mv;
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(format, true));
    }
}
