$(document).ready( function () {
	$( "#user_locality" ).autocomplete({
		source: function(request, response){
			$.ajax({
				url: "/localities/get_locality",
				dataType: "json",
				data: { locality_name_starts_with: request.term },
				success: function(data){
					response($.map( data, function(item){
						return {
							label: item.name,
							value: item.name,
							id: item.id
						}
					}));
				},
				error: function(jqXHR, textStatus, errorThrown){
					alert(textStatus);
					alert(errorThrown);
				}
			});
		},
		minLength: 2,
		select: function(event, ui){
			//alert(ui.item);
		},
		open: function(){
			$(this).removeClass("ui-corner-all").addClass("ui-corner-top");
		},
		close: function(){
			$(this).removeClass("ui-corner-top").addClass("ui-corner-all");
		}
	});
	$( "#user_birthday" ).datepicker({ dateFormat: 'yy-mm-dd' });
});
