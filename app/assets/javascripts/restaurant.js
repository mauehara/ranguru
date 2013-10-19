$("#restaurant_list .item").on("click", function() {
	var restaurant_id = $(this).data("restaurant-id");
	$.ajax({
  type: "GET",
  url: "/restaurants/modal.js?restaurant_id=" + restaurant_id
	})
  .done(function( msg ) {
    $('#mymodal').foundation('reveal', 'open');
  });
});