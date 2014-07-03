$(document).ready( function () {

// обрабатывает клик на "Добавить картинку" в форме создания и редактирования каталога
// добавляет поля добавления картинок в форму
	$('#add_itemimgs_link').click( function (){
		$('#add_itemimgs_block').append('<input id="item_itemimgs_attributes_'+ item_img_attr_counter + '_picture" name="item[itemimgs_attributes]['+ item_img_attr_counter +'][picture]" type="file" /><br>')
        item_img_attr_counter = item_img_attr_counter + 1 ;
        return false ;
	});

});

