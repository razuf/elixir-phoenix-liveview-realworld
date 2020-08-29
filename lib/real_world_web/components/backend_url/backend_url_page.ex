defmodule RealWorldWeb.BackendUrlPage do
  use RealWorldWeb, :live_component

  alias RealWorldWeb.FormErrorList
  alias RealWorldWeb.BackendUrlForm

  @impl true
  def render(assigns) do
    ~L"""
    <div class="auth-page">
      <div class="container page">
        <div class="row">
          <div class="col-md-6 offset-md-3 col-xs-12">
            <h1 class="text-xs-center">Backend Api Url</h1>
            <p class="text-xs-center">
              <!-- desc-->
            </p>

              <%= live_component @socket, FormErrorList,  changeset: @changeset %>

              <%= live_component @socket, BackendUrlForm,  changeset: @changeset,  submit: @submit %>

          </div>
        </div>
      </div>
    </div>
    """
  end
end
