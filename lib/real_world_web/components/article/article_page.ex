defmodule RealWorldWeb.ArticlePage do
  use RealWorldWeb, :live_component

  alias RealWorldWeb.ArticleMeta
  alias RealWorldWeb.FormErrorList
  alias RealWorldWeb.CommentForm
  alias RealWorldWeb.CommentCard
  alias RealWorldWeb.TagList

  @impl true
  def render(assigns) do
    ~L"""
    <div class="article-page">
      <div class="banner">
        <div class="container">
          <h1><%= @article["title"] %></h1>

          <%= live_component @socket, ArticleMeta, current_user: @current_user, article: @article %>

        </div>
      </div>
      <div class="container page">

        <div class="row article-content">
          <div class="col-md-12">
            <div class="">
              <%= raw(Earmark.as_html!(@article["body"])) %>
            </div>
            <%= live_component @socket, TagList, tag_list: @article["tagList"] %>

          </div>
        </div>

        <hr />
        <div class="article-actions">

          <%= live_component @socket, ArticleMeta, current_user: @current_user, article: @article %>

        </div>
        <div class="row">
          <div class="col-xs-12 col-md-8 offset-md-2">

            <%= unless user_signed_in?(@current_user) do %>
              <p style="display: inherit;">
                <%= live_patch "Sign in", to: Routes.main_path(@socket, :login) %>
                or
                <%= live_patch "Sign up", to: Routes.main_path(@socket, :register) %>
                to add comments on this article.
              </p>
            <% end %>

            <%= live_component @socket, FormErrorList, changeset: @changeset %>

            <%= if user_signed_in?(@current_user) do %>
              <%= live_component @socket, CommentForm, current_user: @current_user, changeset: @changeset, submit: @submit %>
            <% end %>

            <%= for comment <- @comments do %>
              <%= live_component @socket, CommentCard, current_user: @current_user, comment: comment %>
            <% end %>

          </div>
        </div>
      </div>
    </div>
    """
  end
end
