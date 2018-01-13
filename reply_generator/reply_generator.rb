class ReplyGenerator
  def initialize(wrapper)
    @wrapper = wrapper
  end
  def generate_message
    image = get_random_cat
    message = "It would appear as though this album may not have paid the cat tax. [Let me fix that for you](#{image})\n\n" \
    "^(I am a bot, bleep, bloop. Reply \"good bot\" if you like my service, \"bad bot\" if not.)\n" \
    "[Message my developer](https://www.reddit.com/message/compose/?to=chang3up) with any other concerns."
    return message
  end
  private
    def get_random_cat
      srand(Time.now.to_i)
      index = rand(60)
      available = @wrapper.find_cats["data"]
      unless available.at(index)["is_album"]
        return available.at(index)["link"]
      else
        return get_random_cat
      end
    end
end
