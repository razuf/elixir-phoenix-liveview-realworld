defmodule RealWorldWeb.ArticleMetaUser do
  use RealWorldWeb, :live_component

  def render(assigns) do
    ~L"""
    <%= live_patch to: Routes.main_path(@socket, :profile, @article["author"]["username"]) do %>
      <img class="user-pic" src= <%= get_user_image(@article["author"]["image"]) %>  loading="lazy">
    <% end %>

    <div class="info">
      <%= live_patch class: "author", to: Routes.main_path(@socket, :profile, @article["author"]["username"]) do %>
        <%= @article["author"]["username"] %>
      <% end %>
      <span class="date"><%= format_datetime(@article["createdAt"]) %></span>
    </div>
    """
  end
end
