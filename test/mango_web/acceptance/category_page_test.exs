defmodule MangoWeb.Acceptance.CategoryPageTest do
  use Mango.DataCase
  use Hound.Helpers

  hound_session()

  setup do
    ## Given ##
    # There are two products Apple and Tomato priced 100 and 50
    # categorized under `fruits` and `vegetables` respectively
    alias Mango.Repo
    alias Mango.Catalog.Product
    Repo.insert %Product{name: "Tomato", price: 50, is_seasonal: false, category: "vegetables"}
    Repo.insert %Product{name: "Apple", price: 100, is_seasonal: true, category: "fruits"}

    :ok
  end

  test "show fruits" do
    navigate_to("/categories/fruits")
    
    page_title = find_element(:css, ".page-title") |> visible_text()
    assert page_title == "Fruits"

    product = find_element(:css, ".product")
    product_name = find_within_element(product, :css, ".product-name") |> visible_text()
    product_price = find_within_element(product, :css, ".product-price") |> visible_text()

    assert product_name == "Apple"
    assert product_price =~ "100"
    refute page_source() =~ "Tomato"
  end

  test "show vegetables" do
    navigate_to("/categories/vegetables")

    page_title = find_element(:css, ".page-title") |> visible_text()
    assert page_title == "Vegetables"

    product = find_element(:css, ".product")
    product_name = find_within_element(product, :css, ".product-name") |> visible_text()
    product_price = find_within_element(product, :css, ".product-price") |> visible_text()

    assert product_name == "Tomato"
    assert product_price =~ "50"
    refute page_source() =~ "Apple"
  end
  
end
