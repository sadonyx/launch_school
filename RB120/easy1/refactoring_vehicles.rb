class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{make} #{model}"
  end

  def wheels
    self.class::NUM_OF_WHEELS
  end
end

class Car < Vehicle
  NUM_OF_WHEELS = 4
end

class Motorcycle
  NUM_OF_WHEELS = 2
end

class Truck
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  NUM_OF_WHEELS = 6
end