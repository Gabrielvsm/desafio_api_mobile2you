# Desafio API - Mobile2you
This app is a resolution of a challenge proposed by the company Mobile2you. In the challenge we were asked to create an Rails API in wich would possible to upload an csv file containing some Netflix shows and movies and list them with some filters on another endpoint.

## Endpoints available
| Method | Endpoint | Description |
|------|---------|----------------|
| POST | /titles | _csv\_file_ key with the file as a value on the request body to upload it to the server |
| GET  | /titles | Lists all the titles and has the possibility to add filters

### Passing filters
You can pass some filters to list the titles according to your needs. The permited filters are:
- **release_year**
- **type**
- **country**

The **type** and **country** params should be passed with snake case style. _i.e_ 'TV_Show', 'United_States'.
Diferent filters can be applied together as well. _i.e_ '?release_year=2020&country=United_States'
