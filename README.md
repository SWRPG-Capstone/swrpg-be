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

![tect stack](https://user-images.githubusercontent.com/17935770/131262694-59d17a22-b9e8-4396-b130-cd33d7754e0f.png)
<div align="center"> 
 <img src="https://img.shields.io/badge/RAILS-CC0000?logo=rubyonrails&logoColor=fff&style=flat-square" alt="Rails Badge"> 
 <img src="https://img.shields.io/badge/CircleCI-343434?logo=circlecis&logoColor=fff&style=flat-square" alt="CircleCI Badge"> 
 <img src="https://img.shields.io/badge/GraphQL-E434AA?logo=graphql&logoColor=fff&style=flat-square" alt="GraphQL Badge"> 
 <img src="https://img.shields.io/badge/Heroku-430098?logo=heroku&logoColor=fff&style=flat-square" alt="Heroku Badge"> 
</div>

![about this project](https://user-images.githubusercontent.com/70981102/132727474-9f29d1bf-cd12-49f3-9acd-46511e177385.png)
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

![getting started](https://user-images.githubusercontent.com/70981102/132727222-23150ec8-743d-406a-a7c6-cd1a46ffb3e8.png)

These instructions will give you a copy of the project up and running on
your local machine for development and testing purposes.

### Local Setup

1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:create`
4. Run migrations: ` rails db:migrate`

![Endpoints](https://user-images.githubusercontent.com/70981102/132727354-cac13ab2-0d13-4c51-a5fb-9145826c1db1.png)

Our GraphQL endpoints fall into three categories: queries, mutations, and filter queries.

To make live queries to the GraphQL endpoint and see live schema information, setup the back-end by running `rails s` in the terminal and access GraphiQL at http://localhost:3001/graphiql. Use the screenshots as reference when formatting your queries and compare against the expected response. 

<details open="open">
  <summary>Enpoints</summary>
  <ol>
    <li>
      <a href="#queries">Queries</a>
      <ul>
       <li><a href="#getcharacter">getCharacter</a></li>
        <li><a href="#getuser">getUser</a></li>
        <li><a href="#getskills">getSkills</a></li>
        <li><a href="#getusercharacters">getUserCharacters</a></li>
      </ul>
    </li>
    <li>
      <a href="#mutations">Mutations</a>
      <ul>
        <li><a href="#createcharacter">createCharacter</a></li>
        <li><a href="#createcharacteristic">createCharasteristic</a></li>
        <li><a href="#createskill">createSkill</a></li>
        <li><a href="#updateskill">updateSkill</a></li>
      </ul>
   </li>
  </ol>
</details>

### Queries 
#### getCharacter 
     finds specific character in database by id. 
#### REQUEST
```graphql 
 query{
  character(characterId: 1) {
    age 
    build
    career
    eyes
    hair
    height
    id
    name
    specialization
    species
  }
```
#### RESPONSE 

```graphql
{
  "data": {
    "character": {
      "age": 15,
      "build": "Ezra Legros",
      "career": "Shonna Gleichner",
      "eyes": "Roxann Murray",
      "hair": "Rudolf Goyette II",
      "height": "Jaleesa Mann",
      "id": "1",
      "name": "Gov. Sook Kuhlman",
      "specialization": "Ellsworth Powlowski",
      "species": ""Larhonda Dietrich" 
    }
``` 

#### getUser
finds specific user in database by id.
     
### REQUEST
```graphql 
 query{
  user(id: 1) {
    username
  }
```
### RESPONSE
```graphql
{
  "data": {
    "user": {
        "username": "Boops McGoops"
    }
  }
}
```

#### getSkills
finds skills specific to character 

### REQUEST

```graphql 
query{
  skill(characterId: 1) {
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

```graphql
{
  "data": {
    "skill": {
      "astrogation": 3,
      "athletics": 3,
      "brawl": 4,
      "charm": 4,
      "coercion": 3,
      "computers": 4,
      "cool": 2,
      "coordination": 5,
      "coreWorlds": 2,
      "deception": 5,
      "discipline": 2,
      "education": 2,
      "gunnery": 3,
      "id": "1",
      "leadership": 4,
      "lore": 4,
      "mechanics": 5,
      "medicine": 2,
      "melee": 5,
      "negotiation": 2,
      "outerRim": 1,
      "perception": 3,
      "piloting": 1,
      "pilotingSpace": 5,
      "rangedHeavy": 2,
      "rangedLight": 5,
      "resilience": 5,
      "skulduggery": 3,
      "stealth": 4,
      "streetWise": 2,
      "survival": 1,
      "underworld": 1,
      "vigilance": 5,
      "xenology": 3
    }
  }
}
```
#### getUserCharacters 
finds all of the characters for a user by user id.

### Request

```graphql

{
  user(id: 1) {
    username
    characters {
      age
      build
      career
      eyes
      hair
      height
      id
      name
      specialization
      species
    }
  }
}
```
### Response
```graphql

{
  "data": {
    "user": {
      "username": "Prof. Rosalyn Rodriguez",
      "characters": [
        {
          "age": 80,
          "build": "Cruz Renner",
          "career": "Libby Gorczany DO",
          "eyes": "Milford Daniel DC",
          "hair": "Belkis Quitzon DC",
          "height": "Lynda Abbott",
          "id": "1",
          "name": "Jack Cummings",
          "specialization": "Sara Hudson",
          "species": "Rev. Manual Hackett"
        },
        {
          "age": 83,
          "build": "Mimi Toy",
          "career": "Dennis Prohaska II",
          "eyes": "Marcelle Lubowitz III",
          "hair": "Collette Bartell LLD",
          "height": "Roxann Kilback",
          "id": "2",
          "name": "Meda Miller",
          "specialization": "Dr. Jasmin Bailey",
          "species": "Guadalupe Fritsch"
        },
        {
          "age": 17,
          "build": "Shiela Nader",
          "career": "Alexis Legros",
          "eyes": "Katelynn Braun DC",
          "hair": "Andrea Stiedemann",
          "height": "Jaunita Effertz",
          "id": "3",
          "name": "Randy Russel",
          "specialization": "Renato Heaney",
          "species": "Ray Larkin"
        },
        {
          "age": 80,
          "build": "Robin Ritchie",
          "career": "Trinidad West",
          "eyes": "Debera McLaughlin",
          "hair": "Corey Wolff",
          "height": "Isreal Kunze",
          "id": "4",
          "name": "Hector Thiel",
          "specialization": "Jalisa Gutmann DVM",
          "species": "Monty Corkery"
        },
        {
          "age": 87,
          "build": "Carlos Quigley",
          "career": "Msgr. Leota Nitzsche",
          "eyes": "Everett Ernser",
          "hair": "Ayesha O'Reilly",
          "height": "Rosetta Armstrong",
          "id": "5",
          "name": "Marianne Gislason JD",
          "specialization": "Clarence Upton IV",
          "species": "Kera Funk"
        }
      ]
    }
  }
}
```

### Mutations 
#### createCharacter
creates new character in database.

### RESPONSE
```graphql  

mutation { 
    createCharacter(
       input:{
        userID: "1"
        name: "Boops McGoops"
        age: 47 
        build: "small but mighty"
        career: "bounty hunter"
        eyes: "yellow"
        hair: "magenta"
        height: "4ft 3in"
        species: "cool alien"
        specialization: "assasin"
       }) {							  
        age 
        build
        career
        eyes 
        hair
        height
        id
        name
        specialization
        species
   }
}

 ```

 ### RESPONSE
```graphql
{
  "data": {
    "character": {
        "age": 47, 
        "build": "small but mighty",
        "career": "bounty hunter"
        "eyes": "yellow" 
        "hair": "magenta"
        "height": "4ft 3in"
        "id": "6"
        "name": "Boops McGoops"
        "specialization": "assassin"
        "species": "cool alien"
    }
  }
}
```
#### createCharacteristic
creates new characteristics for a given character in database.

### REQUEST
```graphql  

mutation { 
    createCharacteristic(
       input:{
         agility: 2
         brawn: 2
         characterId: 2
         charPresence: 2
         cunning: 2
         intellect: 2
         willpower: 3
       }) {							  
         agility
         brawn
         characterId 
         charPresence 
         cunning
         id
         intellect
         willpower
   }
}
 
 ```
 ### RESPONSE 
 
 ```graphql
{
  "data": {
    "characteristic": {
        "agility": 2
        "brawn": 2
        "characterId": 2
        "charPresence": 2
        "cunning": 2
        "id": "6"
        "intellect": 2
        "willpower": 3
    }
  }
}
```

#### createSkill
creates new skillset for given character in datasbase.

### REQUEST
```graphql  

mutation { 
      skill: createSkill(
       input:{
        characterId: 1
        astrogation: 1
        athletics: 1
        brawl: 1
        charm: 1
        coercion: 1
        computers: 1
        cool: 1
        coordination: 1
        coreWorlds: 1
        deception: 1
        discipline: 1
        education: 1
        gunnery: 1
        leadership: 1
        lore: 1
        mechanics: 1
        medicine: 1
        melee: 4
        negotiation: 1
        outerRim: 1
        perception: 1
        piloting: 1
        pilotingSpace: 1
        rangedHeavy: 2
        rangedLight: 3
        resilience: 4
        skulduggery: 5
        stealth: 2
        streetWise: 2
        survival: 1
        underworld: 1
        vigilance: 1
        xenology: 1
       }) {							  
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
```graphql
{
  "data": {
    "skill": {
      "astrogation": 1,
      "athletics": 1,
      "brawl": 1,
      "charm": 1,
      "coercion": 1,
      "computers": 1,
      "cool": 1,
      "coordination": 1,
      "coreWorlds": 1,
      "deception": 1,
      "discipline": 1,
      "education": 1,
      "gunnery": 1,
      "id": "9",
      "leadership": 1,
      "lore": 1,
      "mechanics": 1,
      "medicine": 1,
      "melee": 4,
      "negotiation": 1,
      "outerRim": 1,
      "perception": 1,
      "piloting": 1,
      "pilotingSpace": 1,
      "rangedHeavy": 2,
      "rangedLight": 3,
      "resilience": 4,
      "skulduggery": 5,
      "stealth": 2,
      "streetWise": 2,
      "survival": 1,
      "underworld": 1,
      "vigilance": 1,
      "xenology": 1
    }
  }
}
```

#### updateSkill
updates any/all of the skills for a specified character.

#### REQUEST
```graphql
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
```graphql
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
