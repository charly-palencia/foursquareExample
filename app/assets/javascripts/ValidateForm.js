$(document).ready(function(){
	
	var options= {
       beforeSubmit: mostrarLoader, //funcion que se ejecuta antes de enviar el form
       success: mostrarRespuesta //funcion que se ejecuta una vez enviado el formulario
    };
    $('#formUser').ajaxForm(options) ; 
    $('#formVenues').ajaxForm(options) ; 
     function mostrarLoader(){
          $("#loader_gif").fadeIn("slow"); //muestro el loader de ajax
     };
     function mostrarRespuesta (responseText){
          $("#loader_gif").fadeOut("slow"); // Hago desaparecer el loader de ajax
          $("#ajax_loader").html(responseText); 
     };
     $("#formUser").validate({
		phone: "digits",
		email: "email"
	}); 

	$("#formVenues").validate({
		ll: "required",
		llAcc: "digits",
		alt: "number"	
	});
	$(function() {
		$( "#accordion" ).accordion();
	});
	$(".clear").click(function(){
		$("#ajax_loader").html();
	});


	$(".href_ajax").click(function(event){
		event.preventDefault();
		var href=$(this).attr("href");
		$("#loader_gif").fadeIn("slow");
		$('#ajax_loader').load(href);
		$("#loader_gif").fadeOut("slow");
	})

})


// required: "This field is required.",
// 		remote: "Please fix this field.",
// 		email: "Please enter a valid email address.",
// 		url: "Please enter a valid URL.",
// 		date: "Please enter a valid date.",
// 		dateISO: "Please enter a valid date (ISO).",
// 		number: "Please enter a valid number.",
// 		digits: "Please enter only digits.",
// 		creditcard: "Please enter a valid credit card number.",
// 		equalTo: "Please enter the same value again.",
// 		accept: "Please enter a value with a valid extension.",
// 		maxlength: $.validator.format("Please enter no more than {0} characters."),
// 		minlength: $.validator.format("Please enter at least {0} characters."),
// 		rangelength: $.validator.format("Please enter a value between {0} and {1} characters long."),
// 		range: $.validator.format("Please enter a value between {0} and {1}."),
// 		max: $.validator.format("Please enter a value less than or equal to {0}."),
// 		min: $.validator.format("Please enter a value greater than or equal to {0}.")