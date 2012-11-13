# Blossome

Blossome is a hacker blog. As opposed to other blog engines, this was is
intended to be modified/hacked.

It's built on:
Sinatra + haml + sass with posts written in Markdown with some help from
Mustache.


## Getting Started

1. Clone the whole repository
    - git clone https://github.com/danpal/blossome
2. Install all dependencies
    - cd blossome
    - bundle install 
3. Start the server
    - shotgun config.ru
4. Open chrome
    - go to: 127.0.0.1:9393

## Writing posts

Post go in the /posts folder. They are written with markdown, here's the
rules:

1. The name of the file is the route. So foo-bar.md is accessible at
   /foo-bar

2. Filenames have to end with .md

3. At the top include a description in between "-----" Eg:

    -----------------------
    title: "Title of the post"
    description: "this goes on the SEO description"
    keywords: "some, SEO, keywords"
    date: October 31, 2012
    -----------------------

4. Date format is Month day, year. Full name on months.



