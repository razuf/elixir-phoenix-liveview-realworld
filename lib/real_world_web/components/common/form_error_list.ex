defmodule RealWorldWeb.FormErrorList do
  use RealWorldWeb, :live_component

  def render(assigns) do
    ~L"""
    <%= if @changeset do %>
      <ul class="error-messages">
        <%= for {error, validation} <- @changeset.errors do %>
          <li>
            <%= error %>  <%= flatten_error_message(validation) %>
          </li>
        <% end %>
      </ul>
    <% end %>
    """
  end
end
