defmodule RealWorldWeb.SettingsPage do
  use RealWorldWeb, :live_component

  alias RealWorldWeb.FormErrorList
  alias RealWorldWeb.SettingsForm

  @impl true
  def render(assigns) do
    ~L"""
    <div class="settings-page">
      <div class="container page">
        <div class="row">
          <div class="col-md-6 offset-md-3 col-xs-12">
            <h1 class="text-xs-center">Your Settings</h1>

            <%= live_component @socket, FormErrorList,  changeset: @changeset %>

            <%= live_component @socket, SettingsForm,  changeset: @changeset,  change: @change,  submit: @submit %>

          </div>
        </div>
      </div>
    </div>
    """
  end
end
