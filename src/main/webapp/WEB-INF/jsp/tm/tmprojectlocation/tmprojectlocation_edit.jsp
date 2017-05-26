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
					
					<form action="tmprojectlocation/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="TMPROJECTLOCATION_ID" id="TMPROJECTLOCATION_ID" value="${pd.TMPROJECTLOCATION_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">项目地点名称:</td>
								<td><input type="text" name="PROJECT_LOCATION_NAME" id="PROJECT_LOCATION_NAME" value="${pd.PROJECT_LOCATION_NAME}" maxlength="255" placeholder="这里输入项目地点名称" title="项目地点名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">0:市级 1:省:</td>
								<td><input type="number" name="IS_PROVINCE" id="IS_PROVINCE" value="${pd.IS_PROVINCE}" maxlength="32" placeholder="这里输入0:市级 1:省" title="0:市级 1:省" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">代码:</td>
								<td><input type="number" name="ITEM_NUMBER" id="ITEM_NUMBER" value="${pd.ITEM_NUMBER}" maxlength="32" placeholder="这里输入代码" title="代码" style="width:98%;"/></td>
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
			if($("#PROJECT_LOCATION_NAME").val()==""){
				$("#PROJECT_LOCATION_NAME").tips({
					side:3,
		            msg:'请输入项目地点名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PROJECT_LOCATION_NAME").focus();
			return false;
			}
			if($("#IS_PROVINCE").val()==""){
				$("#IS_PROVINCE").tips({
					side:3,
		            msg:'请输入0:市级 1:省',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IS_PROVINCE").focus();
			return false;
			}
			if($("#ITEM_NUMBER").val()==""){
				$("#ITEM_NUMBER").tips({
					side:3,
		            msg:'请输入代码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ITEM_NUMBER").focus();
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