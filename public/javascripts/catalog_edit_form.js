$(document).ready( function () {

	$( "#catalog_locality" ).autocomplete({
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

// обрабатывает клик на "Добавить картинку" в форме создания и редактирования каталога
// добавляет поля добавления картинок в форму
	$('#add_catalogimgs_link').click( function (){
		$('#add_catalogimgs_block').append('<input id="catalog_catalogimgs_attributes_'+ catimg_attr_counter + '_picture" name="catalog[catalogimgs_attributes]['+ catimg_attr_counter +'][picture]" type="file" /><br>')
        catimg_attr_counter = catimg_attr_counter + 1 ;
        return false ;
	});

});

