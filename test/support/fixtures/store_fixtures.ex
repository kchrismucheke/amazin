defmodule Amazin.StoreFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Amazin.Store` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        amount: 42,
        description: "some description",
        name: "some name",
        stock: 42,
        thumbnail: "some thumbnail"
      })
      |> Amazin.Store.create_product()

    product
  end
end
