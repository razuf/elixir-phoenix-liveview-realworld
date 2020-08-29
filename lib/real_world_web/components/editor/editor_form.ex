defmodule RealWorldWeb.EditorForm do
  use RealWorldWeb, :live_component

  def render(assigns) do
    ~L"""
    <%= f = form_for @changeset, "#",
    phx_submit: @submit %>
      <fieldset class="form-group">
        <%= text_input f, :title,
          placeholder: "Article Title",
          autocomplete: "off",
          class: "form-control form-control-lg" %>
      </fieldset>
      <fieldset class="form-group">
        <%= text_input f, :description,
          placeholder: "What's this article about?",
          autocomplete: "off",
          class: "form-control form-control-lg" %>
      </fieldset>
      <fieldset class="form-group">
        <%= textarea f, :body,
          placeholder: "Write your article (in markdown)",
          rows: "8",
          autocomplete: "off",
          class: "form-control form-control-lg" %>
      </fieldset>
      <fieldset class="form-group">
        <%= text_input f, :tag_list_string,
          placeholder: "Enter tags",
          autocomplete: "off",
          class: "form-control form-control-lg" %>
      </fieldset>
      <%= submit "Publish Article", class: "btn btn-lg btn-primary pull-xs-right", phx_disable_with: "Publish Article..." %>
    </form>
    """
  end
end
