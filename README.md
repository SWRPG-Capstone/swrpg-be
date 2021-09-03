<!-- ABOUT THE PROJECT -->
![swrpgc banner](https://user-images.githubusercontent.com/17935770/131261369-477cff64-39e5-462a-81bf-3f55944e512e.png)

This application acts as a companion for the tabletop rpg game: **Star Wars: Edge of the Empire**. The companion app allows you to keep track of and store your in-game characters. You may also connect and communicate with your friends and party up so that everyone can witness the dice rolls that will unfold the story in their legendary campaign.

This is the backend repository that is responsible for sending API responses to our [frontend application](https://github.com/SWRPG-Capstone/swrpg-fe).


![feaures](https://user-images.githubusercontent.com/17935770/131262008-e0fb73fa-3967-41bb-852d-6fd1f71b45a7.png)

 - User may create a new character that contains their information, characteristics, features
 - Dice rolls can be be configured with actual dice animation
 - All of your characters can be seen in one place

![preview](https://user-images.githubusercontent.com/17935770/131262055-e0e0afc1-09f9-4730-9f02-8cd4d7a2be09.png)

![Screenshots of the wireframe](https://user-images.githubusercontent.com/17935770/131262115-72dfe9c0-5bae-4c05-b65c-319b952bda52.png)


## About This Project
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
    <li><a href="#graphql-endpoints">GraphQL Endpoints</a></li>
    <li><a href="#Running-the-tests">Running the Tests</a></li>
  </ol>
</details>


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

2. getUser(id: ID) - finds specific user in database by id.
![image](https://user-images.githubusercontent.com/74436194/131850866-7635834f-0294-4b2f-a435-1a91b45bbfaf.png)

### Mutations 
1. createCharacter(CreateCharacterInput) - creates new character in database.
<img width="1389" alt="Screen Shot 2021-09-01 at 10 59 55 AM" src="https://user-images.githubusercontent.com/70981102/131714475-c2f81b53-3329-433c-947e-cc6640fa095d.png">

2. createCharacteristic(CreateCharacteristicInput) - creates new characteristic in database.
![image](https://user-images.githubusercontent.com/74436194/131943128-298c2837-0ca1-4859-86e2-de73dc832105.png)

3. createSkill(characterId: ID)
```  
mutation {
          skill: createSkill(
            input: {
              characterId: #{@character.id}
              astrogation: 1
              athletics: 2
              brawl: 3
              charm: 4
              coercion: 5
              computers: 1
              cool: 2
              coordination: 3
              coreWorlds: 4
              deception: 5
              discipline: 1
              education: 2
              gunnery: 3
              leadership: 4
              lore: 5
              mechanics: 1
              medicine: 2
              melee: 3
              negotiation: 4
              outerRim: 5
              perception: 1
              piloting: 2
              pilotingSpace: 3
              rangedHeavy: 4
              rangedLight: 5
              resilience: 1
              skulduggery: 2
              stealth: 3
              streetWise: 4
              survival: 5
              underworld: 1
              vigilance: 2
              xenology: 3
            }
          ) {
            astrogation
            athletics
            brawl
            charm
            coercion
            computers
            cool
            coordination
            coreWorlds
            deception
            discipline
            education
            gunnery
            id
            leadership
            lore
            mechanics
            medicine
            melee
            negotiation
            outerRim
            perception
            piloting
            pilotingSpace
            rangedHeavy
            rangedLight
            resilience
            skulduggery
            stealth
            streetWise
            survival
            underworld
            vigilance
            xenology
          }
        }
 ```
 
 ### RESPONSE

3. updateSkill(UpdateSkillInput) - updates any/all of the skills for a specified character.
> Pasting code instead of screenshot due to the code not all fitting in one shot

#### REQUEST
```ruby
  mutation {
    updateSkill(input: {
      astrogation: 5,
      athletics: 5,
      brawl: 5,
      characterId: 1,
      charm: 5,
      coercion: 5,
      computers: 5,
      cool: 5,
      coordination: 5,
      coreWorlds: 5,
      deception: 5,
      discipline: 5,
      education: 5,
      gunnery: 5,
      id: 1,
      leadership: 5,
      lore: 5,
      mechanics: 5,
      medicine: 5,
      melee: 5,
      negotiation: 5,
      outerRim: 5,
      perception: 5,
      piloting: 5,
      pilotingSpace: 5,
      rangedHeavy: 5,
      rangedLight: 5,
      resilience: 5,
      skulduggery: 5,
      stealth: 5,
      streetWise: 5,
      survival: 5,
      underworld: 5,
      vigilance: 5,
      xenology: 5
    }) {
      astrogation
      athletics
      brawl
      characterId
      charm
      coercion
      computers
      cool
      coordination
      coreWorlds
      deception
      discipline
      education
      gunnery
      id
      leadership
      lore
      mechanics
      medicine
      melee
      negotiation
      outerRim
      perception
      piloting
      pilotingSpace
      rangedHeavy
      rangedLight
      resilience
      skulduggery
      stealth
      streetWise
      survival
      underworld
      vigilance
      xenology
    }
  }
```

#### RESPONSE
```ruby
 {
   "data": {
     "updateSkill": {
        "astrogation": 5,
        "athletics": 5,
        "brawl": 5,
        "characterId": 1,
        "charm": 5,
        "coercion": 5,
        "computers": 5,
        "cool": 5,
        "coordination": 5,
        "coreWorlds": 5,
        "deception": 5,
        "discipline": 5,
        "education": 5,
        "gunnery": 5,
        "id": "1",
        "leadership": 5,
        "lore": 5,
        "mechanics": 5,
        "medicine": 5,
        "melee": 5,
        "negotiation": 5,
        "outerRim": 5,
        "perception": 5,
        "piloting": 5,
        "pilotingSpace": 5,
        "rangedHeavy": 5,
        "rangedLight": 5,
        "resilience": 5,
        "skulduggery": 5,
        "stealth": 5,
        "streetWise": 5,
        "survival": 5,
        "underworld": 5,
        "vigilance": 5,
        "xenology": 5
      }
    }
  }
```

## Running the tests
