package com.ctbri.dao;

import com.ctbri.vo.CsTaskwarn;

public interface CsTaskwarnMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cs_taskwarn
     *
     * @mbggenerated Thu Oct 22 09:40:42 CST 2015
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cs_taskwarn
     *
     * @mbggenerated Thu Oct 22 09:40:42 CST 2015
     */
    int insert(CsTaskwarn record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cs_taskwarn
     *
     * @mbggenerated Thu Oct 22 09:40:42 CST 2015
     */
    int insertSelective(CsTaskwarn record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cs_taskwarn
     *
     * @mbggenerated Thu Oct 22 09:40:42 CST 2015
     */
    CsTaskwarn selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cs_taskwarn
     *
     * @mbggenerated Thu Oct 22 09:40:42 CST 2015
     */
    int updateByPrimaryKeySelective(CsTaskwarn record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cs_taskwarn
     *
     * @mbggenerated Thu Oct 22 09:40:42 CST 2015
     */
    int updateByPrimaryKey(CsTaskwarn record);
}