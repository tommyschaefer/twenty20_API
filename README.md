# Twenty20
Api client for interacting with Twenty20's internal API.  Still in development

Example uses
  - query featured items
  - query items you have 'loved'
  - query challenges

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'twenty20'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install twenty20

## Usage

API client for interacting with Twenty20s internal API.

Instantiate a new client

```ruby
  client = Client.new
```
Get Featured items
  
```ruby
  client.get_featured_items()
```
```ruby
  [#<Item:0x007feff9212348 @caption="Red Canoes on Lake Louise", @id=45414069, @source_name="upload", @image_url="https://res.cloudinary.com/twenty20/image/upload/t_standard-fit/photos/cf34293d-1eeb-47a7-94c7-99397dce4c15.jpg", @featured_at="2014-11-29T22:40:04Z", @user_first_name=nil, @user_last_name=nil, @user_avatar_url=nil, @username=nil, @display_name=nil>, #<Item:0x007feff9212190 @caption=nil, @id=49291337, @source_name="instagram", @image_url="http://scontent-b.cdninstagram.com/hphotos-xpa1/t51.2885-15/1742594_280292302171814_502487005_n.jpg", @featured_at="2014-11-29T22:20:02Z"...]
```



## Contributing

1. Fork it ( https://github.com/AlexWheeler/twenty20/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
