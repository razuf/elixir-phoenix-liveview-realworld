defmodule RealWorldWeb.RegisterForm do
  use RealWorldWeb, :live_component

  @impl true
  def render(assigns) do
    ~L"""
      <%= f = form_for @changeset, "#",
        phx_change: @change,
        phx_submit: @submit %>
        <fieldset class="form-group">
          <%= text_input f, :username,
            placeholder: "Your Name",
            autocomplete: "off",
            phx_debounce: "2000",
            class: "form-control form-control-lg" %>
        </fieldset>
        <fieldset class="form-group">
        <%= text_input f, :email,
          placeholder: "Email",
          autocomplete: "off",
          phx_debounce: "2000",
          class: "form-control form-control-lg" %>
        </fieldset>
        <fieldset class="form-group">
          <%= password_input f, :password,
            placeholder: "Password",
            autocomplete: "off",
            phx_debounce: "blur",
            class: "form-control form-control-lg" %>
        </fieldset>
        <%= submit "Sign up", class: "btn btn-lg btn-primary pull-xs-right", phx_disable_with: "Sign up..." %>
      </form>
    """
  end
end
