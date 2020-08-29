defmodule RealWorldWeb.HomeFeedToggle do
  use RealWorldWeb, :live_component

  @impl true
  def render(assigns) do
    ~L"""
      <div class="feed-toggle">
        <ul class="nav nav-pills outline-active">

          <%= if user_signed_in?(@current_user) do %>
            <li class="nav-item">
              <%= live_patch "Your Feed", class: nav_link_active(@feed == "your_feed"), to: "?feed=your_feed"%>
            </li>
          <% end %>

            <li class="nav-item">
              <%= live_patch "Global Feed", class: nav_link_active(@feed == "global_feed"), to: "?feed=global_feed"%>
            </li>

          <%= if @tag do %>
            <li class="nav-item">
              <%= live_patch "# " <> @tag, class: "nav-link active", to: ""%>
            </li>
          <% end %>

        </ul>
      </div>
    """
  end
end
