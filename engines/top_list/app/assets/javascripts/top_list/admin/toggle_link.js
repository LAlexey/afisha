function init_toggle_link(selector_condition){

    var selector = selector_condition
    var current_link = $(selector)

    addEvents(current_link);
}

function change_class(element, klass){
    if (klass){
        $(element).attr('class', klass);
    }
}

function addEvents(selector_condition){
    selector_condition.off("ajax:before").on("ajax:before", function(){
        var element = $(this);
        var initial_text = element.data('initial-text');
        var changed_text = element.data('changed-text');

        var initial_class = element.data('initial-class');
        var changed_class = element.data('changed-class');

        var toggled = element.data('toggled');
        if (toggled) {
            element.text(initial_text);
            change_class(element, initial_class);
        }
        else {
            element.text(changed_text);
            change_class(element, changed_class);
        }
        element.data('toggled', !toggled);
    });
}