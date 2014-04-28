module ActsMostlyImmutable
  module ClassMethods
    def ami_prefix(prefix)
      return if @__prefix_called
      @__prefix_called = true
      @__prefix = prefix

      define_method "#{@__prefix}party" do
        'time'
      end

      define_method :save, -> (*args, &block) do
        if self.changed? && self.persisted?
          self.id = nil
          new_guy = self.class.create(self.attributes)
          self.changes.each {|k,vs| self[k] = vs.first}
          new_guy
        else
          super(*args, &block)
        end
      end
    end
  end

  def self.included(base)
    base.extend(ClassMethods)
  end

  def method_missing(meth, *args, &block)
    self.class.ami_prefix @__prefix
    if self.respond_to? meth
      self.send meth, *args, &block
    else
      super
    end
  end
end
