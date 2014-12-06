require 'spec_helper'

describe Twenty20::Item do
  it_behaves_like 'an API object', with: %w(caption
                                            id
                                            source_name
                                            image_url
                                            featured_at
                                            user_first_name
                                            user_last_name
                                            user_avatar_url
                                            username
                                            display_name)
end
