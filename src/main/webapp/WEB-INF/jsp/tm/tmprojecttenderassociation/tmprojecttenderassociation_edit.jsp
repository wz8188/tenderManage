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
					
					<form action="tmprojecttenderassociation/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="TMPROJECTTENDERASSOCIATION_ID" id="TMPROJECTTENDERASSOCIATION_ID" value="${pd.TMPROJECTTENDERASSOCIATION_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">投标单位id:</td>
								<td><input type="text" name="TENDER_UNIT_ID" id="TENDER_UNIT_ID" value="${pd.TENDER_UNIT_ID}" maxlength="255" placeholder="这里输入投标单位id" title="投标单位id" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">保证金(业务):</td>
								<td><input type="number" name="MARGIN_BUSINESS" id="MARGIN_BUSINESS" value="${pd.MARGIN_BUSINESS}" maxlength="32" placeholder="这里输入保证金(业务)" title="保证金(业务)" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">标书款(业务):</td>
								<td><input type="number" name="TENDER_SECTION_BUSINESS" id="TENDER_SECTION_BUSINESS" value="${pd.TENDER_SECTION_BUSINESS}" maxlength="32" placeholder="这里输入标书款(业务)" title="标书款(业务)" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">保证金(财务):</td>
								<td><input type="number" name="MARGIN_FINANCE" id="MARGIN_FINANCE" value="${pd.MARGIN_FINANCE}" maxlength="32" placeholder="这里输入保证金(财务)" title="保证金(财务)" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">标书款(财务):</td>
								<td><input type="number" name="TENDER_SECTION_FINANCE" id="TENDER_SECTION_FINANCE" value="${pd.TENDER_SECTION_FINANCE}" maxlength="32" placeholder="这里输入标书款(财务)" title="标书款(财务)" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">财务收费渠道 1:现金 2:银行:</td>
								<td><input type="number" name="FINANCE_CHARGE_CHANNELS" id="FINANCE_CHARGE_CHANNELS" value="${pd.FINANCE_CHARGE_CHANNELS}" maxlength="32" placeholder="这里输入财务收费渠道 1:现金 2:银行" title="财务收费渠道 1:现金 2:银行" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">退费金:</td>
								<td><input type="number" name="REFUND_FEE" id="REFUND_FEE" value="${pd.REFUND_FEE}" maxlength="32" placeholder="这里输入退费金" title="退费金" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">退费渠道 1现金 2银行:</td>
								<td><input type="number" name="REFUND_CHANNEL" id="REFUND_CHANNEL" value="${pd.REFUND_CHANNEL}" maxlength="32" placeholder="这里输入退费渠道 1现金 2银行" title="退费渠道 1现金 2银行" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">退费到帐时间:</td>
								<td><input class="span10 date-picker" name="REFUND_TIME_TO_ARRIVE" id="REFUND_TIME_TO_ARRIVE" value="${pd.REFUND_TIME_TO_ARRIVE}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="退费到帐时间" title="退费到帐时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">服务费:</td>
								<td><input type="number" name="SERVICE_CHARGE" id="SERVICE_CHARGE" value="${pd.SERVICE_CHARGE}" maxlength="32" placeholder="这里输入服务费" title="服务费" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">是否通知领导修改 0:不通知 1:通知:</td>
								<td><input type="number" name="SERVICE_CHARGE_FLAG" id="SERVICE_CHARGE_FLAG" value="${pd.SERVICE_CHARGE_FLAG}" maxlength="32" placeholder="这里输入是否通知领导修改 0:不通知 1:通知" title="是否通知领导修改 0:不通知 1:通知" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">折扣率:</td>
								<td><input type="number" name="DISCOUNT_RATE" id="DISCOUNT_RATE" value="${pd.DISCOUNT_RATE}" maxlength="32" placeholder="这里输入折扣率" title="折扣率" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">中标状态 0:待评标 1:中标 2:未中标(如果又交钱,则自动新增一条新数据) 3:中标完结 4:未中标完结:</td>
								<td><input type="number" name="BID_STATUS" id="BID_STATUS" value="${pd.BID_STATUS}" maxlength="32" placeholder="这里输入中标状态 0:待评标 1:中标 2:未中标(如果又交钱,则自动新增一条新数据) 3:中标完结 4:未中标完结" title="中标状态 0:待评标 1:中标 2:未中标(如果又交钱,则自动新增一条新数据) 3:中标完结 4:未中标完结" style="width:98%;"/></td>
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
			if($("#MARGIN_BUSINESS").val()==""){
				$("#MARGIN_BUSINESS").tips({
					side:3,
		            msg:'请输入保证金(业务)',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MARGIN_BUSINESS").focus();
			return false;
			}
			if($("#TENDER_SECTION_BUSINESS").val()==""){
				$("#TENDER_SECTION_BUSINESS").tips({
					side:3,
		            msg:'请输入标书款(业务)',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TENDER_SECTION_BUSINESS").focus();
			return false;
			}
			if($("#MARGIN_FINANCE").val()==""){
				$("#MARGIN_FINANCE").tips({
					side:3,
		            msg:'请输入保证金(财务)',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MARGIN_FINANCE").focus();
			return false;
			}
			if($("#TENDER_SECTION_FINANCE").val()==""){
				$("#TENDER_SECTION_FINANCE").tips({
					side:3,
		            msg:'请输入标书款(财务)',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TENDER_SECTION_FINANCE").focus();
			return false;
			}
			if($("#FINANCE_CHARGE_CHANNELS").val()==""){
				$("#FINANCE_CHARGE_CHANNELS").tips({
					side:3,
		            msg:'请输入财务收费渠道 1:现金 2:银行',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FINANCE_CHARGE_CHANNELS").focus();
			return false;
			}
			if($("#REFUND_FEE").val()==""){
				$("#REFUND_FEE").tips({
					side:3,
		            msg:'请输入退费金',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#REFUND_FEE").focus();
			return false;
			}
			if($("#REFUND_CHANNEL").val()==""){
				$("#REFUND_CHANNEL").tips({
					side:3,
		            msg:'请输入退费渠道 1现金 2银行',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#REFUND_CHANNEL").focus();
			return false;
			}
			if($("#REFUND_TIME_TO_ARRIVE").val()==""){
				$("#REFUND_TIME_TO_ARRIVE").tips({
					side:3,
		            msg:'请输入退费到帐时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#REFUND_TIME_TO_ARRIVE").focus();
			return false;
			}
			if($("#SERVICE_CHARGE").val()==""){
				$("#SERVICE_CHARGE").tips({
					side:3,
		            msg:'请输入服务费',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SERVICE_CHARGE").focus();
			return false;
			}
			if($("#SERVICE_CHARGE_FLAG").val()==""){
				$("#SERVICE_CHARGE_FLAG").tips({
					side:3,
		            msg:'请输入是否通知领导修改 0:不通知 1:通知',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SERVICE_CHARGE_FLAG").focus();
			return false;
			}
			if($("#DISCOUNT_RATE").val()==""){
				$("#DISCOUNT_RATE").tips({
					side:3,
		            msg:'请输入折扣率',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DISCOUNT_RATE").focus();
			return false;
			}
			if($("#BID_STATUS").val()==""){
				$("#BID_STATUS").tips({
					side:3,
		            msg:'请输入中标状态 0:待评标 1:中标 2:未中标(如果又交钱,则自动新增一条新数据) 3:中标完结 4:未中标完结',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BID_STATUS").focus();
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