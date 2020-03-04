class Artist
  attr_reader :id, :name, :born, :died, :country
  def initialize(info)
    @id = info[:id]
    @name = info[:name]
    @born = info[:born]
    @died = info[:died]
    @country = info[:country]
  end

  def age_at_death
    @died.to_i - @born.to_i
  end
end
