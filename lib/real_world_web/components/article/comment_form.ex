defmodule RealWorldWeb.CommentForm do
  use RealWorldWeb, :live_component

  def render(assigns) do
    ~L"""
    <%= f = form_for @changeset, "#",
    phx_submit: @submit,
    class: "card comment-form"
    %>
      <div class="card-block">
        <%= textarea f, :body,
          placeholder: "Write a comment...",
          rows: "3",
          autocomplete: "off",
          class: "form-control form-control-lg" %>
      </div>
      <div class="card-footer">
        <img src=<%= get_user_image(@current_user.image) %> class="comment-author-img" loading="lazy"/>
        <%= submit "Post Comment", class: "btn btn-sm btn-primary", phx_disable_with: "Post Comment..." %>
      </div>
    </form>
    """
  end
end
