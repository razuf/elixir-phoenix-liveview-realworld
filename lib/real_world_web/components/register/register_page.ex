defmodule RealWorldWeb.RegisterPage do
  use RealWorldWeb, :live_component

  alias RealWorldWeb.FormErrorList
  alias RealWorldWeb.RegisterForm

  @impl true
  def render(assigns) do
    ~L"""
    <div class="auth-page">
      <div class="container page">
        <div class="row">

          <div class="col-md-6 offset-md-3 col-xs-12">
            <h1 class="text-xs-center">Sign up</h1>
            <p class="text-xs-center">

              <%= live_patch "Have an account?", class: "nav-link", to: Routes.main_path(@socket, :login) %>

            </p>

              <%= live_component @socket, FormErrorList,  changeset: @changeset %>

              <%= live_component @socket, RegisterForm,  changeset: @changeset,  change: @change,  submit: @submit %>

          </div>
        </div>
      </div>
    </div>
    """
  end
end
