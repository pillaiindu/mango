defmodule Mango.Catalog.Product do
<<<<<<< HEAD
  use Ecto.Schema

  schema "products" do
    field :image, :string
    field :is_seasonal, :boolean, default: false
    field :name, :string
    field :price, :decimal
    field :sku, :string
    field :category, :string
    field :pack_size, :string

    timestamps()
  end
=======
  defstruct [:name, :price, :is_seasonal, :category]
>>>>>>> 576a10252508a04b651639eecf26a607f5616b1f
end