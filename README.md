# Rock Paper Scissors 

This is the implementation of the game `Rock Paper Scissors` written in Ruby on Rails.

## I. Getting started

1. In order to play with this Rock Paper Scissors game, you can clone this repository.
2. Once you have the application locally, check out the `implement_rps` branch by running `git checkout implement_rps`.
3. Run `bundle install`.
4. Start your rails server by running `rails server`.
5. From your API platform of choice send a request to `localhost:3000/api/v1/play` with (or without) query params.

## II. Endpoints

Currently the application doesn't have a UI.\
You can call the `localhost:3000/api/v1/play?user_choice=<YOUR_CHOICE>` endpoint, with your desired weapon, and see who wins the game.\
Try calling this endpoint with an empty user_choice, or any other weapon than rock, paper or scissors.

## III. Further steps

Write a simple frontend app in React.\
Add another endpoint which sends the list of supported weapons to the frontend app.
