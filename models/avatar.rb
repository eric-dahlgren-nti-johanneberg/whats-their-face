class Avatar
  attr_reader :url

  def initialize(id)
    @id = id
    @url = generate_url(id)
  end

  def generate_url(seed)
    "https://avatars.dicebear.com/api/avataaars/#{seed}.svg"
  end
end
