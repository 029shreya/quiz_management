class Question < ApplicationRecord
  belongs_to :quiz
  has_many :options, dependent: :destroy

  enum question_type: { msq:0, true_false: 1, text: 2}

  accepts_nested_attributes_for :options, allow_destroy: true

  validates :content, :question_type, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[id content question_type correct_answer quiz_id created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[quiz options]
  end
end
