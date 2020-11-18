<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Spring-Calculator</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#math").click(function(event) {				
 			if($("#firstValue").val() != "" && $("#secondValue").val()!= "" ) 
 			{
 				if(!($("#secondValue").val() == "0"  && $("#comboBox").val() == "div" )) 
 					ajaxPost(); 	
 			}
									
		});
		function ajaxPost() {
			var value = {
					"firstValue":$("#firstValue").val(),
					"secondValue":$("#secondValue").val()	
				};
			$.ajax({
				type : "POST",
		        contentType : 'application/json',
		        dataType : 'json',
		        url : "http://localhost:8080/calculator/"+$("#comboBox").val(),
		        data : JSON.stringify(value),
				
				success : function(result) {														
					$("#result").html(result % 1 === 0 ? "<font size=6><b>Result:"+result +"<b></font>":"<font size=6><b>Result:"+ result.toFixed(2))+"<b></font>";										
					},
				 error : function(e) {
					 $("#result").html('');					 
				 }
			});
		}
		$(".calc").keypress(function(evt) {
		    var charCode = (evt.which) ? evt.which : event.keyCode
		         if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46)
		             return false;
		         else {
		             var len = $(this).val().length;
		             var index = $(this).val().indexOf('.');
		             
		             if(len >= 12 || index >= 11 )
		                 return false;
		             
		             if(charCode == 46 && (len == 11 || len == 0) )
		                 return false;

		             if(charCode == 48 && len == 0)
		                 return false;
		             
		             if (index > 0 && charCode == 46) {
		                 return false;
		             }		             
		             if (index > 0) {		            	 
		                 var CharAfterdot = (len + 1) - index;
		                 if (CharAfterdot > 3) {
		                     return false;
		                 }
		             }

		         }
		         return true;
		    
			});
	});
	</script>
<style>
html,
body {
  overflow-x: hidden;
  font-family: "Open Sans", sans-serif;
  font-weight: 300;
  color: #fff;
  background: #efefef;
}
.row {
  max-width: 800px;
  margin: 0 auto;
  padding: 15px 30px;
  text-align: center;
 
  
  span {
    position: relative;
    display: inline-block;
    margin: 30px 10px;
  }
}
.calc,#comboBox, #math {
  display: inline-block;
  width: 215px;
  padding: 10px 0 10px 15px;
  font-family: "Open Sans", sans;
  font-weight: 400;
  color: #377D6A;
  background: #efefef;
  border: 0;
  border-radius: 3px;
  outline: 0;
  text-indent: 70px; 
  size="8"
}

#comboBox, #math {
    width: 242px;
   background-position: 97% center;
   background-repeat: no-repeat;
   border: 1px solid #AAA;
   color: #555;
   font-size: inherit;
   overflow: hidden;
   padding: 5px 10px;
   text-overflow: ellipsis;
   white-space: nowrap;
  
}
.calc{
    padding-right: 12px;}
</style>
</head>
<body>
	<div class="row">
		<span> <input type="text" placeholder="First Value"
			name="firstValue" id="firstValue" style="text-align: right;"
			class="calc" />
		</span> 
	</div>
	<div class="row">
	<span> <input type="text" placeholder="Second Value"
			name="secondValue" id="secondValue" style="text-align: right;"
			class="calc" />
		</span>
	</div>
	<div class="row">
		<select name="comboBox" id="comboBox">
			<option value="summation">Summation</option>
			<option value="subtraction">Subtraction</option>
			<option value="division">Division</option>
			<option value="multiplication">Multiplication</option>
		</select> <br>
	</div>
	<div class="row">
		<button type="button" id="math">Send</button>
	</div>
	<div class="row">
		<p id='result'> </p>
	</div>
</body>
</html>