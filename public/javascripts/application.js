// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
// public/javascripts/application.js

jQuery.ajaxSetup({
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

jQuery.fn.submitWithLiveAjax = function(event) {
    $j.post(this.action, jQuery(this).serialize(), null, "script");
    return false;
};

jQuery.fn.clickWithLiveAjax = function(event) {
    $j.post(this.href, { _method: 'get' }, null, "script");
    return false;
};


$j(document).ready(function() {
    $j('a ajax').livequery('click', jQuery.fn.clickWithLiveAjax);
})

