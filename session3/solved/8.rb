class Person
  attr_accessor :name , :age , :quote

  def initialize(options=Hash.new, &initializer)
    self.name   =  options[:name]
    self.age    =  options[:age]
    self.quote  =  options[:quote]

    @initializer = initializer
    reinit
  end

  def reinit
    # if @initializer is nil, then we don't want to invoke .call on it
    # so first we check that it exists
    @initializer && @initializer.call(self)
  end
end
