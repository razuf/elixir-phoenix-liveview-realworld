defmodule RealWorldWeb.ProfileFeedToggle do
  use RealWorldWeb, :live_component

  @impl true
  def render(assigns) do
    ~L"""
    <div class="articles-toggle">
      <ul class="nav nav-pills outline-active">
        <li class="nav-item active">

          <%= live_patch "My Articles", class: nav_link_active(@feed == "my_articles"), to: "?feed=my_articles"%>

        </li>
        <li class="nav-item">

          <%= live_patch "Favorited Articles", class: nav_link_active(@feed == "favorited_articles"), to: "?feed=favorited_articles"%>

        </li>
      </ul>
    </div>
    """
  end
end
