class School
    attr_accessor :name, :address
    def aaa(tri)
      p "#{tri}"
    end
end
school = School.new
puts school.aaa("aaa")