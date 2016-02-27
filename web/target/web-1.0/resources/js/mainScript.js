/*
 THIS SCRIPT SHOULD CONTAIN ONLY COMMON FEATURES
 */
$(document).ready(function () {

    $(".dropdown_btn").click(function () {
        $(this).closest(".item").next("ul").toggleClass("hidden");
    })
    $(".purchase_material").click(function () {
        $(this).closest(".purchase").children(".controller").toggleClass("hidden");
    })


    function underline_active_menu_item() {
        $(".menu_item").each(function () {
            var url = $(location).attr('href')
            var shortURL = url.substr(url.lastIndexOf('/') + 1)
            var a_href = $(this).attr('href');
            var shortHref = a_href.substr(a_href.lastIndexOf('/') + 1);
            if (shortHref == shortURL) {
                $(this).addClass('active_menu_item')
            }
        });
    }

    underline_active_menu_item()

    function cleanTr() {
        $("tr").each(function () {
            $(this).removeClass('selected_table_row')
        })
    }

    /*
     Selected string at click
     */

    $("tr").click(function () {
        cleanTr()
        $(this).addClass('selected_table_row')
    });

    /*
     Grey color for add string
     */

    (function PaintBlackWhiteTable() {
        var tr = document.getElementsByTagName("tr");
        for (var j = 0; j < tr.length; j++) {
            if (!(j % 2)) tr[j].className = "grey_table_row";
        }
    })()
});