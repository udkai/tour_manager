<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>${webTitle}-用户管理</title>
<%@ include file="../common/header.jsp"%>
</head>

<body class="no-skin">
	<%@ include file="../common/top.jsp"%>

	<div class="main-container" id="main-container">
		<%@ include file="../common/menu.jsp"%>
		<div class="main-content">
			<div class="main-content-inner">
				<div class="breadcrumbs breadcrumbs-fixed" id="breadcrumbs">
					<ul class="breadcrumb">
						<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">首页</a></li>
						<li class="active">系统管理</li>
						<li class="active">用户管理</li>
					</ul>
				</div>

				<div class="page-content">
					<div class="page-header">
						<h1>
							用户管理 <small> <i class="ace-icon fa fa-angle-double-right"></i> 新增用户
							</small>
						</h1>
					</div>
					<!-- /.page-header -->

					<div class="row">
						<div class="col-xs-12">
							<form id="userForm" name="userForm" class="form-horizontal" action="update.htm" method="post">
								<input type="hidden" name="backUrl" value="${backUrl }">
								<input type="hidden" name="id" value="${sysUser.id }">
								<div class="form-group">
									<label class="col-sm-3 control-label">账号：</label>
									<div class="col-sm-9">
										<input id="username" name="username" type="text" class="col-xs-10 col-sm-5" placeholder=""
											value="${sysUser.username }" readonly="readonly"><label id="usernameTip"></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">姓名：</label>
									<div class="col-sm-9">
										<input id="realname" type="text" name="realname" class="col-xs-10 col-sm-5" placeholder=""
											value="${sysUser.realname }"><label id="realnameTip"></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">身份证号：</label>
									<div class="col-sm-9">
										<input id="idnum" type="text" name="idnum" class="col-xs-10 col-sm-5" placeholder=""
											   value="${sysUser.idnum }"><label id="idnumTip"></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">角色：</label>
									<div class="col-sm-9 ">
										<form:select path="sysUser.role_id" name="role_id" class="col-xs-10 col-sm-5" id="role_id" >
											<option value="">请选择角色</option>
											<form:options items="${listRole }" itemValue="id" itemLabel="name" />
										</form:select>
										<label id="role_idTip"></label>
									</div>
								</div>
								<div class="clearfix form-actions">
									<div class="col-md-offset-3 col-md-9">
										<button class="btn btn-primary" type="submit">
											<i class="ace-icon fa fa-save bigger-110"></i> 保存
										</button>
										<button class="btn" type="button" onclick="history.back(-1)">
											<i class="ace-icon fa fa-undo bigger-110"></i> 取消
										</button>
									</div>
								</div>
							</form>

						</div>
					</div>
					<!-- /.main-content -->
				</div>
				<!-- /.main-container -->
				<%@ include file="../common/js.jsp"%>

				<script type="text/javascript">
					$(document).ready(function() {
						$("#userForm").validate({
							//debug : true,
							errorElement : "label",
							errorClass : "valiError",
							errorPlacement : function(error, element) {
								error.appendTo($("#" + element.attr('id') + "Tip"));
							},
							rules : {
								realname : {
									required : true,
									maxlength : 20
								},
                                idnum : {
                                    required : true,
                                    isIDNum:true,
                                    maxlength : 18
                                },
								role_id : {
									required : true
								}
							},
							messages : {
								username : {
									remote : "账号已存在！"
								}
							},
							submitHandler : function(form) {
								form.submit();
							}
						});
					});
                    jQuery.validator.addMethod("isIDNum", function(value,element) {
                        var length = value.length;
                        var IDNum = /^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;
                        return  IDNum.test(value) ;

                    }, "请正确填写身份证号");
				</script>
</body>
</html>
