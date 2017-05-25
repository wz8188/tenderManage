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
					
					<form action="tmtenderunit/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="TMTENDERUNIT_ID" id="TMTENDERUNIT_ID" value="${pd.TMTENDERUNIT_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">投标单位名称:</td>
								<td><input type="text" name="TENDER_UNIT_NAME" id="TENDER_UNIT_NAME" value="${pd.TENDER_UNIT_NAME}" maxlength="255" placeholder="这里输入投标单位名称" title="投标单位名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">投标人名称:</td>
								<td><input type="text" name="TENDER_USER_NAME" id="TENDER_USER_NAME" value="${pd.TENDER_USER_NAME}" maxlength="255" placeholder="这里输入投标人名称" title="投标人名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">单位地址:</td>
								<td><input type="text" name="UNIT_LOCATION" id="UNIT_LOCATION" value="${pd.UNIT_LOCATION}" maxlength="255" placeholder="这里输入单位地址" title="单位地址" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">联系人:</td>
								<td><input type="text" name="CONTACT_PERSON" id="CONTACT_PERSON" value="${pd.CONTACT_PERSON}" maxlength="255" placeholder="这里输入联系人" title="联系人" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">联系电话:</td>
								<td><input type="text" name="CONTACT_PHONE" id="CONTACT_PHONE" value="${pd.CONTACT_PHONE}" maxlength="255" placeholder="这里输入联系电话" title="联系电话" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">电子邮箱:</td>
								<td><input type="text" name="CONTACT_EMAIL" id="CONTACT_EMAIL" value="${pd.CONTACT_EMAIL}" maxlength="255" placeholder="这里输入电子邮箱" title="电子邮箱" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">单位分类:</td>
								<td><input type="number" name="TENDER_UNIT_TYPE" id="TENDER_UNIT_TYPE" value="${pd.TENDER_UNIT_TYPE}" maxlength="32" placeholder="这里输入单位分类" title="单位分类" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">开户银行:</td>
								<td><input type="text" name="BANK" id="BANK" value="${pd.BANK}" maxlength="255" placeholder="这里输入开户银行" title="开户银行" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">银行账户:</td>
								<td><input type="text" name="BANK_ACCOUNT" id="BANK_ACCOUNT" value="${pd.BANK_ACCOUNT}" maxlength="255" placeholder="这里输入银行账户" title="银行账户" style="width:98%;"/></td>
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
			if($("#TENDER_UNIT_NAME").val()==""){
				$("#TENDER_UNIT_NAME").tips({
					side:3,
		            msg:'请输入投标单位名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TENDER_UNIT_NAME").focus();
			return false;
			}
			if($("#TENDER_USER_NAME").val()==""){
				$("#TENDER_USER_NAME").tips({
					side:3,
		            msg:'请输入投标人名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TENDER_USER_NAME").focus();
			return false;
			}
			if($("#UNIT_LOCATION").val()==""){
				$("#UNIT_LOCATION").tips({
					side:3,
		            msg:'请输入单位地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#UNIT_LOCATION").focus();
			return false;
			}
			if($("#CONTACT_PERSON").val()==""){
				$("#CONTACT_PERSON").tips({
					side:3,
		            msg:'请输入联系人',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CONTACT_PERSON").focus();
			return false;
			}
			if($("#CONTACT_PHONE").val()==""){
				$("#CONTACT_PHONE").tips({
					side:3,
		            msg:'请输入联系电话',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CONTACT_PHONE").focus();
			return false;
			}
			if($("#CONTACT_EMAIL").val()==""){
				$("#CONTACT_EMAIL").tips({
					side:3,
		            msg:'请输入电子邮箱',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CONTACT_EMAIL").focus();
			return false;
			}
			if($("#TENDER_UNIT_TYPE").val()==""){
				$("#TENDER_UNIT_TYPE").tips({
					side:3,
		            msg:'请输入单位分类',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TENDER_UNIT_TYPE").focus();
			return false;
			}
			if($("#BANK").val()==""){
				$("#BANK").tips({
					side:3,
		            msg:'请输入开户银行',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BANK").focus();
			return false;
			}
			if($("#BANK_ACCOUNT").val()==""){
				$("#BANK_ACCOUNT").tips({
					side:3,
		            msg:'请输入银行账户',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BANK_ACCOUNT").focus();
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