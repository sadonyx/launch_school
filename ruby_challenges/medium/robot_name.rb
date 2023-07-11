class Robot
  @@names = []

  attr_reader :name

  def name
    return @name if @name
    @name = generate_name while @@names.include?(@name) || @name.nil?
    @@names << @name
    @name
  end

  def reset
    @@names.delete(@name)
    @name = nil
  end

  private
  def generate_name
    loop do
      name = ""
      2.times { |_| name << rand(65..90).chr }
      3.times { |_| name << rand(0..9).to_s }
      return name if !@@names.include?(name)
    end
  end
end
  