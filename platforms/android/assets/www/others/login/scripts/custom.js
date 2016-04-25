$(document).ready(function(){

	$("#su").click(function(){
		/*$.ajax({
			url: "http://lol-haha.com/LiquidoAPI/login/user/"+$("#username").val()+"/"+$("#password").val(),
			type: "get",
			dataType: "json",
			success: function(data){
				window.location.href="../../info_page.html";
			}
		});*/
		window.location.href="../../modules/info_page.html";
	});
	$("#vessel_su").click(function(){
		/*$.ajax({
			url: "http://lol-haha.com/LiquidoAPI/login/vessel/"+$("#license_number").val()+"/"+$("#password").val(),
			type: "get",
			dataType: "json",
			success: function(data){
				window.location.href="../../info_page.html";
			}
		});*/
		window.location.href="../../modules/info_page.html";
	});
	$("#buttonu481").click(function(){
		window.location.href="../../modules/register_watch.html";
	});
	$("#buttonu612").click(function(){
		window.location.href="../../modules/register_vessel.html";
	});


	$("#register_watch").click(function(){
		/*$.ajax({
			url: "http://lol-haha.com/LiquidoAPI/register/user/"+$("#email").val()+"/"+$("#password").val(),
			type: "get",
			dataType: "json",
			success: function(data){
				window.location.href="info_page.html";
			},
			error: function(msg){
				window.location.href="info_page.html";
			}
		});*/
		window.location.href="../others/login/userlogin.html";
	});

	$("#register_vessel").click(function(){
		/*$.ajax({
			url: "http://lol-haha.com/LiquidoAPI/register/vessel/"+$("#license").val()+"/"+$("#email").val()+"/"+$("#company").val()+"/"+$("#officer").val()+"/"+$("#contact").val()+"/"+$("#password").val(),
			type: "get",
			dataType: "json",
			success: function(data){
				window.location.href="others/login/vessel-login.html";
			},
			error: function(msg){
				window.location.href="others/login/vessel-login.html";
			}
		});*/
		window.location.href="../others/login/vessel-login.html";
	});

});
