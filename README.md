# elixir-training-ex2

This is the second exercise of our Elixir Training series. To goal of this
exercise is understanding the way channels work and how to manage basic state
using processes.

## The exercise

It goes all about TDDing. There are two tests to uncommented, and then, the goal
is to implement whatever that is necessary. Tests are:

  * `test/models/counter_test.exs`
  * `test/channels/arena_channel_test.exs`

Order is important, because the second test needs the first test implementation
being... well... implemented.

Look at notes and comments to get clues. It's a good starting point looking at
Phoenix channels and Elixir processes documentation.

## Testing

To test the app:

  * Execute all tests with `mix test`
  * Execute only one folder/file test with `mix test file_or_folder_name`
  * Execute only one test with `mix test --only line:42 file`
  * Watch for changes and auto execute tests changing `test` by `test.watch`.

## Starting the application

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: http://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
