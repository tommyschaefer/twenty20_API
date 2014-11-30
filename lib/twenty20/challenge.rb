module Twenty20
  class Challenge
    attr_reader :slug, :name, :description, :starts_at, :ends_at, :submission_count
    
    def initialize(attributes = {})
      @slug = attributes["slug"] 
      @name = attributes["name"]
      @description = attributes["description"]
      @starts_at = attributes["starts_at"]
      @ends_at = attributes["ends_at"]
      @submission_count = attributes["submission_count"]
    end
  end
end
