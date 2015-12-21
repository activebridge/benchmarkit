class Account < ActiveRecord::Base
  def self.github(request)
    Account.find_or_create_by(uid: request['uid']).tap do |account|
      account.email = request['info']['email']
      account.nickname = request['info']['nickname']
      account.name = request['info']['name']
      account.image = request['info']['image']
      account.url = request['extra']['raw_info']['html_url']
      account.token = request['credentials']['token']
    end
  end
end
