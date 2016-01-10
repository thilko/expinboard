defmodule Pinboard do

  def all(auth_token, options \\ []) do
    HTTPotion.start
    http_response = HTTPotion.get "https://api.pinboard.in/v1/posts/all?results=#{options[:limit]}&auth_token=#{auth_token}&format=json",[timeout: 10_000]
    Enum.map(elem(JSX.decode(http_response.body),1), fn(value) -> value["href"] end)
  end

  def broken(auth_token, options \\ []) do
    url_chunks = Enum.chunk(all(auth_token, options), 20)
    tasks = Enum.map(url_chunks, &Pinboard.Internal.check_urls/1)
    status = List.flatten(Enum.map(tasks, &Pinboard.Internal.result/1))
    IO.inspect status
    not_ok = Enum.filter(status, &Pinboard.Internal.not_ok/1)
  end

  defmodule Internal do
    def check_urls(urls) do
        HTTPotion.start
        check = fn(url) ->
          try do
            IO.puts "check url= #{url}"
            {url, HTTPotion.get(url, [timeout: 60_000]).status_code}
          rescue
            error -> {url, error.message}
          end
        end

        Task.async(fn -> Enum.map(urls, check) end)
    end

    def result(task) do
      Task.await(task, 120_000)
    end

    def not_ok({url, status}) do
      status >= 300 && status < 200
    end
  end
end
