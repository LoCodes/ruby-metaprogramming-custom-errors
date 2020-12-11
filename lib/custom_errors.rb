class Person
  attr_accessor :name, :partner

  def initialize(name)
    @name = name
  end

  # def get_married(person)
  #   self.partner = person
  #   person.partner = self
  # end


  def get_married(person)
    self.partner = person
    if person.class != Person
      begin
        raise PartnerError            #RIASE ERROR
      rescue PartnerError => error    # RESCUE ERROR -keep code running (pass error) returns => beyonce
          puts error.message
      end
    else
      person.partner = self
    end
  end

  # Add the following two lines:
  class PartnerError < StandardError
    def message
      "you must give the get_married method an argument of an instance of the person class!"
    end
  end
end

beyonce = Person.new("Beyonce")
beyonce.get_married("Jay-Z")
puts beyonce.name 


#=> you must give the get_married method an argument of an instance of the person class!
#=> Beyonce