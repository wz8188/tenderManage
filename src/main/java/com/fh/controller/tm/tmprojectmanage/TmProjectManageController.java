package com.fh.controller.tm.tmprojectmanage;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import com.fh.entity.fhoa.Staff;
import com.fh.service.fhoa.department.DepartmentManager;
import com.fh.service.tm.tmcooperationunit.TmCooperationUnitManager;
import com.fh.service.tm.tmdistrictownership.TmDistrictOwnershipManager;
import com.fh.service.tm.tmprojectlocation.TmProjectLocationManager;
import com.fh.service.tm.tmprojectservicetype.TmProjectServiceTypeManager;
import com.fh.service.tm.tmtendertype.TmTenderTypeManager;
import com.fh.util.*;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.tm.tmprojectmanage.TmProjectManageManager;

/**
 * 说明：项目管理
 * 创建人：FH Q313596790
 * 创建时间：2017-05-26
 */
@Controller
@RequestMapping(value = "/tmprojectmanage")
public class TmProjectManageController extends BaseController {

    String menuUrl = "tmprojectmanage/list.do"; //菜单地址(权限用)
    @Resource(name = "tmprojectmanageService")
    private TmProjectManageManager tmprojectmanageService;//管理项目的service

    @Resource(name = "departmentService")
    private DepartmentManager departmentService;//组织机构(归属部门)的service

    @Resource(name = "tmprojectlocationService")
    private TmProjectLocationManager tmprojectlocationService;//项目地点的service

    @Resource(name = "tmdistrictownershipService")
    private TmDistrictOwnershipManager tmdistrictownershipService;//归属区域或运行商的service

    @Resource(name = "tmprojectservicetypeService")
    private TmProjectServiceTypeManager tmprojectservicetypeService;//项目服务类型的service

    @Resource(name = "tmtendertypeService")
    private TmTenderTypeManager tmtendertypeService;//招标类别的service

    @Resource(name = "tmcooperationunitService")
    private TmCooperationUnitManager tmcooperationunitService;//合作公司的service

    /**
     * 保存
     *
     * @param
     * @throws Exception
     */
    @RequestMapping(value = "/save")
    public ModelAndView save() throws Exception {
        logBefore(logger, Jurisdiction.getUsername() + "新增TmProjectManage");
        if (!Jurisdiction.buttonJurisdiction(menuUrl, "add")) {
            return null;
        } //校验权限
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        pd.put("TMPROJECTMANAGE_ID", this.get32UUID());    //主键
        Staff staff = (Staff) Jurisdiction.getSession().getAttribute(Const.SESSION_STAFF);
        pd.put("PRINCIPAL", staff.getStaff_id());    //负责人
        pd.put("CREATE_TIME", Tools.date2Str(new Date()));    //创建时间
        pd.put("IS_EXTRACT_EXPERT", "0");    //0:未抽取 1:已抽取
        pd.put("IS_STATUS", "1");//状态 0:可归档 1:不可归档
        pd.put("IS_RECORD_STATUS", "1");//是否还提醒备案 0:不提醒 1:提醒
        pd.put("COOPERATION_UNIT", pd.getString("COOPERATION_UNIT").isEmpty() ? null : pd.getString("COOPERATION_UNIT"));
        pd.put("INCOME_DISTRIBUTION", pd.getString("INCOME_DISTRIBUTION").isEmpty() ? null : pd.getString("INCOME_DISTRIBUTION"));
        tmprojectmanageService.save(pd);
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
        logBefore(logger, Jurisdiction.getUsername() + "删除TmProjectManage");
        if (!Jurisdiction.buttonJurisdiction(menuUrl, "del")) {
            return;
        } //校验权限
        PageData pd = new PageData();
        pd = this.getPageData();
        tmprojectmanageService.delete(pd);
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
        logBefore(logger, Jurisdiction.getUsername() + "修改TmProjectManage");
        if (!Jurisdiction.buttonJurisdiction(menuUrl, "edit")) {
            return null;
        } //校验权限
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        pd.put("COOPERATION_UNIT", pd.getString("COOPERATION_UNIT").isEmpty() ? null : pd.getString("COOPERATION_UNIT"));
        pd.put("INCOME_DISTRIBUTION", pd.getString("INCOME_DISTRIBUTION").isEmpty() ? null : pd.getString("INCOME_DISTRIBUTION"));
        tmprojectmanageService.edit(pd);
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
        logBefore(logger, Jurisdiction.getUsername() + "列表TmProjectManage");
        //if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        String keywords = pd.getString("keywords");                //关键词检索条件
        if (null != keywords && !"".equals(keywords)) {
            pd.put("keywords", keywords.trim());
        }
        page.setPd(pd);
        List<PageData> varList = tmprojectmanageService.list(page);    //列出TmProjectManage列表

        //将项目服务类别更改为相应名称
        List<PageData> serviceTypeModel = tmprojectservicetypeService.listAll(null);
        HashMap<String, String> serviceTypeHash = new HashMap<>();
        for (PageData serviceType : serviceTypeModel) {
            serviceTypeHash.put(serviceType.get("TMPROJECTSERVICETYPE_ID").toString(), serviceType.getString("PST_NAME"));
        }

        for (PageData project : varList) {
            String tempServiceNames = "暂未设置标段";
            if (project.get("PROJECT_SERVICE_TYPES") != null && !project.getString("PROJECT_SERVICE_TYPES").isEmpty()) {
                tempServiceNames = "";
                String[] serviceTypes = project.getString("PROJECT_SERVICE_TYPES").split(",");
                for (int i = 0; i < serviceTypes.length; i++) {
                    tempServiceNames += serviceTypeHash.get(serviceTypes[i]).replaceAll("招标", "") + ",";
                }
                tempServiceNames = tempServiceNames.substring(0, tempServiceNames.length() - 1);
            }
            project.put("PROJECT_SERVICE_TYPES", tempServiceNames);
        }

        mv.setViewName("tm/tmprojectmanage/tmprojectmanage_list");
        mv.addObject("varList", varList);
        mv.addObject("pd", pd);
        mv.addObject("QX", Jurisdiction.getHC());    //按钮权限
        return mv;
    }

