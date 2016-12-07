$(document).on('turbolinks:load', function () {

  // NAVBAR DROPDOWN MENU

$('.dropdown-toggle').dropdown()

// ALERT MESSAGE

$('.alertMessage').show()
// setTimeout(function() { $(".alertMessage").hide(); }, 1500)
setTimeout(function () {
  // TODO: Fix this code below
  $('.alertMessage').fadeOut(5000)

})

// mulitple buttons



(function ($) {

    // Navigation scrolls
    $('.navbar-nav li a').bind('click', function(event) {
        $('.navbar-nav li').removeClass('active');
        $(this).closest('li').addClass('active');
        var $anchor = $(this);
        var nav = $($anchor.attr('href'));
        if (nav.length) {
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top
        }, 1500, 'easeInOutExpo');

        event.preventDefault();
        }
    });

    // Add smooth scrolling to all links in navbar
    $(".navbar a, a.mouse-hover, .overlay-detail a").on('click', function(event) {
        event.preventDefault();
        var hash = this.hash;
        $('html, body').animate({
            scrollTop: $(hash).offset().top
        }, 900, function(){
            window.location.hash = hash;
        });
    });
})(jQuery);

})


/ SEARCH/FILTER FUNCTION FOR ALL LISTINGS, MY PROPERTIES, MY BIDS

  var activeSystemClass = $('.list-group-item.active')

  // something is entered in search form
  $('#system-search').keyup(function () {
    var that = this

    // affect all table rows on in systems table
    var tableBody = $('.table-list-search tbody')
    var tableRowsClass = $('.table-list-search tbody tr')
    $('.search-sf').remove()
    tableRowsClass.each(function (i, val) {
      // Lower text for case insensitive
      var rowText = $(val).text().toLowerCase()
      var inputText = $(that).val().toLowerCase()
      if (inputText != '') {
        $('.search-query-sf').remove()
        tableBody.prepend('<tr class="search-query-sf"><td colspan="6"><strong>Searching for: "' + $(that).val() + '"</strong></td></tr>')
      } else {
        $('.search-query-sf').remove()
      }
      if (rowText.indexOf(inputText) == -1) {
        // hide rows
        tableRowsClass.eq(i).hide()
      } else {
        $('.search-sf').remove()
        tableRowsClass.eq(i).show()
      }
    })

    // all tr elements are hidden
    if (tableRowsClass.children(':visible').length == 0) {
      tableBody.append('<tr class="search-sf"><td class="text-muted" colspan="6">No entries found.</td></tr>')
    }
  })
