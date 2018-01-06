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

wrapper = ImgurWrapper.new(client_id)
tax_paid = false

r_all = session.subreddit('testingground4bots')
r_all.hot.each do |submission|
  if submission.domain == "imgur.com"
    album = wrapper.gallery_album(submission.url[26..-1])
    if album["success"]
      images = album["data"]["images"]
      images.each do |image|
        if image["description"].include? "tax"
          unless submission.get_flair == "Serious"
            tax_paid = true
          end
        end
      end
    end
    if !tax_paid
      unless have_commented(submission)
        submission.reply(generate_message(""))
      end
    end
  end
end

def generate_message(link)
  # TODO things
end
