<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <!-- 下拉框 -->
    <link rel="stylesheet" href="static/ace/css/chosen.css"/>
    <!-- jsp文件头和头部 -->
    <%@ include file="../../system/index/top.jsp" %>
    <!-- 日期框 -->
    <link rel="stylesheet" href="plugins/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css"/>
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
    <!-- /section:basics/sidebar -->
    <div class="main-content">
        <div class="main-content-inner">
            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12">

                        <form action="tmprojectmanage/${msg }.do" name="Form" id="Form" method="post">
                            <input type="hidden" name="TMPROJECTMANAGE_ID" id="TMPROJECTMANAGE_ID"
                                   value="${pd.TMPROJECTMANAGE_ID}"/>
                            <div id="zhongxin" style="padding-top: 13px;">
                                <table id="table_report" class="table table-striped table-bordered table-hover">
                                    <tr>
                                        <td style="width:100px;text-align: right;padding-top: 13px;">项目名称:</td>
                                        <td>
                                            <input type="text" name="PROJECT_NAME" id="PROJECT_NAME"
                                                   value="${pd.PROJECT_NAME}" maxlength="255" placeholder="项目名称(2-50字符)"
                                                   title="项目名称" style="width:98%;"
                                                   datatype="*2-50" nullmsg="请输入项目名称" errormsg="请控制在2-50字符内"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:100px;text-align: right;padding-top: 13px;">开标时间:</td>
                                        <td>
                                            <input class="span10 date-picker" name="BID_OPENING_TIME"
                                                   id="BID_OPENING_TIME" value="${pd.BID_OPENING_TIME}" type="text"
                                                   readonly="readonly" placeholder="请选择开标时间" title="开标时间"
                                                   style="width:98%;"
                                                   datatype="*" nullmsg="请选择开标时间"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:100px;text-align: right;padding-top: 13px;">开标地点:</td>
                                        <td>
                                            <input type="text" name="BID_OPENING_LOCATION" id="BID_OPENING_LOCATION"
                                                   value="${pd.BID_OPENING_LOCATION}" maxlength="255"
                                                   placeholder="开标地点(2-50字符)" title="开标地点" style="width:98%;"
                                                   datatype="*2-50" nullmsg="请输入开标地点" erromsg="请控制在2-50字符内"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:100px;text-align: right;padding-top: 13px;">归属部门:</td>
                                        <td>
                                            <select name="ATTRIBUTION_DEPARTMENT" id="ATTRIBUTION_DEPARTMENT"
                                                    title="请选择归属部门" style="width:98%;"
                                                    datatype="*" nullmsg="请选择归属部门">
                                                <option value="">请选择归属部门</option>
                                                <c:forEach items="${deplist}" var="dep">
                                                    <option value="${dep.DEPARTMENT_ID}"
                                                            <c:if test="${dep.DEPARTMENT_ID == pd.ATTRIBUTION_DEPARTMENT}">
                                                                selected
                                                            </c:if>>${dep.NAME}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:100px;text-align: right;padding-top: 13px;">项目地点:</td>
                                        <td>
                                            <select name="PROJECT_LOCATION" id="PROJECT_LOCATION"
                                                    title="请选择项目地点(省公司项目选择黑龙江省,分公司项目选择哈尔滨市)" style="width:98%;"
                                                    datatype="*" nullmsg="请选择项目地点">
                                                <option value="">请选择项目地点(省公司项目选择黑龙江省,分公司项目选择哈尔滨市)</option>
                                                <c:forEach items="${projectLocationList}" var="projectLocation">
                                                    <option value="${projectLocation.TMPROJECTLOCATION_ID}"
                                                            <c:if test="${projectLocation.TMPROJECTLOCATION_ID == pd.PROJECT_LOCATION}">
                                                                selected
                                                            </c:if>>${projectLocation.PROJECT_LOCATION_NAME}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:100px;text-align: right;padding-top: 13px;">归属区域:</td>
                                        <td>
                                            <select name="DISTRICT_OWNERSHIP" id="DISTRICT_OWNERSHIP" title="归属区域"
                                                    style="width:98%;"
                                                    datatype="*" nullmsg="请选择归属区域">
                                                <option value="">请选择归属区域</option>
                                                <c:forEach items="${districtOwnershipList}" var="districtOwnership">
                                                    <option value="${districtOwnership.TMDISTRICTOWNERSHIP_ID}"
                                                            <c:if test="${districtOwnership.TMDISTRICTOWNERSHIP_ID == pd.DISTRICT_OWNERSHIP}">
                                                                selected
                                                            </c:if>>${districtOwnership.TMDISTRICTOWNERSHIPNAME}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:100px;text-align: right;padding-top: 13px;">服务费类别:</td>
                                        <td>
                                            <input type="radio" name="SERVICE_FEE_CATEGORY" id="SERVICE_FEE_CATEGORY_0"
                                                   value="0"
                                                   <c:if test="${pd.SERVICE_FEE_CATEGORY != 1}">checked</c:if>/>
                                            <label for="SERVICE_FEE_CATEGORY_0" style="width: 40%">预收</label>
                                            <input type="radio" name="SERVICE_FEE_CATEGORY" id="SERVICE_FEE_CATEGORY_1"
                                                   value="1"
                                                   <c:if test="${pd.SERVICE_FEE_CATEGORY == 1}">checked</c:if>/>
                                            <label for="SERVICE_FEE_CATEGORY_1" style="width: 40%">直收</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:100px;text-align: right;padding-top: 13px;">项目服务类别:</td>
                                        <td>
                                            <select name="PROJECT_SERVICE_TYPES" id="PROJECT_SERVICE_TYPES"
                                                    title="项目服务类别" style="width:98%;"
                                                    datatype="*" nullmsg="请选择项目服务类别">
                                                <option value="">请选择项目服务类别</option>
                                                <c:forEach items="${projectServiceTypeList}" var="projectServiceType">
                                                    <option value="${projectServiceType.TMPROJECTSERVICETYPE_ID}"
                                                            <c:if test="${projectServiceType.TMPROJECTSERVICETYPE_ID == pd.PROJECT_SERVICE_TYPES}">
                                                                selected
                                                            </c:if>>${projectServiceType.PST_NAME}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:100px;text-align: right;padding-top: 13px;">招标类别:</td>
                                        <td>

                                            <select name="TENDER_TYPE" id="TENDER_TYPE" title="招标类别" style="width:98%;"
                                                    datatype="*" nullmsg="请选择招标类别">
                                                <option value="">请选择招标类别</option>
                                                <c:forEach items="${tenderTypeList}" var="tenderType">
                                                    <option value="${tenderType.TMTENDERTYPE_ID}"
                                                            <c:if test="${tenderType.TMTENDERTYPE_ID == pd.TENDER_TYPE}">
                                                                selected
                                                            </c:if>>${tenderType.TENDER_TYPE_NAME}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:100px;text-align: right;padding-top: 13px;">合作项目</td>
                                        <td>
                                            <select name="COOPERATION_UNIT" id="COOPERATION_UNIT" title="合作项目"
                                                    style="width:70%;">
                                                <option value="">请选择合作公司</option>
                                                <c:forEach items="${cooperationUnitList}" var="cooperationUnit">
                                                    <option value="${cooperationUnit.TMCOOPERATIONUNIT_ID}"
                                                            <c:if test="${cooperationUnit.TMCOOPERATIONUNIT_ID == pd.COOPERATION_UNIT}">
                                                                selected
                                                            </c:if>>${cooperationUnit.COOPERATION_UNIT_NAME}</option>
                                                </c:forEach>
                                            </select>
                                            <input type="text" name="INCOME_DISTRIBUTION" id="INCOME_DISTRIBUTION"
                                                   value="${pd.INCOME_DISTRIBUTION}" maxlength="255"
                                                   placeholder="这里输入收入分配" title="收入分配" style="width:25%;"
                                                   datatype="float2" nullmsg="请输入收入分配" errormsg="请输入正确的数字"
                                                   readonly="readonly"/>%
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:100px;text-align: right;padding-top: 13px;">备注:</td>
                                        <td>
                                            <textarea name="COMMENT" id="COMMENT" maxlength="255" placeholder="这里输入备注"
                                                      title="备注"
                                                      style="width:98%;height: auto;resize: none;">${pd.COMMENT}</textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;" colspan="10">
                                            <input type="submit" class="btn btn-mini btn-primary" value="保存"/>
                                            <a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img
                                    src="static/images/jiazai.gif"/><br/><h4 class="lighter block green">提交中...</h4>
                            </div>
                        </form>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.page-content -->
        </div>
    </div>
    <!-- /.main-content -->
