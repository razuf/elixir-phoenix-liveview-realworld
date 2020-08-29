defmodule RealWorldWeb.HomePage do
  use RealWorldWeb, :live_component

  alias RealWorldWeb.HomeFeedToggle
  alias RealWorldWeb.ListArticles
  alias RealWorldWeb.PaginationArticles

  @impl true
  def render(assigns) do
    ~L"""
    <div class="home-page">
      <div class="banner">
        <div class="container">
          <h1 class="logo-font">conduit</h1>
          <p>A place to share your Elixir knowledge.</p>
        </div>
      </div>

      <div class="container page">
        <div class="row">
          <div class="col-md-9">

            <%= live_component @socket, HomeFeedToggle,
              current_user: @current_user,
              feed: @feed,
              tag: @tag %>

            <%= live_component @socket, ListArticles,
              articles: @articles %>

            <%= live_component @socket, PaginationArticles,
              url: feed_url(@feed),
              active_page: @active_page,
              pages: @pages %>

          </div>

          <div class="col-md-3">
            <div class="sidebar">
              <p>Popular Tags</p>
              <div class="tag-list">

                <%= if @tags == [] do %>
                  <div class="post-preview ng-hide">
                    <!-- No tags are here... yet. -->
                    <!-- or -->
                    Loading tags...
                  </div>
                <% else %>
                  <%= for tag <- @tags do %>
                    <%= live_patch "#{tag}", class: "tag-pill tag-default", to: "?feed=tag_#{tag}" %>
                  <% end %>
                <% end %>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
