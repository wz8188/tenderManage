<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
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
						<input type="hidden" name="TMPROJECTMANAGE_ID" id="TMPROJECTMANAGE_ID" value="${pd.TMPROJECTMANAGE_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">项目编号:</td>
								<td><input type="text" name="TM_PROJECT_NUMBER" id="TM_PROJECT_NUMBER" value="${pd.TM_PROJECT_NUMBER}" maxlength="255" placeholder="这里输入项目编号" title="项目编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">项目名称:</td>
								<td><input type="text" name="PROJECT_NAME" id="PROJECT_NAME" value="${pd.PROJECT_NAME}" maxlength="255" placeholder="这里输入项目名称" title="项目名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">开标时间:</td>
								<td><input class="span10 date-picker" name="BID_OPENING_TIME" id="BID_OPENING_TIME" value="${pd.BID_OPENING_TIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="开标时间" title="开标时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">开标地点:</td>
								<td><input type="text" name="BID_OPENING_LOCATION" id="BID_OPENING_LOCATION" value="${pd.BID_OPENING_LOCATION}" maxlength="255" placeholder="这里输入开标地点" title="开标地点" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">归属部门(自动获取当前业务人员的部门,不可选择别的部门):</td>
								<td><input type="number" name="ATTRIBUTION_DEPARTMENT" id="ATTRIBUTION_DEPARTMENT" value="${pd.ATTRIBUTION_DEPARTMENT}" maxlength="32" placeholder="这里输入归属部门(自动获取当前业务人员的部门,不可选择别的部门)" title="归属部门(自动获取当前业务人员的部门,不可选择别的部门)" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">项目地点(省公司项目选择黑龙江省,分公司项目选择哈尔滨市):</td>
								<td><input type="number" name="PROJECT_LOCATION" id="PROJECT_LOCATION" value="${pd.PROJECT_LOCATION}" maxlength="32" placeholder="这里输入项目地点(省公司项目选择黑龙江省,分公司项目选择哈尔滨市)" title="项目地点(省公司项目选择黑龙江省,分公司项目选择哈尔滨市)" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">归属区域:</td>
								<td><input type="number" name="DISTRICT_OWNERSHIP" id="DISTRICT_OWNERSHIP" value="${pd.DISTRICT_OWNERSHIP}" maxlength="32" placeholder="这里输入归属区域" title="归属区域" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">中标服务费类别  0:预收 1:直收:</td>
								<td><input type="number" name="SERVICE_FEE_CATEGORY" id="SERVICE_FEE_CATEGORY" value="${pd.SERVICE_FEE_CATEGORY}" maxlength="32" placeholder="这里输入中标服务费类别  0:预收 1:直收" title="中标服务费类别  0:预收 1:直收" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">项目服务类别,逗号分隔:</td>
								<td><input type="text" name="PROJECT_SERVICE_TYPES" id="PROJECT_SERVICE_TYPES" value="${pd.PROJECT_SERVICE_TYPES}" maxlength="255" placeholder="这里输入项目服务类别,逗号分隔" title="项目服务类别,逗号分隔" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">招标类别:</td>
								<td><input type="number" name="TENDER_TYPE" id="TENDER_TYPE" value="${pd.TENDER_TYPE}" maxlength="32" placeholder="这里输入招标类别" title="招标类别" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">0:非国发合作项目 1:国发合作项目:</td>
								<td><input type="number" name="IS_NATIONAL" id="IS_NATIONAL" value="${pd.IS_NATIONAL}" maxlength="32" placeholder="这里输入0:非国发合作项目 1:国发合作项目" title="0:非国发合作项目 1:国发合作项目" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注(如果遇到废标,就追加原因):</td>
								<td><input type="text" name="COMMENT" id="COMMENT" value="${pd.COMMENT}" maxlength="255" placeholder="这里输入备注(如果遇到废标,就追加原因)" title="备注(如果遇到废标,就追加原因)" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">状态 0:可归档 1:不可归档:</td>
								<td><input type="number" name="IS_STATUS" id="IS_STATUS" value="${pd.IS_STATUS}" maxlength="32" placeholder="这里输入状态 0:可归档 1:不可归档" title="状态 0:可归档 1:不可归档" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备案提醒起始日期:</td>
								<td><input class="span10 date-picker" name="RECORD_REMINDER_TIME" id="RECORD_REMINDER_TIME" value="${pd.RECORD_REMINDER_TIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="备案提醒起始日期" title="备案提醒起始日期" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">是否还提醒备案 0:不提醒 1:提醒:</td>
								<td><input type="number" name="IS_RECORD_STATUS" id="IS_RECORD_STATUS" value="${pd.IS_RECORD_STATUS}" maxlength="32" placeholder="这里输入是否还提醒备案 0:不提醒 1:提醒" title="是否还提醒备案 0:不提醒 1:提醒" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
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
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#TM_PROJECT_NUMBER").val()==""){
				$("#TM_PROJECT_NUMBER").tips({
					side:3,
		            msg:'请输入项目编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TM_PROJECT_NUMBER").focus();
			return false;
			}
			if($("#PROJECT_NAME").val()==""){
				$("#PROJECT_NAME").tips({
					side:3,
		            msg:'请输入项目名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PROJECT_NAME").focus();
			return false;
			}
			if($("#BID_OPENING_TIME").val()==""){
				$("#BID_OPENING_TIME").tips({
					side:3,
		            msg:'请输入开标时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BID_OPENING_TIME").focus();
			return false;
			}
			if($("#BID_OPENING_LOCATION").val()==""){
				$("#BID_OPENING_LOCATION").tips({
					side:3,
		            msg:'请输入开标地点',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BID_OPENING_LOCATION").focus();
			return false;
			}
			if($("#ATTRIBUTION_DEPARTMENT").val()==""){
				$("#ATTRIBUTION_DEPARTMENT").tips({
					side:3,
		            msg:'请输入归属部门(自动获取当前业务人员的部门,不可选择别的部门)',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ATTRIBUTION_DEPARTMENT").focus();
			return false;
			}
			if($("#PROJECT_LOCATION").val()==""){
				$("#PROJECT_LOCATION").tips({
					side:3,
		            msg:'请输入项目地点(省公司项目选择黑龙江省,分公司项目选择哈尔滨市)',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PROJECT_LOCATION").focus();
			return false;
			}
			if($("#DISTRICT_OWNERSHIP").val()==""){
				$("#DISTRICT_OWNERSHIP").tips({
					side:3,
		            msg:'请输入归属区域',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DISTRICT_OWNERSHIP").focus();
			return false;
			}
			if($("#SERVICE_FEE_CATEGORY").val()==""){
				$("#SERVICE_FEE_CATEGORY").tips({
					side:3,
		            msg:'请输入中标服务费类别  0:预收 1:直收',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SERVICE_FEE_CATEGORY").focus();
			return false;
			}
			if($("#PROJECT_SERVICE_TYPES").val()==""){
				$("#PROJECT_SERVICE_TYPES").tips({
					side:3,
		            msg:'请输入项目服务类别,逗号分隔',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PROJECT_SERVICE_TYPES").focus();
			return false;
			}
			if($("#TENDER_TYPE").val()==""){
				$("#TENDER_TYPE").tips({
					side:3,
		            msg:'请输入招标类别',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TENDER_TYPE").focus();
			return false;
			}
			if($("#IS_NATIONAL").val()==""){
				$("#IS_NATIONAL").tips({
					side:3,
		            msg:'请输入0:非国发合作项目 1:国发合作项目',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IS_NATIONAL").focus();
			return false;
			}
			if($("#COMMENT").val()==""){
				$("#COMMENT").tips({
					side:3,
		            msg:'请输入备注(如果遇到废标,就追加原因)',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#COMMENT").focus();
			return false;
			}
			if($("#IS_STATUS").val()==""){
				$("#IS_STATUS").tips({
					side:3,
		            msg:'请输入状态 0:可归档 1:不可归档',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IS_STATUS").focus();
			return false;
			}
			if($("#RECORD_REMINDER_TIME").val()==""){
				$("#RECORD_REMINDER_TIME").tips({
					side:3,
		            msg:'请输入备案提醒起始日期',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#RECORD_REMINDER_TIME").focus();
			return false;
			}
			if($("#IS_RECORD_STATUS").val()==""){
				$("#IS_RECORD_STATUS").tips({
					side:3,
		            msg:'请输入是否还提醒备案 0:不提醒 1:提醒',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IS_RECORD_STATUS").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>