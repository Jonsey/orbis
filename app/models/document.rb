class Document < ActiveRecord::Base
  has_attached_file :white_paper

  def to_s
    title
  end
end
