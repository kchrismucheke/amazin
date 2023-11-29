defmodule AmazinWeb.CartLive.Show do
    use AmazinWeb, :live_view
  
    alias Amazin.Store
  
    @impl true
    def mount(_params, session, socket) do
      cart_items = Store.list_cart_items(session["cart_id"])
  
      total =
        cart_items
        |> Enum.map(fn ci -> ci.product.amount * ci.quantity end)
        |> Enum.sum()
        |> Money.new()
  
      socket =
        socket
        |> assign(:cart_id, session["cart_id"])
        |> assign(:total, total)
        |> stream(:cart_items, cart_items)
  
      {:ok, socket}
    end
  
    @impl true
    def handle_params(_params, _url, socket) do
      {:noreply, socket}
    end
  end