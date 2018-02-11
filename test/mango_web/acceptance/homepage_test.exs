defmodule MangoWeb.HomepageTest do
  use Mango.DataCase
  use Hound.Helpers

  hound_session()

  setup do
    alias Mango.Repo
    alias Mango.Catalog.Product
    Repo.insert %Product{name: "Tomato", price: 50, is_seasonal: false}
    Repo.insert %Product{name: "Apple", price: 100, is_seasonal: true}
    :ok
  end

  test "presence of seasonal products" do
    navigate_to("/")

    page_title = find_element(:css, ".page-title") |> visible_text()
    assert page_title == "Seasonal products"

    product = find_element(:css, ".product")
    product_name = find_within_element(product, :css, ".product-name") |> visible_text()
    product_price = find_within_element(product, :css, ".product-price") |> visible_text()

    assert product_name == "Apple"
    assert product_price =~ "100"
    refute page_source() =~ "Tomato"
  end
end