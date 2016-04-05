//bugfix to enable crossdomain
$.support.cors = true;
var token;// = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJ0ZXN0dXNlciIsImV4cCI6MTQ1NzUyODExMjM3NX0.dWhyfPXkNuBAtNBv_GXdah_0puCYtIFR5SosXe2BwW0';
token ='';
function getToken()
{
	$.ajax({
		type:"POST",
		cache:false,
		url:"http://localhost:8080/apiv2/login",
		data:'{"username":"testuser","password":"testpassword"}',
		contentType: "application/json; charset=utf-8",
		dataType:"json",
		crossDomain:true,
		error: function (request, error) {
			console.log(arguments);
			$("#messages").append("<p>Couldn't connect to the server: "+error+". Check if the server is reachable.</p>");
		},
		success: function (data) {
			//alert("New token set: "+JSON.stringify(data));
			token = data.token;
			$("#messages").append("<p>New token successfully set</p>");
		}
	});
}

function getPowerStatus()
{
	if(token!=''){
		$.ajax({
			type:"GET",
			cache:false,
			url:"http://localhost:8080/apiv2/getpowerstatus",
			headers:{'X-Access-Token' : token},
			dataType:"json",
			crossDomain:true,
			error: function (request, error) {
				console.log(arguments);
				$("#messages").append("Can't get power status: " + error);
			},
			success: function (data) {
				$("#messages").append("<p>Last power status: " + JSON.stringify(data) +"</p>");
			}
		});
	}else{
		$("#messages").append('You have to get a token first!');
	}
}

function get7days()
{
	if(token!=''){
		$.ajax({
			type:"GET",
			cache:false,
			url:"http://localhost:8080/apiv2/get7days",
			headers:{'X-Access-Token' : token},
			dataType:"json",
			crossDomain:true,
			error: function (request, error) {
				console.log(arguments);
				$("#messages").append("Can't get last weeks power status because: " + error);
			},
			success: function (data) {
				$("#messages").append("<p>Last weeks power status: " + JSON.stringify(data) +"</p>");
			}
		});
	}else{
		$("#messages").append('You have to get a token first!');
	}
}

function getToday()
{
	if(token!=''){
		$.ajax({
			type:"GET",
			cache:false,
			url:"http://localhost:8080/apiv2/gettoday",
			headers:{'X-Access-Token' : token},
			dataType:"json",
			crossDomain:true,
			error: function (request, error) {
				console.log(arguments);
				$("#messages").append("Can't get todays power status because: " + error);
			},
			success: function (data) {
				$("#messages").append("<p>Todays power status: " + JSON.stringify(data) +"</p>");
			}
		});
	}else{
		$("#messages").append('You have to get a token first!');
	}
}

function postPowerOn()
{
	if(token!=''){
			$.ajax({
				type:"POST",
				data:'{"power":"1"}',
				contentType: "application/json; charset=utf-8",
				cache:false,
				url:"http://localhost:8080/apiv2/postpower",
				headers:{'X-Access-Token' : token},
				dataType:"json",
				crossDomain:true,
				error: function (request, error) {
					console.log(arguments);
					$("#messages").append("Can't post power on because: " + error);
				},
				success: function (data) {
					$("#messages").append("<p>Power turned on: " + JSON.stringify(data) +"</p>");
				}
			});
	}else{
		$("#messages").append('You have to get a token first!');
	}
}

function postPowerOff()
{
	if(token!=''){
			$.ajax({
				type:"POST",
				data:'{"power":"0"}',
				contentType: "application/json; charset=utf-8",
				cache:false,
				url:"http://localhost:8080/apiv2/postpower",
				headers:{'X-Access-Token' : token},
				dataType:"json",
				crossDomain:true,
				error: function (request, error) {
					console.log(arguments);
					$("#messages").append("Can't post power off because: " + error);
				},
				success: function (data) {
					$("#messages").append("<p>Power turned off: " + JSON.stringify(data) +"</p>");
				}
			});
	}else{
		$("#messages").append('You have to get a token first!');
	}
}