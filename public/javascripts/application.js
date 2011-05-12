// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

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