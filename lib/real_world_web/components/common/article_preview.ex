defmodule RealWorldWeb.ArticlePreview do
  use RealWorldWeb, :live_component

  alias RealWorldWeb.TagList
  alias RealWorldWeb.ArticleMetaUser

  def render(assigns) do
    ~L"""
    <div id="<%= @id %>" class="article-preview">
      <div class="article-meta">

        <%= live_component @socket, ArticleMetaUser, article: @article %>

        <button
          class="btn btn-sm pull-xs-right <%=  favorited_button(@article["favorited"]) %>"
          phx-click=<%= favorited_click(@article["favorited"])  %>
          phx-value-slug="<%= @article["slug"] %>" >
            <i class="ion-heart"></i>
            <span><%= @article["favoritesCount"] %></span>
        </button>
      </div>
      <a class="preview-link" data-phx-link="patch" data-phx-link-state="push" href=<%= Routes.main_path(@socket, :article, @article["slug"]) %> >
        <h1><%= @article["title"]  %></h1>
        <p><%= @article["description"]  %></p>
        <span>Read more...</span>

        <%= live_component @socket, TagList, tag_list: @article["tagList"] %>

      </a>
    </div>
    """
  end
end
