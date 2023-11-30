defmodule Amazin.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :cart_id, references(:carts, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:orders, [:cart_id])
  end
end
