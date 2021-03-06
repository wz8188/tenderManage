package com.fh.service.tm.tmprojecttenders;

import java.util.List;
import java.util.Map;

import com.fh.entity.Page;
import com.fh.util.PageData;

/** 
 * 说明： 项目的标段接口
 * 创建人：FH Q313596790
 * 创建时间：2017-06-03
 * @version
 */
public interface TmProjectTendersManager{

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception;
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;


    /**
     * 根据项目id查找标段集合
     * @param pd
     * @return
     * @throws Exception
     */
	public List<PageData> findByProjectId(PageData pd) throws Exception;


    /**
     * 批量插入数据
     * @param mapList
     * @throws Exception
     */
	public void saveAll(List<Map<String,Object>> mapList) throws Exception;


    /**
     * 根据项目id删除全部标段
     * @param pd
     * @throws Exception
     */
	public void deleteAllByProjectId(PageData pd) throws Exception;


    /**
     * 先根据项目id删除全部标段及标段相关关联数据,然后将新增的标段插入
     * @param pd
     * @throws Exception
     */
	public void tranManageAll(PageData pd) throws Exception;
}

