$(document).ready( function(){

	$width_el='100%';
    // Кнопка развёртывания свёрнтывания блока страниц каталога
	$("#togle_str").click(function(){
		$("#block_str").animate({ 
			width: $width_el, height: 'auto!important'         // ширина станет 100%
			}, 500,
			function () {
				if ($width_el== '100%') $width_el='33%'; else $width_el='100%'
			}
		);               // анимация будет происходить 1,5 секунды
    });

/*Запуск скрипта галереи*/
	if ($('.galleria').size() > 0) {
		Galleria.loadTheme('/javascripts/galleria/themes/classic/galleria.classic.min.js');
		Galleria.configure({
			imageCrop: true,
			transition: 'fade',
			lightbox: true					
		});
		Galleria.run('.galleria');
	}

/* /Запуск скрипта галереи*/
	$(".show_hide_map").click(function(){
		$('#map').toggle(800);
	});

});
