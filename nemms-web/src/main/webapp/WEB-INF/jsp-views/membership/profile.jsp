<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp-views/frame/init.jsp"%>
<style>
	.login-info .active a{
		color:#fff;
		position: relative;
	}
	.login-info .active:before {
		content: "\f0d9";
		font-family: "Microsoft Yahei","SimSun",FontAwesome;
		display: block;
		height: 27px;
		line-height: normal;
		width: 27px;
		position: absolute;
		right: -21px;
		top: 7px;
		font-size: 20px;
		color: #eee;
	}
	.pwd-inputs input.invalid {
		border-color:#c00;
	}
	.pwd-inputs em.invalid {
		color:#c00;
		font-style: normal;
	}
	.profile-card {
		width:400px;
		margin:50px auto;
		box-shadow: 0 0 10px rgba(0, 0, 0, .55);
	}
	.profile-card h3 {
		margin:0;
	}
	.profile-hd {
		height:260px;
		background:url('/facemb-web/assets/img/profile.jpg') no-repeat;
		color:#fff;
		overflow-y: hidden;
	}
	.profile-hd .card-title {
		text-align: center;
		margin:0;
	}
	.card-title div{
		font-size: 30px;
		margin:55px auto;
		width:150px;
		height:150px;
		padding: 35px 0;
		text-align: center;
		border-radius:100px;
		line-height: 40px;
		background-color: rgba(0, 0, 0, .55);
	}
	.profile-bd {
		border-top: none;
		padding:15px 25px;
		background-color: #f0f0f0;
	}
	.profile-name {
		font-size: 28px;
	}
	.profile-role, .profile-username{
		color:#777;
		margin:5px 0;
	}
	.list-unstyled {
		border-top: 1px solid #dedede;
		padding-top: 15px;
		margin-top: 15px;
		font-size: 16px;
	}
	.btn-pwd-modify {
		height:45px;
		margin-top: 25px;
		border-radius:25px;
		background-color: #7A94CF;
		color:#fff;
		line-height: 45px;
		text-align: center;
		cursor: pointer;
	}
	.btn-pwd-modify:hover{
		background-color: #648BE2;
	}
</style>
<div class="profile-card" id="profileCard">
	<div class="profile-hd">
		<h3 class="card-title">
			<div>个人<br/>资料</div>
		</h3>
	</div>
	<div class="profile-bd">
			<h3 class="profile-name">${user.name}</h3>
			<div class="profile-username">${user.account}</div>
			<div class="profile-role">${roleNames}</div>

			<ul class="list-unstyled">
				<li>
					<p class="text-muted">
						<i class="fa fa-phone"></i>&nbsp;&nbsp;(<span class="txt-color-darken">${user.telephone}</span>)
					</p>
				</li>
				<li>
					<p class="text-muted">
						<i class="fa fa-envelope"></i>&nbsp;&nbsp;<a href="mailto:${user.email }">${user.email }</a>
					</p>
				</li>
				<li>
					<p class="text-muted">
						<div class="btn-pwd-modify" id="btnPwdModify" data-toggle="modal" data-target="#pwdModal">修改密码</div>
					</p>
				</li>
			</ul>
		</div>
</div>
<div class="modal fade" id="pwdModal" style="padding-left:220px;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<form id="pwdInputs">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						×
					</button>
					<h4 class="modal-title" id="myModalLabel">修改密码</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-12 pwd-inputs">
							<div class="form-group">
								<input type="password" id="lastLoginPwd" class="form-control" name="oldPassword" placeholder="原密码" required>
							</div>
							<div class="form-group">
								<input type="password" id="loginPwd" class="form-control" name="password" placeholder="新密码" minlength="6" required>
							</div>
							<div class="form-group">
								<input type="password" id="loginPwdRepeat" name="repassword" class="form-control" placeholder="新密码确认" minlength="6" required>
							</div>
						</div>
						
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						取消
					</button>
					<button type="submit" class="btn btn-primary">
						确认
					</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
	$.bread_crumb.html('<li>个人资料</li>');
	$('.login-info nav').addClass('active');
	pageSetUp();
	
	loadScript('<%=request.getContextPath()%>/assets/js/plugin/jquery-validate/jquery.validate.min.js', function() {
		$('#pwdInputs').validate({
			messages: {
			    password: "密码最小长度为6",
			    repassword: "密码最小长度为6"
			},
			submitHandler: function(form) {
				var pwd = $('#loginPwd').val();
				var pwdRepeat = $('#loginPwdRepeat').val();
				if(pwd === pwdRepeat) {
					$.post('<%=request.getContextPath()%>/membership/user/updateUserPassword', {
						userId: window.userId,
						password: pwd,
						oldPassword: $('#lastLoginPwd').val()
					}).done(function(ret) {
						if(ret.success) {
							$('#pwdModal').modal('hide').find('.pwd-inputs input').val('');
							$.smallBox({
								title : '密码修改成功',
								color : "#739E72",
								iconSmall : "fa fa-times fadeInRight animated",
								timeout : 4000
							});
						} else {
							$.smallBox({
								title : ret.msg,
								color : "#C46A69",
								iconSmall : "fa fa-times fadeInRight animated",
								timeout : 4000
							});
						}
					}).fail(function() {

					})
				} else {
					$.smallBox({
						title : "密码输入不一致",
						color : "#C46A69",
						iconSmall : "fa fa-times fadeInRight animated",
						timeout : 4000
					});
					$('#loginPwd').focus();
				}
			}
		});
	})
	
	$(document).on('page_destroy', function() {
		$('.login-info nav').removeClass('active');
	})

	$('#profileCard').addClass('bounceInUp animated');
</script>