    /**
     * 去新增页面
     *
     * @param
     * @throws Exception
     */
    @RequestMapping(value = "/goAdd")
    public ModelAndView goAdd() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        mv.setViewName("tm/tmprojectmanage/tmprojectmanage_edit");
        mv.addObject("msg", "save");
        mv.addObject("pd", pd);
        mv.addObject("deplist", departmentService.listAllDepartmentWithoutFilter(null));//归属部门
        mv.addObject("projectLocationList", tmprojectlocationService.listAll(null));//项目地点
        mv.addObject("districtOwnershipList", tmdistrictownershipService.listAll(null));//归属区域或运营商
        mv.addObject("tenderTypeList", tmtendertypeService.listAll(null));//招标类别
        mv.addObject("cooperationUnitList", tmcooperationunitService.listAll(null));//合作公司
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
        pd = tmprojectmanageService.findById(pd);    //根据ID读取
        mv.setViewName("tm/tmprojectmanage/tmprojectmanage_edit");
        mv.addObject("msg", "edit");
        mv.addObject("pd", pd);
        mv.addObject("deplist", departmentService.listAllDepartmentWithoutFilter(null));//归属部门
        mv.addObject("projectLocationList", tmprojectlocationService.listAll(null));//项目地点
        mv.addObject("districtOwnershipList", tmdistrictownershipService.listAll(null));//归属区域或运营商
        mv.addObject("tenderTypeList", tmtendertypeService.listAll(null));//招标类别
        mv.addObject("cooperationUnitList", tmcooperationunitService.listAll(null));//合作公司
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
        logBefore(logger, Jurisdiction.getUsername() + "批量删除TmProjectManage");
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
            tmprojectmanageService.deleteAll(ArrayDATA_IDS);
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
        logBefore(logger, Jurisdiction.getUsername() + "导出TmProjectManage到excel");
        if (!Jurisdiction.buttonJurisdiction(menuUrl, "cha")) {
            return null;
        }
        ModelAndView mv = new ModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        Map<String, Object> dataMap = new HashMap<String, Object>();
        List<String> titles = new ArrayList<String>();
        titles.add("项目编号");    //1
        titles.add("项目名称");    //2
        titles.add("开标时间");    //3
        titles.add("开标地点");    //4
        titles.add("归属部门(自动获取当前业务人员的部门,不可选择别的部门)");    //5
        titles.add("项目地点(省公司项目选择黑龙江省,分公司项目选择哈尔滨市)");    //6
        titles.add("负责人");    //7
        titles.add("归属区域");    //8
        titles.add("中标服务费类别  0:预收 1:直收");    //9
        titles.add("项目服务类别,逗号分隔");    //10
        titles.add("招标类别");    //11
        titles.add("0:非国发合作项目 1:国发合作项目");    //12
        titles.add("备注(如果遇到废标,就追加原因)");    //13
        titles.add("状态 0:可归档 1:不可归档");    //14
        titles.add("创建时间");    //15
        titles.add("归档时间");    //16
        titles.add("备案提醒起始日期");    //17
        titles.add("是否还提醒备案 0:不提醒 1:提醒");    //18
        titles.add("0:未抽取 1:已抽取");    //19
        dataMap.put("titles", titles);
        List<PageData> varOList = tmprojectmanageService.listAll(pd);
        List<PageData> varList = new ArrayList<PageData>();
        for (int i = 0; i < varOList.size(); i++) {
            PageData vpd = new PageData();
            vpd.put("var1", varOList.get(i).getString("TM_PROJECT_NUMBER"));        //1
            vpd.put("var2", varOList.get(i).getString("PROJECT_NAME"));        //2
            vpd.put("var3", varOList.get(i).getString("BID_OPENING_TIME"));        //3
            vpd.put("var4", varOList.get(i).getString("BID_OPENING_LOCATION"));        //4
            vpd.put("var5", varOList.get(i).get("ATTRIBUTION_DEPARTMENT").toString());    //5
            vpd.put("var6", varOList.get(i).get("PROJECT_LOCATION").toString());    //6
            vpd.put("var7", varOList.get(i).getString("PRINCIPAL"));        //7
            vpd.put("var8", varOList.get(i).get("DISTRICT_OWNERSHIP").toString());    //8
            vpd.put("var9", varOList.get(i).get("SERVICE_FEE_CATEGORY").toString());    //9
            vpd.put("var10", varOList.get(i).getString("PROJECT_SERVICE_TYPES"));        //10
            vpd.put("var11", varOList.get(i).get("TENDER_TYPE").toString());    //11
            vpd.put("var12", varOList.get(i).get("IS_NATIONAL").toString());    //12
            vpd.put("var13", varOList.get(i).getString("COMMENT"));        //13
            vpd.put("var14", varOList.get(i).get("IS_STATUS").toString());    //14
            vpd.put("var15", varOList.get(i).getString("CREATE_TIME"));        //15
            vpd.put("var16", varOList.get(i).getString("ARCHIVING_TIME"));        //16
            vpd.put("var17", varOList.get(i).getString("RECORD_REMINDER_TIME"));        //17
            vpd.put("var18", varOList.get(i).get("IS_RECORD_STATUS").toString());    //18
            vpd.put("var19", varOList.get(i).get("IS_EXTRACT_EXPERT").toString());    //19
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
