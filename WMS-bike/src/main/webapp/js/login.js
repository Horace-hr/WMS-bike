$(function() {
			validatorInit();
			refreshCheckCode();
		});

		// 刷新图形验证码
		function refreshCheckCode() {
			$('#checkCodeImg').click(function() {
				var timestamp = new Date().getTime();
				$(this).attr("src", "account/checkCode/" + timestamp)
			})
		}

		// 登陆信息加密模块
		function infoEncrypt(userID, password, checkCode) {
			var str1 = $.md5(password);
			var str2 = $.md5(str1 + userID);
			var str3 = $.md5(str2 + checkCode.toUpperCase());
			return str3;
		}

		function validatorInit() {
			$('#login_form').bootstrapValidator({
				message : 'This value is not valid',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {
					userID : {
						validators : {
							notEmpty : {
								message : '用户名不能为空'
							},regexp: {
		                        regexp: '[0-9]+',
		                        message: '只允许输入数字'
		                    },
							callback : {}
						}
					},
					password : {
						validators : {
							notEmpty : {
								message : '密码不能为空'
							},
							callback : {}
						}
					},
					checkCode : {
						validators : {
							notEmpty : {
								message : '验证码不能为空'
							}
						}
					}
				}
			})
			.on('success.form.bv', function(e) {
				// 禁用默认表单提交
				e.preventDefault();

				// 获取 form 实例
				var $form = $(e.target);
				// 获取 bootstrapValidator 实例
				var bv = $form.data('bootstrapValidator');

				// 发送数据到后端 进行验证
				var userID = $('#userID').val();
				var password = $('#password').val();
				var checkCode = $('#checkCode').val();
				console.log('userId:'+userID+'  ----password:'+password+'   ----checkCode:'+checkCode);

				// 加密
				password = infoEncrypt(userID, password, checkCode)

				var data = {
					"id" : userID,
					"password" : password,
				}
				console.log('data---》'+JSON.stringify(data));
				$.ajax({
					type:"POST",
					url:"account/login",
					dataType:"json",
					contentType:"application/json",
					data:JSON.stringify(data),
					success:function(response){
						// 接收到后端响应
						
						// 分析返回的 JSON 数据
						if(response.result == 'error'){
							var errorMessage;
							var field;
							if(response.msg == "unknownAccount"){
								errorMessage = "用户名错误";
								field = "userID";
							}
							else if(response.msg == "incorrectCredentials"){
								errorMessage = "密码或验证码错误";
								field = "password";
								$('#password').val("");
							}else{
							    errorMessage = "服务器错误";
                                field = "password";
                                $('#password').val("");
							}
								
							// 更新 callback 错误信息，以及为错误对应的字段添加 错误信息
							bv.updateMessage(field,'callback',errorMessage);
							bv.updateStatus(field,'INVALID','callback');
							bv.updateStatus("checkCode",'INVALID','callback');
							
							$('#checkCodeImg').attr("src","account/checkCode/" + new Date().getTime());
							$('#checkCode').val("");
						}else{
							// 页面跳转
							window.location.href = "/";
						}
					},
					error:function(data){
						// 处理错误
					}
				});
			});
		}