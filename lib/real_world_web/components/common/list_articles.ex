defmodule RealWorldWeb.ListArticles do
  use RealWorldWeb, :live_component

  alias RealWorldWeb.ArticlePreview

  def render(assigns) do
    ~L"""
      <%= for article <- @articles do %>
        <%= live_component @socket, ArticlePreview, id: article["slug"], article: article %>
      <% end %>
    """
  end
end
