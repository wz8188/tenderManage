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
        logBefore(logger, Jurisdiction.getUsername() + "新增TmProjectTenders");
        if (!Jurisdiction.buttonJurisdiction(menuUrl, "add")) {
            return null;
        } //校验权限
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        tmprojecttendersService.deleteAllByProjectId(pd);//根据项目id删除全部标段
        if (pd.containsKey("ajaxData[]")){//若为空,则不执行下面的代码
            ArrayList<String> ajaxDataArray = new ArrayList<>();
            if (pd.get("ajaxData[]").getClass().isArray()){//判断是否是一行数据,因为一行数据时不是数组
                ajaxDataArray = new ArrayList<String>(Arrays.asList((String[])pd.get("ajaxData[]")));
            }else {//只有一行数据时也处理成数组
                ajaxDataArray.add((String)pd.get("ajaxData[]"));
            }
            String[] arrayData = ajaxDataArray.toArray(new String[ajaxDataArray.size()]);//将ArrayList转换成String[]

            JSONArray jsonArray = new JSONArray();
            for (String str : arrayData) {
                JSONObject jsonObject = JSONObject.fromObject(str);
                jsonObject.put("TMPROJECTTENDERS_ID", this.get32UUID());//为每一个标段添加一个uuid
                jsonObject.put("QUOTES", jsonObject.getString("QUOTES").isEmpty() ? null : jsonObject.getString("QUOTES"));//若报价分上限为空则置空
                jsonArray.add(jsonObject);
            }

            tmprojecttendersService.saveAll((List)jsonArray);
        }
        mv.addObject("msg", "success");
        mv.setViewName("save_result");
        return mv;
    }

    /**
     * 删除
     *
     * @param out
     * @throws Exception
     */
    @RequestMapping(value = "/delete")
    public void delete(PrintWriter out) throws Exception {
        logBefore(logger, Jurisdiction.getUsername() + "删除TmProjectTenders");
        if (!Jurisdiction.buttonJurisdiction(menuUrl, "del")) {
            return;
        } //校验权限
        PageData pd = new PageData();
        pd = this.getPageData();
        tmprojecttendersService.delete(pd);
        out.write("success");
        out.close();
    }

    /**
     * 修改
     *
     * @param
     * @throws Exception
     */
    @RequestMapping(value = "/edit")
    public ModelAndView edit() throws Exception {
        logBefore(logger, Jurisdiction.getUsername() + "修改TmProjectTenders");
        if (!Jurisdiction.buttonJurisdiction(menuUrl, "edit")) {
            return null;
        } //校验权限
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        tmprojecttendersService.edit(pd);
        mv.addObject("msg", "success");
        mv.setViewName("save_result");
        return mv;
    }

    /**
     * 列表
     *
     * @param page
     * @throws Exception
     */
    @RequestMapping(value = "/list")
    public ModelAndView list(Page page) throws Exception {
        logBefore(logger, Jurisdiction.getUsername() + "列表TmProjectTenders");
        //if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        String keywords = pd.getString("keywords");                //关键词检索条件
        if (null != keywords && !"".equals(keywords)) {
            pd.put("keywords", keywords.trim());
        }
        page.setPd(pd);
        List<PageData> varList = tmprojecttendersService.list(page);    //列出TmProjectTenders列表
        mv.setViewName("tm/tmprojecttenders/tmprojecttenders_list");
        mv.addObject("varList", varList);
        mv.addObject("pd", pd);
        mv.addObject("QX", Jurisdiction.getHC());    //按钮权限
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
     * 去修改页面
     *
     * @param
     * @throws Exception
     */
    @RequestMapping(value = "/goEdit")
    public ModelAndView goEdit() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        pd = tmprojecttendersService.findById(pd);    //根据ID读取
        mv.setViewName("tm/tmprojecttenders/tmprojecttenders_edit");
        mv.addObject("msg", "edit");
        mv.addObject("pd", pd);
        return mv;
    }

    /**
     * 批量删除
     *
     * @param
     * @throws Exception
     */
    @RequestMapping(value = "/deleteAll")
    @ResponseBody
    public Object deleteAll() throws Exception {
        logBefore(logger, Jurisdiction.getUsername() + "批量删除TmProjectTenders");
        if (!Jurisdiction.buttonJurisdiction(menuUrl, "del")) {
            return null;
        } //校验权限
        PageData pd = new PageData();
        Map<String, Object> map = new HashMap<String, Object>();
        pd = this.getPageData();
        List<PageData> pdList = new ArrayList<PageData>();
        String DATA_IDS = pd.getString("DATA_IDS");
        if (null != DATA_IDS && !"".equals(DATA_IDS)) {
            String ArrayDATA_IDS[] = DATA_IDS.split(",");
            tmprojecttendersService.deleteAll(ArrayDATA_IDS);
            pd.put("msg", "ok");
        } else {
            pd.put("msg", "no");
        }
        pdList.add(pd);
        map.put("list", pdList);
        return AppUtil.returnObject(pd, map);
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
