class Option < ApplicationRecord
  belongs_to :question

  validates :content, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[id content correct question_id created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[question]
  end
end