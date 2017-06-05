package com.fh.service.tm.tmprojecttenders.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import com.fh.util.UuidUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.tm.tmprojecttenders.TmProjectTendersManager;
import org.springframework.transaction.TransactionException;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 * 说明： 项目的标段
 * 创建人：FH Q313596790
 * 创建时间：2017-06-03
 */
@Service("tmprojecttendersService")
public class TmProjectTendersService implements TmProjectTendersManager {

    @Resource(name = "daoSupport")
    private DaoSupport dao;

    /**
     * 新增
     *
     * @param pd
     * @throws Exception
     */
    public void save(PageData pd) throws Exception {
        dao.save("TmProjectTendersMapper.save", pd);
    }

    /**
     * 删除
     *
     * @param pd
     * @throws Exception
     */
    public void delete(PageData pd) throws Exception {
        dao.delete("TmProjectTendersMapper.delete", pd);
    }

    /**
     * 修改
     *
     * @param pd
     * @throws Exception
     */
    public void edit(PageData pd) throws Exception {
        dao.update("TmProjectTendersMapper.edit", pd);
    }

    /**
     * 列表
     *
     * @param page
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<PageData> list(Page page) throws Exception {
        return (List<PageData>) dao.findForList("TmProjectTendersMapper.datalistPage", page);
    }

    /**
     * 列表(全部)
     *
     * @param pd
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<PageData> listAll(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("TmProjectTendersMapper.listAll", pd);
    }

    /**
     * 通过id获取数据
     *
     * @param pd
     * @throws Exception
     */
    public PageData findById(PageData pd) throws Exception {
        return (PageData) dao.findForObject("TmProjectTendersMapper.findById", pd);
    }

    /**
     * 批量删除
     *
     * @param ArrayDATA_IDS
     * @throws Exception
     */
    public void deleteAll(String[] ArrayDATA_IDS) throws Exception {
        dao.delete("TmProjectTendersMapper.deleteAll", ArrayDATA_IDS);
    }

    /**
     * 根据项目id查找标段集合
     *
     * @param pd
     * @return
     * @throws Exception
     */
    @Override
    public List<PageData> findByProjectId(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("TmProjectTendersMapper.findByProjectId", pd);
    }

    /**
     * 批量插入数据
     *
     * @param mapList
     * @throws Exception
     */
    @Override
    public void saveAll(List<Map<String, Object>> mapList) throws Exception {
        dao.save("TmProjectTendersMapper.saveAll", mapList);
    }

    /**
     * 根据项目id删除全部标段
     *
     * @param pd
     * @throws Exception
     */
    @Override
    public void deleteAllByProjectId(PageData pd) throws Exception {
        dao.delete("TmProjectTendersMapper.deleteAllByProjectId", pd);
    }

    /**
     * 先根据项目id删除全部标段及标段相关关联数据,然后将新增的标段插入
     *
     * @param pd
     * @throws Exception
     */
    @Override
    public void tranManageAll(PageData pd) throws Exception {
        //dao.delete("TmProjectTendersMapper.deleteAllByProjectId", pd);
        this.deleteAllByProjectId(pd);
        if (pd.containsKey("ajaxData[]")) {//若为空,则不执行下面的代码
            ArrayList<String> ajaxDataArray = new ArrayList<>();
            if (pd.get("ajaxData[]").getClass().isArray()) {//判断是否是一行数据,因为一行数据时不是数组
                ajaxDataArray = new ArrayList<String>(Arrays.asList((String[]) pd.get("ajaxData[]")));
            } else {//只有一行数据时也处理成数组
                ajaxDataArray.add((String) pd.get("ajaxData[]"));
            }
            String[] arrayData = ajaxDataArray.toArray(new String[ajaxDataArray.size()]);//将ArrayList转换成String[]

            JSONArray jsonArray = new JSONArray();
            String uuid32 = UuidUtil.get32UUID();
            for (String str : arrayData) {
                JSONObject jsonObject = JSONObject.fromObject(str);

                jsonObject.put("TMPROJECTTENDERS_ID", uuid32);//为每一个标段添加一个uuid
                jsonObject.put("QUOTES", jsonObject.getString("QUOTES").isEmpty() ? null : jsonObject.getString("QUOTES"));//若报价分上限为空则置空
                jsonArray.add(jsonObject);
            }
            //dao.save("TmProjectTendersMapper.saveAll", (List) jsonArray);
            this.saveAll((List) jsonArray);
        }
    }
}

