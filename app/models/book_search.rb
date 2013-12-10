class BookSearch < ActiveRecord::Base

  extend Textacular
  #attr_accessible :query
  attr_accessor :query

  belongs_to :searchable, polymorphic: true

  def results
    if @query.present?
      self.class.search(@query).preload(:searchable).map!(&:searchable).uniq.sort_by{|e| -e.created_at.to_i}
    else
      Search.none
    end
  end
end