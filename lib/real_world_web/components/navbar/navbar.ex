defmodule RealWorldWeb.Navbar do
  use RealWorldWeb, :live_component

  @impl true
  def render(assigns) do
    ~L"""
     <nav class="navbar navbar-light">
       <div class="container">
         <%= live_patch "conduit", class: "navbar-brand", to: Routes.main_path(@socket, :home) %>

        <ul class="nav navbar-nav pull-xs-right">
          <li class="nav-item <%= if (:home == @live_action), do: "active" %>" >
            <%= live_patch "Home", class: "nav-link", to: Routes.main_path(@socket, :home) %>
          </li>

          <%= if user_signed_in?(@current_user) do %>
            <li class="nav-item <%= if (:editor == @live_action), do: "active" %>" >
              <%= live_patch class: "nav-link", to: Routes.main_path(@socket, :editor) do %>
                <i class="ion-compose"></i>&nbsp;New Post
              <% end %>
            </li>
            <li class="nav-item <%= if (:settings == @live_action), do: "active" %>" >
              <%= live_patch class: "nav-link", to: Routes.main_path(@socket, :settings) do %>
                <i class="ion-gear-a"></i>&nbsp;Settings
              <% end %>
            </li>
            <li class="nav-item <%= if (:profile == @live_action), do: "active" %>" >
              <%= live_patch class: "nav-link", to: Routes.main_path(@socket, :profile, @current_user.username) do %>
                <img class="user-pic" src= <%= get_user_image(@current_user.image) %>  loading="lazy">
                <%= @current_user.username %>
              <% end %>
            </li>
            <li class="nav-item" >
              <%= live_patch class: "nav-link", to: Routes.main_path(@socket, :logout) do %>
                Sign out
              <% end %>
            </li>
          <% end %>

          <%= unless user_signed_in?(@current_user) do %>
            <li class="nav-item <%= if (:login == @live_action), do: "active" %>" >
              <%= live_patch class: "nav-link", to: Routes.main_path(@socket, :login) do %>
                Sign in
              <% end %>
            </li>
            <li class="nav-item <%= if (:register == @live_action), do: "active" %>" >
              <%= live_patch class: "nav-link", to: Routes.main_path(@socket, :register) do %>
                Sign up
              <% end %>
            </li>
          <% end %>

        </ul>
    </div>
    </nav>
    """
  end
end
