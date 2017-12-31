require 'redd'
require_relative 'imgur_wrapper/imgur_wrapper'
require 'nokogiri'

doc = Nokogiri::XML(File.open("feline_comptroller.xml"))
# puts doc.css("reddit client_id").text

session = Redd.it(
  user_agent: 'FelineComptroller:v1.0.0 (by /u/chang3up)',
  client_id:  doc.css("reddit client_id").text,
  secret:     doc.css("reddit client_secret").text,
  username:   doc.css("reddit username").text,
  password:   doc.css("reddit password").text
)

client_id = doc.css("imgur client_id").text
client_secret = doc.css("imgur client_secret").text
refresh_token = doc.css("imgur refresh_token").text

wrapper = ImgurWrapper.new(client_id)

r_all = session.subreddit('all')
r_all.posts.each do |post|
  if post.domain == "imgur.com"
=begin
    album = wrapper.gallery_album(post.url)
    puts album.to_s
    break
=end
  end
end

def generate_message(link)
  # TODO things
end
