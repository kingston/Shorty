// Default text switching-out

$( function() {
	// Add default label to textboxes
	var blurFunc = function() {
		var elem = $(this);
		if (elem.val() === "") {
			elem.val(elem.attr("title"));
			elem.addClass("title-text");
		}
	};
	$(".default-label").focus( function() {
		var elem = $(this);
		if (elem.hasClass("title-text")) {
			elem.removeClass("title-text");
			elem.val("");
		}
	})
	.blur(blurFunc)
	.attr('autocomplete', 'off')
	.each(blurFunc);
});
