# coding: utf-8
class Page < ActiveRecord::Base
  attr_accessible :name, :body, :slug, :meta_title, :meta_description, :meta_keywords
  before_save :slugged
  validates :name, :body, presence: true

  def slugged
    self.slug = name.to_slug
  end

end
