$ ->
  $("#search-name").select2
    placeholder: "Search for a cafe"
    minimumInputLength: 1
    quiteMillis: 200
    ajax: # instead of writing the function to execute the request we use Select2's convenient helper
      url: "/shops/find_shops.json"
      dataType: "json"
      data: (term, page) ->
        keyword: term # search term
        page_limit: 10

      results: (data, page) -> # parse the results into the format expected by Select2.
        # since we are using custom formatting functions we do not need to alter remote JSON data
        results: data

    # formatResult: format
    formatResult: (shop) ->
      markup = "<p class='shop-info'>" + shop.name + "</p>"
      markup
    formatSelection: (shop) ->
      return shop.name
    dropdownCssClass: "bigdrop"
    escapeMarkup: (m) -> # we do not want to escape markup since we are displaying html in results
      m

  $("#search-name").change ->
    shop = $(this).select2("data")
    window.location = "/shops/#{shop.id}"