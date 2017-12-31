require 'net/http'
require 'uri'
require 'json'

class ImgurWrapper

  def initialize(client_id)
    @client_id = client_id
  end
=begin
  def album_images(album_hash)
    url = URI("https://api.imgur.com/3/album/#{album_hash}/images")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Authorization"] = "Client-ID #{@client_id}"

    response = http.request(request)
    return JSON.parse(response.read_body, :quirks_mode => true)
  end
=end
  def gallery_album(gallery_hash)
    url = URI("https://api.imgur.com/3/gallery/album/#{gallery_hash}")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Authorization"] = "Client-ID #{@client_id}"

    response = http.request(request)
    return JSON.parse(response.read_body, :quirks_mode => true)
  end

end
