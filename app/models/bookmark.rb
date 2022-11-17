# frozen_string_literal: true

class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :list, presence: true, uniqueness: { scope: :movie }
  validates :comment, length: { minimum: 6 }
end
