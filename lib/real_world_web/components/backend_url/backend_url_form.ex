defmodule RealWorldWeb.BackendUrlForm do
  use RealWorldWeb, :live_component

  @impl true
  def render(assigns) do
    ~L"""
      <%= f = form_for @changeset, "#",
      phx_submit: @submit
      %>
        <fieldset class="form-group">
          <%= text_input f, :url,
            placeholder: "e.g. http://localhost:9000",
            autocomplete: "off",
            class: "form-control form-control-lg" %>
        </fieldset>
        <%= submit "Activate Backend Url", class: "btn btn-lg btn-primary pull-xs-right" %>
      </form>
    """
  end
end
