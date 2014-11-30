module Twenty20
  class Item
    attr_reader :caption, :id, :source_name, :image_url, :featured_at, :user_first_name, 
                  :user_last_name, :user_avatar_url, :username, :display_name
    def initialize(attributes = {})     #set default so attributes will default to nil and not throw exception if not present
      @caption = attributes["caption"]
      @id = attributes["id"]
      @source_name = attributes["source_name"]
      @image_url = attributes["standard_url"]
      @featured_at = attributes["featured_at"]
      @user_first_name = attributes["first_name"]
      @user_last_name = attributes["last_name"]
      @user_avatar_url = attributes["avatar"]
      @username = attributes["username"]
      @display_name = attributes["display_name"]
    end
  end
end

