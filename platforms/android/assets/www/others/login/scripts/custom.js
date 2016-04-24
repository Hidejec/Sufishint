$(document).ready(function(){

	$("#su").click(function(){
		$.ajax({
			url: "http://lol-haha.com/LiquidoAPI/login/user/"+$("#username").val()+"/"+$("#password").val(),
			type: "get",
			dataType: "json",
			success: function(data){
				window.location.href="../../specie_select.html";
			}
		});
	});
	$("#vessel_su").click(function(){
		$.ajax({
			url: "http://lol-haha.com/LiquidoAPI/login/vessel/"+$("#license_number").val()+"/"+$("#password").val(),
			type: "get",
			dataType: "json",
			success: function(data){
				window.location.href="../../specie_select.html";
			}
		});
	});
	$("#buttonu481").click(function(){
		window.location.href="../../register_watch.html";
	});
	$("#buttonu612").click(function(){
		window.location.href="../../register_vessel.html";
	});


	$("#register_watch").click(function(){
		$.ajax({
			url: "http://lol-haha.com/LiquidoAPI/register/user/"+$("#email").val()+"/"+$("#password").val(),
			type: "get",
			dataType: "json",
			success: function(data){
				window.location.href="specie_select.html";
			},
			error: function(msg){
				window.location.href="specie_select.html";
			}
		});
	});

		$("#register_vessel").click(function(){
		$.ajax({
			url: "http://lol-haha.com/LiquidoAPI/register/vessel/"+$("#license").val()+"/"+$("#email").val()+"/"+$("#company").val()+"/"+$("#officer").val()+"/"+$("#contact").val()+"/"+$("#password").val(),
			type: "get",
			dataType: "json",
			success: function(data){
				window.location.href="others/login/vessel-login.html";
			},
			error: function(msg){
				window.location.href="others/login/vessel-login.html";
			}
		});
	});

});
