defmodule RealWorld.Api do
  @moduledoc """
    The backend Api connection.
  """
  use Tesla

  alias RealWorld.Datastore

  def client(session_id) do
    token = Datastore.get_token_by_session_id(session_id)

    conduit_backend_api_url =
      System.get_env(
        "CONDUIT_BACKEND_API_URL",
        Application.fetch_env!(:real_world, :conduit_backend_api_url)
      )

    middleware =
      if token do
        [
          {Tesla.Middleware.BaseUrl, conduit_backend_api_url},
          Tesla.Middleware.JSON,
          {Tesla.Middleware.Headers, [{"authorization", "Token " <> token}]}
        ]
      else
        [
          {Tesla.Middleware.BaseUrl, conduit_backend_api_url},
          Tesla.Middleware.JSON
        ]
      end

    Tesla.client(middleware)
  end

  def server_get(url, session_id \\ "") do
    url = url |> URI.encode()

    case Tesla.get(client(session_id), url, headers: [{"content-type", "application/json"}]) do
      {:ok, result} ->
        result.body

      error ->
        IO.inspect(binding(), label: "### api error - GET")
    end
  end

  def server_post(url, request_body, session_id \\ "") do
    url = url |> URI.encode()

    case Tesla.post(client(session_id), url, request_body) do
      {:ok, result} ->
        result.body

      error ->
        IO.inspect(binding(), label: "### api error - POST")
    end
  end

  def server_delete(url, session_id \\ "") do
    url = url |> URI.encode()

    case Tesla.delete(client(session_id), url) do
      {:ok, result} ->
        result.body

      error ->
        IO.inspect(binding(), label: "### api error - DELETE")
    end
  end

  def server_put(url, request_body, session_id \\ "") do
    url = url |> URI.encode()

    case Tesla.put(client(session_id), url, request_body) do
      {:ok, result} ->
        result.body

      error ->
        IO.inspect(binding(), label: "### api error - PUT")
    end
  end
end
