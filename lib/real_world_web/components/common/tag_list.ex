defmodule RealWorldWeb.TagList do
  use RealWorldWeb, :live_component

  def render(assigns) do
    ~L"""
    <ul class="tag-list">
      <%= if is_list(@tag_list) do %>
        <%= for tag <- @tag_list do %>
          <li class="tag-default tag-pill tag-outline">
            <%= tag %>
          </li>
        <% end %>
      <% end %>
    </ul>
    """
  end
end
