class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :boards, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favotite_boards, through: :favorites, source: :board

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :reset_password_token, uniqueness: true, allow_nil: true

  validates :email, uniqueness: true

  def unfavorite(board)
    favorite_boards.destroy(board)
  end

  def favorite?(board)
    favorite_boards.include?(board)
  end
end
