function runSearch() {
	window.location = relPath + "QuickSearch/Start=1&Query=" + $("#query").val();
}

function subMenuFocus() {
	console.log("subFocus1")
	$('.dropdown-submenu').removeClass('open');
	$(this).parent().addClass('open');
}
