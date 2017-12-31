require 'net/http'
require 'uri'
require 'json'

class ImgurWrapper

  def initialize(client_id)
    @http = Net::HTTP.new("", 0)
    @http.use_ssl = true
    @client_id = client_id
  end

  def refresher(refresh_token, client_secret)
    url = URI("https://api.imgur.com/oauth2/token")

    @http = Net::HTTP.new(url.host, url.port)
    # http.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request.body = "?refresh_token=#{refresh_token}&client_id=#{@client_id}&client_secret=#{client_secret}&grant_type=refresh_token"

    response = http.request(request)
    return JSON.parse(response.read_body)
  end

  def album_images(album_hash)
    url = URI("https://api.imgur.com/3/album/#{album_hash}/images")

    @http = Net::HTTP.new(url.host, url.port)
    # http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Authorization"] = "Client-ID #{@client_id}"

    response = http.request(request)
    return JSON.parse(response.read_body)
  end

  def gallery_album(gallery_hash)
    url = URI("https://api.imgur.com/3/gallery/album/#{gallery_hash}")

    @http = Net::HTTP.new(url.host, url.port)
    # http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Authorization"] = "Client-ID #{@client_id}"

    response = http.request(request)
    return JSON.parse(response.read_body)
  end

end
