package com.fh.entity.fhoa;

import com.fh.util.PageData;

/**
 * @author shanhq96@gmail.com
 * @ClassName Staff
 * @Description
 * @date 17-6-1-下午5:07
 */
public class Staff {
    private String staff_id;//员工id
    private String name;//中文名
    private String name_en;//英文名
    private String bianma;//编码
    private String department_id;//员工所在部门
    private String functions;//职责
    private String tel;//电话
    private String email;//邮箱
    private String sex;//性别
    private String birthday;//出生日期
    private String nation;//民族
    private String jobtype;//岗位类别
    private String jobjointime;//参加工作时间
    private String faddress;//籍贯
    private String political;//政治面貌
    private String pjointime;//入团时间
    private String sfid;//身份证号
    private String marital;//婚姻状况
    private String djointime;//进本单位时间
    private String post;//现岗位
    private String pojointime;//上岗时间
    private String education;//学历
    private String school;//毕业学校
    private String major;//专业
    private String ftitle;//职称
    private String certificate;//职业资格正
    private Long contractlength;//劳动合同时长
    private String cstarttime;//签订日期
    private String cendtime;//终止日期
    private String address;//现住址
    private String user_id;//帐号信息
    private String bz;//备注

    /**********构造器*************/
    public Staff() {
    }

    public Staff(PageData pd) {
        this.staff_id = pd.getString("STAFF_ID");
        this.name = pd.getString("NAME");
        this.name_en = pd.getString("NAME_EN");
        this.bianma = pd.getString("BIANMA");
        this.department_id = pd.getString("DEPARTMENT_ID");
        this.functions = pd.getString("FUNCTIONS");
        this.tel = pd.getString("TEL");
        this.email = pd.getString("EMAIL");
        this.sex = pd.getString("SEX");
        this.birthday = pd.getString("BIRTHDAY");
        this.nation = pd.getString("NATION");
        this.jobtype = pd.getString("JOBTYPE");
        this.jobjointime = pd.getString("JOBJOINTIME");
        this.faddress = pd.getString("FADDRESS");
        this.political = pd.getString("POLITICAL");
        this.pjointime = pd.getString("PJOINTIME");
        this.sfid = pd.getString("SFID");
        this.marital = pd.getString("MARITAL");
        this.djointime = pd.getString("DJOINTIME");
        this.post = pd.getString("POST");
        this.pojointime = pd.getString("POJOINTIME");
        this.education = pd.getString("EDUCATION");
        this.school = pd.getString("SCHOOL");
        this.major = pd.getString("MAJOR");
        this.ftitle = pd.getString("FTITLE");
        this.certificate = pd.getString("CERTIFICATE");
        this.contractlength = Long.valueOf(pd.get("CONTRACTLENGTH").toString());
        this.cstarttime = pd.getString("CSTARTTIME");
        this.cendtime = pd.getString("CENDTIME");
        this.address = pd.getString("ADDRESS");
        this.user_id = pd.getString("USER_ID");
        this.bz = pd.getString("BZ");
    }

    /********get**set*********/

    public String getStaff_id() {
        return staff_id;
    }

    public void setStaff_id(String staff_id) {
        this.staff_id = staff_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName_en() {
        return name_en;
    }

    public void setName_en(String name_en) {
        this.name_en = name_en;
    }

    public String getBianma() {
        return bianma;
    }

    public void setBianma(String bianma) {
        this.bianma = bianma;
    }

    public String getDepartment_id() {
        return department_id;
    }

    public void setDepartment_id(String department_id) {
        this.department_id = department_id;
    }

    public String getFunctions() {
        return functions;
    }

    public void setFunctions(String functions) {
        this.functions = functions;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public String getJobtype() {
        return jobtype;
    }

    public void setJobtype(String jobtype) {
        this.jobtype = jobtype;
    }

    public String getJobjointime() {
        return jobjointime;
    }

    public void setJobjointime(String jobjointime) {
        this.jobjointime = jobjointime;
    }

    public String getFaddress() {
        return faddress;
    }

    public void setFaddress(String faddress) {
        this.faddress = faddress;
    }

    public String getPolitical() {
        return political;
    }

    public void setPolitical(String political) {
        this.political = political;
    }

    public String getPjointime() {
        return pjointime;
    }

    public void setPjointime(String pjointime) {
        this.pjointime = pjointime;
    }

    public String getSfid() {
        return sfid;
    }

    public void setSfid(String sfid) {
        this.sfid = sfid;
    }

    public String getMarital() {
        return marital;
    }

    public void setMarital(String marital) {
        this.marital = marital;
    }

    public String getDjointime() {
        return djointime;
    }

    public void setDjointime(String djointime) {
        this.djointime = djointime;
    }

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post;
    }

    public String getPojointime() {
        return pojointime;
    }

    public void setPojointime(String pojointime) {
        this.pojointime = pojointime;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getFtitle() {
        return ftitle;
    }

    public void setFtitle(String ftitle) {
        this.ftitle = ftitle;
    }

    public String getCertificate() {
        return certificate;
    }

    public void setCertificate(String certificate) {
        this.certificate = certificate;
    }

    public Long getContractlength() {
        return contractlength;
    }

    public void setContractlength(Long contractlength) {
        this.contractlength = contractlength;
    }

    public String getCstarttime() {
        return cstarttime;
    }

    public void setCstarttime(String cstarttime) {
        this.cstarttime = cstarttime;
    }

    public String getCendtime() {
        return cendtime;
    }

    public void setCendtime(String cendtime) {
        this.cendtime = cendtime;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getBz() {
        return bz;
    }

    public void setBz(String bz) {
        this.bz = bz;
    }
}
