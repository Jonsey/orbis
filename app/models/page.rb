class Page < ActiveRecord::Base
  acts_as_nested_set

  validates_presence_of :name
  validates_presence_of :controller, :action, :unless => :proposed_root?

  after_save :move_to_correct_position

  def proposed_parent_id
    @proposed_parent_id
  end

  def proposed_parent_id=(parent)
    @proposed_parent_id = parent
  end

  private

  def proposed_root?
    proposed_parent_id.nil? || proposed_parent_id == ''
  end

  def move_to_correct_position
    unless proposed_parent_id.nil? || proposed_parent_id == ''
      parent = Page.find_by_id(proposed_parent_id)
      self.move_to_child_of(parent)
    end
  end
end
