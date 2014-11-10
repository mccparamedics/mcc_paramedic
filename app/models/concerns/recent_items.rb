require_dependency 'Forem'

module RecentItems
  def self.included(base) # :nodoc:
    base.extend(ClassMethods)

    # base.send(:include, InstanceMethods)
  end

  module ClassMethods
    def recent limit=5
      order(created_at: :desc).limit(limit)
    end
  end
  # module InstanceMethods
  #
  # end
end

