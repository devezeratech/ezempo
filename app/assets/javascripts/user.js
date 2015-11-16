var checkTabErrors = function(){
  var tabIds = $('.tab-pane .has-error').map(function(){
    // find the parent tab id
    var tabId = $(this).parents('.tab-pane').attr('id');
    var tabNav = $("[data-toggle='tab'][href='#" + tabId + "']").addClass('errors');
  });

  // show the first tab with an error
  $('.nav-tabs li > .errors').first().tab('show');
};

