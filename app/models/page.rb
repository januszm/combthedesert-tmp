class Page < ApplicationRecord
  serialize :content, Hash
  has_paper_trail on: [:update]
end
