class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :line_items
  has_many :recipes#, :through => :line_items
  has_many :favorites, through: :line_items, source: :recipe
  
end
