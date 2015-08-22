class SearchPage
  include PageObject

  text_field(:search_box, :css=> ".area>input")
  button(:submit, :css => ".submit>input")
  list_items(:result_items, :css => "ul[class='search-results products-list']>li")




  def search_text(search_value)
    self.search_box = search_value
    self.submit
  end

  def get_results
    return self.result_items_elements.count
  end


end