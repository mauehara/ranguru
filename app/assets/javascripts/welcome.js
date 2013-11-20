$("#rating-restaurant .fi-star").removeClass("active");
$("#rating-help-recommendation").html("");

$("#rating-restaurant .1-star").click(function(){
	$(this).siblings().removeClass("active");
	$(this).addClass("active");
	$("#restaurant_rating_value").val(1);
	$("#rating-help-recommendation").html("Não recomendo nem para a sogra");
});
$("#rating-restaurant .2-star").click(function(){
	$(this).siblings().removeClass("active");
	$(this).siblings(".1-star").addClass("active");
	$(this).addClass("active");
	$("#restaurant_rating_value").val(2);
	$("#rating-help-recommendation").html("Estilo bandejão");
});
$("#rating-restaurant .3-star").click(function(){
	$(this).siblings().removeClass("active");
	$(this).siblings(".1-star").addClass("active");
	$(this).siblings(".2-star").addClass("active");
	$(this).addClass("active");
	$("#restaurant_rating_value").val(3);
	$("#rating-help-recommendation").html("Comível");
});
$("#rating-restaurant .4-star").click(function(){
	$(this).siblings().removeClass("active");
	$(this).siblings(".1-star").addClass("active");
	$(this).siblings(".2-star").addClass("active");
	$(this).siblings(".3-star").addClass("active");
	$(this).addClass("active");
	$("#restaurant_rating_value").val(4);
	$("#rating-help-recommendation").html("Recomendo aos melhores amigos");
});
$("#rating-restaurant .5-star").click(function(){
	$(this).siblings().removeClass("active");
	$(this).siblings(".1-star").addClass("active");
	$(this).siblings(".2-star").addClass("active");
	$(this).siblings(".3-star").addClass("active");
	$(this).siblings(".4-star").addClass("active");
	$(this).addClass("active");
	$("#restaurant_rating_value").val(5);
	$("#rating-help-recommendation").html("Casaria com o chef");
});
