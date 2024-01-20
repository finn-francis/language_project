# frozen_string_literal: true

class Paragraph < Chapter
  SPLIT_REGEX = /(\s*\n\s*){2,}/

  belongs_to :chapter, foreign_key: :parent_id, inverse_of: :paragraphs
  has_many :sentences, dependent: :destroy, inverse_of: :paragraph

  acts_as_list scope: :chapter

  delegate :course, to: :chapter, allow_nil: true

  def raw_text
    sentences.map(&:raw_text).join(' ')
  end
end
