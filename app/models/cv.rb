class Cv < ActiveRecord::Base
  belongs_to :candidate
  has_attached_file :item
end
