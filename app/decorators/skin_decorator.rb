class SkinDecorator

  attr_reader :skin

  def initialize(skin)
    @skin
  end

  def method_missing(method_name, *args, &block)
    skin.send(method_name, *args, &block)
  end

  def respond_to_missing?(method_name, include_private = false)
    skin.respond_to?(method_name) || super
  end

end