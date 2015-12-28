class User < ActiveRecord::Base
  validates :uid, presence: true

  def self.github(request)
    find_or_initialize_by(uid: request['uid']).tap do |user|
      user.email = request.dig('info', 'email')
      user.nickname = request.dig('info', 'nickname')
      user.name = request.dig('info', 'name')
      user.image = request.dig('info', 'image')
      user.url = request.dig('extra', 'raw_info', 'html_url')
      user.token = request.dig('credentials', 'token')
    end
  end
end