</div>
<!-- /.main-container -->


<!-- 页面底部js¨ -->
<%@ include file="../../system/index/foot.jsp" %>
<!-- 下拉框 -->
<script src="static/ace/js/chosen.jquery.js"></script>
<!-- 日期框 -->
<script src="plugins/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js"></script>
<script src="plugins/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<!--提示框-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<!--验证表单-->
<script type="text/javascript" src="plugins/validform/Validform_v5.3.2.js"></script>
<script type="text/javascript">
    $(top.hangge());
    $(function () {
        //日期框
        $('.date-picker').datetimepicker({
            language: 'zh-CN',
            weekStart: 1,
            todayBtn: 1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            forceParse: 0,
            showMeridian: 1,
            startDate: new Date()
        });

        //验证表单
        var Form = $("#Form").Validform({
            tiptype: function (msg, o, cssctl) {
                //msg：提示信息;
                //o:{obj:*,type:*,curform:*}, obj指向的是当前验证的表单元素（或表单对象），type指示提示的状态，值为1、2、3、4， 1：正在检测/提交数据，2：通过验证，3：验证失败，4：提示ignore状态, curform为当前form对象;
                //cssctl:内置的提示信息样式控制函数，该函数需传入两个参数：显示提示信息的对象 和 当前提示的状态（既形参o中的type）;
                if (!o.obj.is("form")) {//验证表单元素时o.obj为该表单元素，全部验证通过提交表单时o.obj为该表单对象;
                    if (o.type != 2) {
                        $(o.obj).tips({
                            side: 3,
                            msg: msg,
                            bg: '#AE81FF',
                            time: 2
                        });
                        $(o.obj).focus();
                    }
                }
            },
            datatype: {
                "float2": function (gets, obj, curform, regxp) {//两位有效数字
                    /*参数gets是获取到的表单元素值，obj为当前表单元素， curform为当前验证的表单，regxp为内置的一些正则表达式的引用。*/
                    var reg = /^(100|(\d{1,2}(\.\d{1,2})?))$/;
                    return reg.test(gets);
                }
            },
            showAllError: false,
            ajaxPost: true,
            postonce: false,
            callback: function (data) {
                //validForm.resetStatus();
                ajaxSubmitForm();
                return false;
            }
        });

        Form.ignore("#INCOME_DISTRIBUTION");//初始时对收入默认取消验证
        //为选定合作项目之后添加收入分配
        $('#COOPERATION_UNIT').on("change", function () {
            if ($(this).val() != null && $(this).val() != "") {
                Form.unignore("#INCOME_DISTRIBUTION");
                $('#INCOME_DISTRIBUTION').removeAttr("readonly");
            } else {
                $('#INCOME_DISTRIBUTION').val(null);
                Form.ignore("#INCOME_DISTRIBUTION");
                $('#INCOME_DISTRIBUTION').attr("readonly", "readonly");
            }
        })

    });


    //异步提交表单
    function ajaxSubmitForm() {
        var ajaxData = $("#Form").serialize();
        var url = $("#Form").attr('action');
        var method = $("#Form").attr('method');
        $.ajax({
            type: method,
            url: url,
            data: ajaxData,
            dataType: "text",
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            success: function (data) {
                if (data != "error") {
                    //layer.msg('提交成功', {icon: 1});
                    setTimeout(function () {
                        $("#zhongxin").hide();
                        $("#zhongxin2").show();
                        top.Dialog.close();
                    }, 1000);
                } else if (data == "error") {
                    alert('提交失败,请刷新重试', {icon: 2});
                }
            },
            error: function (data) {
                alert("error = " + data);
            }
        })
    }
</script>
</body>
</html>