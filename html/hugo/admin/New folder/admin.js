$(document).ready(function() {
	$( "#open" ).hide();
	//$("#myselect").attr("disabled", true); ;
	
	//$(document).on("change",'#myselect', function(e) {
  	$("#myselect").change(function() {
     // 
     //  alert("aaaannn");
      //$(this).prop("disabled", true);
     // $("input[type=submit]:last").trigger;
   //   $("input:submit").get(2).click(); 
      $( "#open" ).trigger( "click" );
  //    alert("nnn");
	});
	
	
	
	
	var editor = new Editor();
    editor.render();
	//alert(encodeURIComponent($("#mytextarea").val()));
	var oldVal = "";
 
 //jQuery.ajaxSetup({async:false});
 
$("#myform").submit(function(event) {

// alert("nnn");
//alert($("#myselect").val());

//$("#mytextarea").val(encodeURIComponent($("#mytextarea").val()));
//$("#mytextarea").val("lllll");
 
 //alert("ppp");
 //alert($("#mytextarea").val());
 //event.preventDefault();

//$.post("admin.sh",  encodeURIComponent($(this).serialize()) , function(data){
           
           //$("#result").html("fdata");
         // alert(data);
//});

});
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
$("#mytextarea").on("change keyup paste", function() {
    var currentVal = $(this).val();
    
    if(currentVal == oldVal) {
        return; 
    }

    oldVal = currentVal;
     
  
    });
			$("#render").html(function () {
			return "<b>"+oldVal+"</b>"
			});

   
    
    




});
