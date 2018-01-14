# The Feline Comptroller
### A Reddit bot created to enforce Imgur's Cat Tax

The Cat Tax (or Dog Tax, or even Snake Tax) is an Imgur convention which
compels users to place a photo of their pet at the end of an album. Seeing
as there can never be enough animal pictures, Imgurians far and wide have
shared their furry friends with the world even more. Inspired by this
love of animals, I have launched this project to keep the pictures coming.

### How It Works

When run, the bot will search the subreddit it is supplied to find posts
which link to Imgur albums. From there, the bot will check the album to
ensure that the tax is paid. If there is no animal picture submitted to
satisfy the Tax, the bot will comment on the post, providing an appropriate
picture to satisfy the Tax.

### Configuring for personal use

The latest Ruby this project has been tested on is `2.4.1`. The gems
- json
- net
- url
- nokogiri
- [redd](https://github.com/avinashbot/redd)
are all required and can be installed by running `bundle install` if
you use RubyGems. All Imgur web calls are written freehand here.

Using the provided `generic_info.xml`, simply add your API keys for Reddit
and Imgur and save as "feline_comptroller.xml".

### Running the bot

Run the command, adding the name of the desired subreddit at the end

`ruby feline_comptroller.rb [subreddit]`
