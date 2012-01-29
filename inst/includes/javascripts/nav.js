// creating nav bar and restructuring document
$(document).ready(function() {

    var $b = $('body'),
        $h = $('#header');

    // add container div
    var $container = $('<div/>', {
        class: "container"
    }).prependTo($b);

    // add sidebar
    var $sidebar = $('<div/>', {
        class: 'three columns sidebar'
    }).appendTo($container);

    // add content div
    var $content = $('<div/>', {
        class: 'twelve columns content offset-by-three content'
    }).appendTo($container);

    // all but container -> goto content div
    $b.children().not($container).appendTo($content);

    var $nav = $('<nav/>').prependTo($sidebar); // add nav to sidebar

    // add logo div
    var $logo = $('<div/>', {
        id: 'logo',
        html: $('<a/>', {
            href: 'http://rapport-package.info/',
            target: '_blank'
        })
    }).prependTo($nav);

    // move logo image to logo div
    $('div.figure').last().find('img').appendTo($logo.find('a')); // move logo
    $('div.figure').last().remove();   // remove element

    // add ul for sidebar menu
    var $ul = $('<ul/>').appendTo($nav);
    var $header = $('<header/>').prependTo($content); // add header to content div
    // move #header contents to header and remove element
    $h.children().appendTo('header');
    $h.remove();

    $header.after('<hr class="large" />');

    // get all headings
    var $head = $content.children().not('header').filter(':header');

    $head.each(function(i, val){
        
        var linkId = val.id + "_link",
            $val = $(val);

        // insert anchor links before headings
        $('<a/>', {
            id: linkId
        }).insertBefore($val);

        // insert navigation items
        $('<li/>', {
            class: 'nnav-' + $val.get(0).nodeName.replace('H', ''),
            html: $('<a>').attr({ href: '#' + linkId}).text($val.text())
        }).appendTo('nav > ul');
    });
    
    // image popups
    $('.content a > img').slimbox({
        counterText: "Plot: {x} of {y}"
        }, function(el) {
            return [el.parentNode.href];
        }
    );

});