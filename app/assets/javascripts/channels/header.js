$(document).ready(function() {
  $('#livesearch_input').hsearchbox({
    url: $('#livesearch_form').attr('action'),
    param: 'search',
    dom_id: '#livesearch_dom',
    loading_css: '#livesearch_loading',
    onInitSearch: function() {
      console.log("search init:" + this.url);
    },
    onStartSearch: function() {
      console.log("search start");
    },
    onFinishSearch: function() {
      console.log("search finish");
    }
  });
  $('#livesearch_user_input').hsearchbox({
    url: $('#livesearch_user_form').attr('action'),
    param: 'search',
    dom_id: '#livesearch_user_dom',
    loading_css: '#livesearch_user_loading',
    onInitSearch: function() {
      console.log("user init:" + this.url);
    },
    onStartSearch: function() {
      console.log("user start");
    },
    onFinishSearch: function() {
      console.log("user finish");
    }
  });