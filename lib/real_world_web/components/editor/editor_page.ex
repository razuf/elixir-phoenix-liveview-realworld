defmodule RealWorldWeb.EditorPage do
  use RealWorldWeb, :live_component

  alias RealWorldWeb.FormErrorList
  alias RealWorldWeb.EditorForm

  @impl true
  def render(assigns) do
    ~L"""
    <div class="editor-page">
      <div class="container page">
        <div class="row">
          <div class="col-md-10 offset-md-1 col-xs-12">

            <%= live_component @socket, FormErrorList, changeset: @changeset %>

            <%= live_component @socket, EditorForm, changeset: @changeset, submit: @submit %>

          </div>
        </div>
      </div>
    </div>
    """
  end
end
