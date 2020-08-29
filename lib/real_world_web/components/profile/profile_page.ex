defmodule RealWorldWeb.ProfilePage do
  use RealWorldWeb, :live_component

  alias RealWorldWeb.ProfileFeedToggle
  alias RealWorldWeb.ListArticles
  alias RealWorldWeb.PaginationArticles

  @impl true
  def render(assigns) do
    ~L"""
    <div class="profile-page">
      <div class="user-info">
        <div class="container">
          <div class="row">
            <div class="col-xs-12 col-md-10 offset-md-1">
              <img src=<%=  get_user_image(@profile_user["image"]) %> class="user-img" loading="lazy"/>
              <h4><%= @profile_user["username"]  %></h4>
              <p>
                <%= @profile_user["bio"] %>
              </p>

              <%= if @current_user.username != @profile_user["username"] do %>
              <button
                class="<%= following_class(@profile_user["following"]) %>"
                phx-click=<%= following_click(@profile_user["following"]) %>
                phx-value-username="<%= @profile_user["username"] %>" >
                  <i class="ion-plus-round"></i>
                  &nbsp;
                  <%= following_text(@profile_user["following"]) %> <%= @profile_user["username"] %>
              </button>
              <% end %>

              <%= if @current_user.username == @profile_user["username"] do %>
                <%= live_patch class: "btn btn-sm btn-outline-secondary action-btn", to: Routes.main_path(@socket, :settings) do %>
                  <i class="ion-gear-a"></i>&nbsp;Edit Profile Settings
                <% end %>
              <% end %>

            </div>
          </div>
        </div>
      </div>

      <div class="container">
        <div class="row">
          <div class="col-xs-12 col-md-10 offset-md-1">

          <%= live_component @socket, ProfileFeedToggle,
            current_user: @current_user,
            feed: @feed %>

          <%= live_component @socket, ListArticles,
            articles: @articles %>

          <%= live_component @socket, PaginationArticles,
            url: feed_url(@feed),
            active_page: @active_page,
            pages: @pages %>

          </div>
        </div>
      </div>
    </div>
    """
  end
end
