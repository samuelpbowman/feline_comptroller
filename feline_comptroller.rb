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

r_all = session.subreddit('all')
r_all.hot.each do |submission|
  if submission.domain == "imgur.com"
    album = wrapper.gallery_album(submission.url[18..-1])
    if album["success"]
      # TODO things
    end
  end
end

def generate_message(link)
  # TODO things
end
