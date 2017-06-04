package com.fh.service.tm.tmprojecttenders.impl;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.tm.tmprojecttenders.TmProjectTendersManager;

/** 
 * 说明： 项目的标段
 * 创建人：FH Q313596790
 * 创建时间：2017-06-03
 * @version
 */
@Service("tmprojecttendersService")
public class TmProjectTendersService implements TmProjectTendersManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("TmProjectTendersMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("TmProjectTendersMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("TmProjectTendersMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("TmProjectTendersMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("TmProjectTendersMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("TmProjectTendersMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
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
        return (List<PageData>)dao.findForList("TmProjectTendersMapper.findByProjectId", pd);
    }

    /**
     * 批量插入数据
     *
     * @param mapList
     * @throws Exception
     */
    @Override
    public void saveAll(List<Map<String, Object>> mapList) throws Exception {
        dao.save("TmProjectTendersMapper.saveAll",mapList);
    }

    /**
     * 根据项目id删除全部标段
     *
     * @param pd
     * @throws Exception
     */
    @Override
    public void deleteAllByProjectId(PageData pd) throws Exception {
        dao.delete("TmProjectTendersMapper.deleteAllByProjectId",pd);
    }
}

