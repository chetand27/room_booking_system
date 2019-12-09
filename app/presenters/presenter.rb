class Presenter
  attr_accessor :object

  def initialize(object)
    self.object = object
  end

  # If a method we call is missing, pass the call onto
  # the object we delegate to.
  def method_missing(m, *args, &block)
    object.send(m, *args, &block)
  end
end