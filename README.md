# Blossome
Blossome is a hacker blog. As opposed to other blog engines, this was is
intended to be modified/hacked.

It's built on:
- [Sinatra][1]
- [HAML][2]
- [SASS][3]
- Written in [Markdown][4]
    - With help from [Mustache][5]

[1]: http://www.sinatrarb.com/
[2]: http://haml.info/
[3]: http://sass-lang.com/
[4]: http://daringfireball.net/projects/markdown/
[5]: https://mustache.github.io/

## Getting Started
1. Clone the whole repository
    ```shell
    $ git clone https://github.com/danpal/blossome
    ```
    
2. Install all dependencies
    ```shell
    $ cd blossome
    $ bundle install
    ```
    
3. Start the server
    ```shell
    $ shotgun config.ru
    ```
4. Open your favorite web browser and go to <http://127.0.0.1:9393>

## Writing posts
Post go in the `/posts` folder. They are written with Markdown, here's the
rules:

1. The name of the file is the route. So `foo-bar.md` is accessible at
   `/foo-bar`

2. Filenames have to end with `.md`

3. At the top include a description in between `-----` Eg:
    ```yaml
    -----------------------
    title: "Title of the post"
    description: "this goes on the SEO description"
    keywords: "some, SEO, keywords"
    date: October 31, 2012
    -----------------------
    ```
4. Date format is Month day, year. Full name on months.
