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
    <link rel="stylesheet" href="static/ace/css/datepicker.css"/>
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

                        <form action="tmprojecttenders/${msg }.do" name="Form" id="Form" method="post">
                            <input type="hidden" name="PROJECT_ID" id="PROJECT_ID" value="${pd.PROJECT_ID}"/>
                            <div id="zhongxin" style="padding-top: 13px;">
                                <table id="table_report" class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th width="20%">服务类型</th>
                                        <th width="60%">标段名称</th>
                                        <th width="15%">报价分上限</th>
                                        <th width="4%">删除</th>
                                    </tr>

                                    </thead>
                                    <tbody id="tbody">
                                    <tr v-for="aRow in manyRows" class="info-panel">
                                        <input type="hidden" name="PROJECT_ID" id="PROJECT_ID_{{$index}}" value="${pd.PROJECT_ID}"/>
                                        <td>
                                            <select name="SERVICE_TYPE" id="SERVICE_TYPE_{{$index}}" title="标段服务类别"
                                                    style="width:98%;" datatype="*" nullmsg="请选择标段服务类型" v-model="aRow.selected">
                                                <option value="-1">请选择服务类型</option>
                                                <c:forEach items="${projectServiceTypeList}" var="pst" varStatus="vs">
                                                    <option value="${pst.TMPROJECTSERVICETYPE_ID}" >${pst.PST_NAME}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td>
                                            <input type="text" name="PROJECT_TENDER_NAME"
                                                   id="PROJECT_TENDER_NAME_{{$index}}" value="{{aRow.PROJECT_TENDER_NAME}}"
                                                   maxlength="255" placeholder="项目标段名称" title="项目标段名称"
                                                   style="width:98%;" datatype="*2-255" nullmsg="请输入项目标段名称"
                                                   errormsg="2-255字符之间"/>
                                        </td>
                                        <td>
                                            <input type="text" name="QUOTES" id="QUOTES_{{$index}}" value="{{aRow.QUOTES}}"
                                                   maxlength="32" placeholder="报价分上限" title="报价分上限" style="width:98%;"
                                                   datatype="float2" ignore="ignore"/>
                                        </td>
                                        <td>
                                            <a class="btn btn-xs btn-danger" @click="deleteThisRow($index)">
                                                <i class="ace-icon fa fa-trash-o bigger-120" title="删除"></i>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left;" colspan="10">
                                            <a class="btn btn-mini btn-success" @click="addNewRow">新增</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;" colspan="10">
                                            <input type="submit" class="btn btn-mini btn-primary" value="保存"/>
                                            <a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
                                        </td>
                                    </tr>
                                    </tbody>
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
<!--提示框-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<!-- vue 动态生成模块html-->
<script type="text/javascript" src="plugins/vue/vue.js"></script>
<!--验证表单-->
<script type="text/javascript" src="plugins/validform/Validform_v5.3.2.js"></script>
<script type="text/javascript">
    $(top.hangge());
    /*//保存
    function save() {
        if ($("#PROJECT_TENDER_NAME").val() == "") {
            $("#PROJECT_TENDER_NAME").tips({
                side: 3,
                msg: '请输入项目标段名称',
                bg: '#AE81FF',
                time: 2
            });
            $("#PROJECT_TENDER_NAME").focus();
            return false;
        }
        if ($("#QUOTES").val() == "") {
            $("#QUOTES").tips({
                side: 3,
                msg: '请输入报价分上限',
                bg: '#AE81FF',
                time: 2
            });
            $("#QUOTES").focus();
            return false;
        }
        if ($("#SERVICE_TYPE").val() == "") {
            $("#SERVICE_TYPE").tips({
                side: 3,
                msg: '请输入标段服务类别',
                bg: '#AE81FF',
                time: 2
            });
            $("#SERVICE_TYPE").focus();
            return false;
        }
        $("#Form").submit();
        $("#zhongxin").hide();
        $("#zhongxin2").show();
    }*/

    $(function () {


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
        ajaxPost: false,
        postonce: false,
        callback: function (data) {
            //validForm.resetStatus();
            ajaxSubmitForm();
            return false;
        }
    });

    //异步提交表单
    function ajaxSubmitForm() {
        var ajaxData =combineFormData();
        var url = $("#Form").attr('action');
        var method = $("#Form").attr('method');
        console.log({"ajaxData":ajaxData,"PROJECT_ID":$('#PROJECT_ID').val()});
        $.ajax({
            type: method,
            url: url,
            data: {"ajaxData":ajaxData,"PROJECT_ID":$('#PROJECT_ID').val()},
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




    //我的vue 实例
    var vm = new Vue({
        el: '#tbody',
        data: {
            aRow: {
                PROJECT_ID:'',
                PROJECT_TENDER_NAME:'',
                QUOTES:'',
                SERVICE_TYPE:'',
                selected:'-1'
            },
            manyRows: [],
            life:'created'
        },
        created:function () {
            <c:forEach items="${tenders}" var="tender" varStatus="vs">
            this.aRow.PROJECT_ID = '${tender.PROJECT_ID}';
            this.aRow.PROJECT_TENDER_NAME = '${tender.PROJECT_TENDER_NAME}';
            this.aRow.QUOTES = '${tender.QUOTES}';
            this.aRow.SERVICE_TYPE = '${tender.SERVICE_TYPE}';
            this.aRow.selected = '${tender.SERVICE_TYPE}';
            this.manyRows.push(this.aRow);
            //console.log(this.aRow);
            this.aRow = {
                PROJECT_ID:'',
                PROJECT_TENDER_NAME:'',
                QUOTES:'',
                SERVICE_TYPE:'',
                selected:'-1'
            };
            </c:forEach>
        },
        methods: {
            addNewRow: function () {
                var flag = validTbody();
                if(flag){
                    this.manyRows.push(this.aRow);
                    // 添加完newPerson对象后，重置newPerson对象
                    this.aRow = {
                        PROJECT_ID:'',
                        PROJECT_TENDER_NAME:'',
                        QUOTES:'',
                        SERVICE_TYPE:'',
                        selected:'-1'
                    };
                }
            },
            deleteThisRow: function (index) {
                // 删一个数组元素
                this.manyRows.splice(index, 1);
            }
        }
    });


    //判断是否符合添加一行新数据的条件
    function validTbody() {
        return Form.check();
    }

    //组合form中的数据作为json格式字符串数组
    function combineFormData() {
        var formData = new Array;
        $('#tbody tr.info-panel').each(function () {
            var tdElem = $(this).children();
            var jsonTemp = '{"PROJECT_ID":"'+tdElem.val()+'","SERVICE_TYPE":"'+tdElem.next().children().val()+'","PROJECT_TENDER_NAME":"'+tdElem.next().next().children().val()+'","QUOTES":"'+tdElem.next().next().next().children().val()+'"}';
            formData.push(jsonTemp);
        })
        //console.log(formData);

        return formData;
    }


</script>
</body>
</html>