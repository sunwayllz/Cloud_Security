package com.ctbri.vo;

public class CsServiceType {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column cs_service_type.id
     *
     * @mbggenerated Thu Oct 22 09:40:42 CST 2015
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column cs_service_type.name
     *
     * @mbggenerated Thu Oct 22 09:40:42 CST 2015
     */
    private String name;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column cs_service_type.id
     *
     * @return the value of cs_service_type.id
     *
     * @mbggenerated Thu Oct 22 09:40:42 CST 2015
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column cs_service_type.id
     *
     * @param id the value for cs_service_type.id
     *
     * @mbggenerated Thu Oct 22 09:40:42 CST 2015
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column cs_service_type.name
     *
     * @return the value of cs_service_type.name
     *
     * @mbggenerated Thu Oct 22 09:40:42 CST 2015
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column cs_service_type.name
     *
     * @param name the value for cs_service_type.name
     *
     * @mbggenerated Thu Oct 22 09:40:42 CST 2015
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
}