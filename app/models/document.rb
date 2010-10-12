class Document < ActiveRecord::Base
  has_attached_file :white_paper

  def to_s
    Sanitize.clean(title)
  end
end
