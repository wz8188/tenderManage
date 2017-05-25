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
					
					<form action="tmtenderecert/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="TMTENDERECERT_ID" id="TMTENDERECERT_ID" value="${pd.TMTENDERECERT_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">投标单位id:</td>
								<td><input type="text" name="TENDER_UNIT_ID" id="TENDER_UNIT_ID" value="${pd.TENDER_UNIT_ID}" maxlength="100" placeholder="这里输入投标单位id" title="投标单位id" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">证书名称:</td>
								<td><input type="text" name="ECERT_NAME" id="ECERT_NAME" value="${pd.ECERT_NAME}" maxlength="255" placeholder="这里输入证书名称" title="证书名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">证书类型(外键):</td>
								<td><input type="number" name="ECERT_TYPE" id="ECERT_TYPE" value="${pd.ECERT_TYPE}" maxlength="32" placeholder="这里输入证书类型(外键)" title="证书类型(外键)" style="width:98%;"/></td>
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
			if($("#TENDER_UNIT_ID").val()==""){
				$("#TENDER_UNIT_ID").tips({
					side:3,
		            msg:'请输入投标单位id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TENDER_UNIT_ID").focus();
			return false;
			}
			if($("#ECERT_NAME").val()==""){
				$("#ECERT_NAME").tips({
					side:3,
		            msg:'请输入证书名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ECERT_NAME").focus();
			return false;
			}
			if($("#ECERT_TYPE").val()==""){
				$("#ECERT_TYPE").tips({
					side:3,
		            msg:'请输入证书类型(外键)',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ECERT_TYPE").focus();
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