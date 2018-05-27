<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
$(function() {
	getRepositoryAdminInfo();
})


function getRepositoryAdminInfo(){
	
	var userID = ${sessionScope.userInfo.userID};
	$.ajax({
		type : "GET",
		url : 'repositoryAdminManage/getRepositoryAdminInfo',
		dataType : "json",
		contentType : "application/json",
		data : {repositoryAdminID:userID},
		success : function(response) {
			var userInfo = response.data.data[0];
			console.log('userInfo为：'+JSON.stringify(userInfo));
			$('#id').val(userInfo.id);
			$('#tel').val(userInfo.tel);
			$('#name').val(userInfo.name);
			$('#sex').val(userInfo.sex);
			$('#birth').val(userInfo.birth);
			$('#address').val(userInfo.address);
		},
		error : function(xhr, textStatus, errorThrown) {
			// handle error
			handleAjaxError(xhr.status);
		}
	});
}


//修改个人信息
	$('#updateUserInfo').click(
			function(){
				var data = {
						id : $('#id').val(),
						name : $('#name').val(),
						sex : $('#sex').val(),
						tel : $('#sex').val(),
						address : $('#address').val(),
						birth : $('#birth').val(),
					}
					console.log('data:'+JSON.stringify(data));

					// ajax
					$.ajax({
						type : "POST",
						url : 'repositoryAdminManage/updateRepositoryAdmin',
						dataType : "json",
						contentType : "application/json",
						data : JSON.stringify(data),
						success : function(response) {
							$('#edit_modal').modal("hide");
							var type;
							var msg;
							var append = '';
							if (response.result == "success") {
								type = "success";
								msg = "更新成功";
							} else if (resposne == "error") {
								type = "error";
								msg = "更新失败"
							}
							showMsg(type, msg, append);
						},
						error : function(xhr, textStatus, errorThown) {
							$('#edit_modal').modal("hide");
							// handler error
							handleAjaxError(xhr.status);
			            }
					})
				
			});



</script>
<div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">编辑个人信息</h4>
                            </div>
                            <div class="content">
                                <form>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>公司 /单位(不可修改)</label>
                                                <input type="text" class="form-control" disabled="" placeholder="Company" value="上海电机学院">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>工号 (不可修改)</label>
                                                <input type="text" id="id" class="form-control" disabled="" placeholder="工号" value="">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>系统权限</label>
                                                <input type="text"  class="form-control" disabled="" placeholder="权限" value="${sessionScope.userInfo.role}">
                                            </div>
                                        </div>
                                        
                                    </div>

                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>姓名</label>
                                                <input type="text" id="name"  class="form-control" placeholder="姓名" value="">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>性别</label>
                                                <input type="text"  id="sex" class="form-control" placeholder="性别" value="">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>生日</label>
                                                <input type="text" id="birth" class="form-control" placeholder="1995-01-01" value="">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">联系方式</label>
                                                <input type="text"  id="tel" class="form-control" placeholder="手机号" value="">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>地址</label>
                                                <input type="text"  id="address" class="form-control" placeholder="家庭住址" value="">
                                            </div>
                                        </div>
                                    </div>


                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>工作职责</label>
                                                <textarea rows="5" class="form-control" placeholder="Here can be your description" value="Mike">按规定做好物资设备进出库的验收、记账和发放工作，做到账账相符。</textarea>
                                            </div>
                                        </div>
                                    </div>

                                    <button type="button" class="btn btn-info btn-fill pull-right" id="updateUserInfo">更新个人信息</button>
                                    <div class="clearfix"></div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card card-user">
                            <div class="image">
                                <img src="../picture/full-screen-image-3.jpg" alt="...">
                            </div>
                            <div class="content">
                                <div class="author">
                                     <a href="#">
                                    <img class="avatar border-gray" src="../picture/default-avatar.png" alt="...">

                                      <h4 class="title">${sessionScope.userInfo.userName} <br>
                                         <small>${sessionScope.userInfo.role} </small>
                                      </h4>
                                    </a>
                                </div>
                                <p class="description text-center"> 
                                                  	 人生在世，都想留下点什么。<br>但你得知道，最清晰的脚印，往往印在最泥泞的道路上。<br>选择了前进，就不要抱怨犹疑。<br>没有一点努力会浪费，你今日撒下的种子，<br>或许会在看不见想不到的某一天，悄悄地生根发芽。
                                </p>
                            </div>
                            <hr>
                            
                        </div>
                    </div>

                </div>
            </div>
        </div>
        

 
      