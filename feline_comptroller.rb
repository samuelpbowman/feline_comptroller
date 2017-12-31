require 'redd'
require 'nokogiri'
require_relative 'imgur_wrapper/imgur_wrapper'

doc = Nokogiri::XML(File.open("feline_comptroller.xml"))

session = Redd.it(
  user_agent: 'FelineComptroller:v1.0.0 (by /u/chang3up)',
  client_id:  doc.css("api_data reddit client_id").text,
  secret:     doc.css("api_data reddit client_secret").text,
  username:   doc.css("api_data reddit username").text,
  password:   doc.css("api_data reddit password").text
)

client_id = doc.css("api_data imgur client_id").text
client_secret = doc.css("api_data imgur client_secret").text
refresh_token = doc.css("api_data imgur refresh_token").text

wrapper = ImgurWrapper.new(client_id)
tax_paid = false

r_all = session.subreddit('testingground4bots')
r_all.post_stream.each do |post|
  puts "logging post #{post.title}"
  if post.domain == "imgur.com"
    puts post.url[26..-1]
    album = wrapper.gallery_album(post.url[26..-1])
    puts album
    if album["success"]
      images = album["data"]["images"]
      images.each do |image|
        if image.description.include? "tax"
          tax_paid = true
        end
      end
    end
    if !tax_paid
      # TODO things
    end
  end
end

def generate_message(link)
  # TODO things
end
