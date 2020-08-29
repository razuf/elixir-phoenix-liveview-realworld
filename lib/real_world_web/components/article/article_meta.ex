defmodule RealWorldWeb.ArticleMeta do
  use RealWorldWeb, :live_component

  alias RealWorldWeb.ArticleMetaUser

  def render(assigns) do
    ~L"""
    <div class="article-meta">

      <%= live_component @socket, ArticleMetaUser, article: @article %>

      <%= if @current_user.username != @article["author"]["username"] do %>
        <button
          class="<%= following_class(@article["author"]["following"]) %>"
          phx-click=<%= following_click(@article["author"]["following"]) %>
          phx-value-username="<%= @article["author"]["username"] %>" >
            <i class="ion-plus-round"></i>
            &nbsp;
            <span><%= following_text(@article["author"]["following"])  %> <%= @article["author"]["username"]  %></span>
        </button>
        &nbsp;&nbsp;
        <button
          class="btn btn-sm <%= favorited_button(@article["favorited"]) %>"
          phx-click=<%= favorited_click(@article["favorited"]) %>
          phx-value-slug="<%= @article["slug"] %>" >
            <i class="ion-heart"></i>
            &nbsp;
            <%= favorited_text(@article["favorited"]) %> <span class="counter">(<%= @article["favoritesCount"] %>)</span>
        </button>
      <% end %>

      <%= if @current_user.username == @article["author"]["username"] do %>
        <%= live_patch class: "btn btn-sm btn-outline-secondary", to: Routes.main_path(@socket, :editor, @article["slug"]) do %>
          <i class="ion-edit"></i>
          <span>&nbsp;Edit Article</span>
        <% end %>
        &nbsp;&nbsp;
        <button
          class="btn btn-outline-danger btn-sm"
          phx-click="delete_article"
          phx-value-slug="<%= @article["slug"] %>" >
            <i class="ion-trash-a"></i>
            &nbsp;
            <span>Delete Article</span>
        </button>
      <% end %>

    </div>
    """
  end
end
