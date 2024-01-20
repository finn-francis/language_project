# frozen_string_literal: true

require 'rails_helper'

describe Chapter do
  it { is_expected.to belong_to(:course).optional }
  it { is_expected.to have_many(:paragraphs) }
end
