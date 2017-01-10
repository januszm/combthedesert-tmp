[![Code Climate](https://codeclimate.com/github/januszm/combthedesert-tmp/badges/gpa.svg)](https://codeclimate.com/github/januszm/combthedesert-tmp)

# README

CombTheDesert!, a tiny RESTful API to index a page's content. It parses the page content and stores what's found inside the tags h1, h2 and h3 and the links.

## Set-up

Rails 5+, Ruby 2.3+ application, JSON API, SQlite for simple storage.

## Endpoints

### Receive a url and index the content
    POST /pages/scrape_url
Parameters

Name|Required?|Type|Format|Example
----|---------|----|------|-------
url|yes|string|http(s)|http://yahoo.com


### List previously stored urls
    GET  /pages

### List previously stored url
    GET  /pages/:id

  Example requests

  ```shell
  curl -X POST --data "url=https://yahoo.com" 'http://localhost:3000/pages/scrape_url'
  curl 'http://localhost:3000/pages/'
  ```

* Services

 * Parse page service (PORO Service Object) / job (ActiveJob)
