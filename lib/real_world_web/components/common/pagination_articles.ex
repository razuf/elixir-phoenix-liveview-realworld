defmodule RealWorldWeb.PaginationArticles do
  use RealWorldWeb, :live_component

  def render(assigns) do
    ~L"""
    <%= if  @pages > 1  do %>
      <list-pagination><nav>
        <ul class="pagination">
          <%= for page <- 1..@pages, page > 0 do %>
            <li class="<%= active_class(page, @active_page) %>" >
              <%= live_patch class: "page-link", to: page_href(@url, page) do %>
                <%= page %>
              <% end %>
            </li>
          <% end %>
        </ul>
      </nav>
      </list-pagination>
    <% end %>
    """
  end
end
