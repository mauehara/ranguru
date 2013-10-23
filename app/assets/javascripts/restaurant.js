var current_page = 1;

var bindEvents = function() { 
	$("#restaurant_list .item:not('.bound')").addClass("bound").on("click", function() {
		var restaurant_id = $(this).data("restaurant-id");
		$.ajax({
	  type: "GET",
	  url: "/restaurants/modal.js?restaurant_id=" + restaurant_id
		})
	  .done(function( msg ) {
	    $('#mymodal').foundation('reveal', 'open');
	  });
	});
};

$("#item-load-more").on("click", function() {
	current_page = current_page + 1;
	$.ajax({
  type: "GET",
  url: "/restaurants/index.js?page=" + current_page
	})
  .done(function( msg ) {
    // $('#mymodal').foundation('reveal', 'open');
  });
});

bindEvents();