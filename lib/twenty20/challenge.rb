module Twenty20
  class Challenge < ApiObject
    def self.attributes
      %w(slug
         name
         description
         starts_at
         ends_at
         submission_count)
    end
  end
end
