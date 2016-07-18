module Slugifiable
  module InstanceMethods
    def slug
      self.name.downcase.split(" ").join("-")
    end
  end

  module ClassMethods
    def self.find_by_slug(slug)
      self.class.all.find{|item| item.slug == slug}
    end
  end
end