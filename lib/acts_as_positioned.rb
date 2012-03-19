module ActsAsPositioned

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods

    def acts_as_positioned(opts={})
      
      positioned_under = opts[:under].nil? ? self.name : "self.#{opts[:under].to_s}.#{self.name.tableize}" rescue "[]"
      
      class_eval <<-CGF
        include ActsAsPositioned::InstanceMethods
        def siblings_in_position
          #{positioned_under}
        end

        attr_accessor :old_position
        before_save :set_old_position
        after_save :fix_positions
        after_destroy :fix_positions
      CGF
    end

  end

  module InstanceMethods
    
    def set_old_position
      begin
        count = siblings_in_position.count + 1
        self.old_position = self.new_record? ? count : self.class.find(self.id).position
        self.position = count if self.position.blank?
      rescue
        #fail gracefully
      end
    end

    def fix_positions
      begin
        if !self.old_position.nil? && self.old_position >= self.position 
          broken_records = siblings_in_position.order("position ASC, updated_at DESC")
        else
          broken_records = siblings_in_position.order("position ASC, updated_at ASC")
        end

        broken_records.each_with_index do |s,i|
          s.update_column :position, i+1
        end
      rescue
        #fail gracefully
      end
    end
  end

end

ActiveRecord::Base.send :include, ActsAsPositioned
