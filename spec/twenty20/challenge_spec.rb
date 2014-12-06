require 'spec_helper'

describe Twenty20::Challenge do
  it_behaves_like 'an API object', with: %w(slug
                                            name
                                            description
                                            starts_at
                                            ends_at
                                            submission_count)
end
