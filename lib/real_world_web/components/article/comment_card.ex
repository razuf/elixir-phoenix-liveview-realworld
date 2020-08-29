defmodule RealWorldWeb.CommentCard do
  use RealWorldWeb, :live_component

  def render(assigns) do
    ~L"""
    <div class="card">
      <div class="card-block">
        <p class="card-text"><%= @comment["body"] %></p>
      </div>
      <div class="card-footer">
        <%= live_patch class: "comment-author", to: Routes.main_path(@socket, :profile, @comment["author"]["username"]) do %>
          <img src=<%= get_user_image(@comment["author"]["image"]) %> class="comment-author-img" loading="lazy" />
        <% end %>
        &nbsp;
        <%= live_patch class: "comment-author", to: Routes.main_path(@socket, :profile, @comment["author"]["username"]) do %>
          <%= @comment["author"]["username"] %>
        <% end %>

        <span class="date-posted"><%= format_datetime(@comment["createdAt"]) %></span>
        <%= if @current_user.username == @comment["author"]["username"] do %>
          <span class="mod-options">
            <button
              class="btn"
              style="background-color: transparent; padding: 0px"
              phx-click="delete_comment"
              phx-value-id="<%= @comment["id"] %>" >
                <i class="ion-trash-a"></i>
            </button>
          </span>
        <% end %>
      </div>
    </div>
    """
  end
end
