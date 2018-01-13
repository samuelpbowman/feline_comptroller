require 'net/http'
require 'uri'
require 'json'

class ImgurWrapper
  def initialize(client_id)
    @client_id = client_id
  end
  def gallery_album(gallery_hash)
    url = URI("https://api.imgur.com/3/gallery/album/#{gallery_hash}")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Authorization"] = "Client-ID #{@client_id}"
    response = http.request(request)
    return JSON.parse(response.read_body, :quirks_mode => true)
  end
  def find_cats
    url = URI("https://api.imgur.com/3/gallery/search/viral?q=cats")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Authorization"] = "Client-ID #{@client_id}"
    response = http.request(request)
    return JSON.parse(response.read_body)
  end
end
