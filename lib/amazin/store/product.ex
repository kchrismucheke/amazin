defmodule Amazin.Store.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :name, :string
    field :description, :string
    field :amount, :integer
    field :stock, :integer
    field :thumbnail, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:amount, :description, :name, :stock, :thumbnail])
    |> validate_required([:amount, :description, :name, :stock, :thumbnail])
  end
end
