# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_languages, dependent: :destroy
  has_many :languages, through: :user_languages
  has_many :user_words, dependent: :destroy
  has_many :words, through: :user_words
end
