class School
    # nameというインスタンスメソッドを定義する
    def name(word)
      @school_name = word
    end
    def name1
      puts @school_name
    end
  end
  school = School.new
  school.name("A学校")
  school.name1