# Star Wars RPG 

<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-this-project">About This Project</a>
      <ul>
        <li><a href="#versions">Versions</a></li>
      </ul>
      <ul>
        <li><a href="#important-gems">Important Gems</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
    </li>
    <li><a href="#endpoints">Endpoints</a></li>
    <li><a href="#Running-the-tests">Running the Tests</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About This Project
PLAYERS OF TABLETOP STAR WARS RPG, REJOICE! ---NAME TO BE UPDATED --- is an accompanying app that helps keep track of your character stats and calculates your dice rolls all in one place!

This is the backend repository for Star Wars RPG. It is responsible for sending API responses to our [frontend application](https://github.com/SWRPG-Capstone/swrpg-fe).

#### Versions

- Ruby 2.7.2

- Rails 5.2.6

#### Important Gems
Testing
* factory-bot_rails
* faker
* pry
* shoulda-matchers
* simplecov
 
GRAPHQL API 
* graphql
* graphiql-rails
* rack-cors

## Getting Started

These instructions will give you a copy of the project up and running on
your local machine for development and testing purposes.

### Local Setup

1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:create`
4. Run migrations: ` rails db:migrate`

## GraphQL Endpoints

Our GraphQL endpoints fall into three categories: queries, mutations, and filter queries.

To make live queries to the GraphQL endpoint and see live schema information, setup the back-end by running `rails s` in the terminal and access GraphiQL at http://localhost:3001/graphiql. Use the screenshots as reference when formatting your queries and compare against the expected response. 

### Queries 
 1. getCharacter(id: ID) - finds specific character in database by id. 
<img width="1118" alt="Screen Shot 2021-09-01 at 11 17 26 AM" src="https://user-images.githubusercontent.com/70981102/131714120-1238e989-4454-4a71-9df2-b899e64342c2.png">

### Mutations 
1. createCharacter(CreateCharacterInput) - creates new character in database
<img width="1389" alt="Screen Shot 2021-09-01 at 10 59 55 AM" src="https://user-images.githubusercontent.com/70981102/131714475-c2f81b53-3329-433c-947e-cc6640fa095d.png">


## Running the tests
