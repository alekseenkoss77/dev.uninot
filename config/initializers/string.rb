# coding: utf-8
class String
  def string_from_file
    data = ''
    f = File.open(self, "r")
    f.each_line do |line|
      data += line
    end
    data
  end

  def show?
    self.blank? ? UNSPECIFIED : self
  end

  def to_print
    self == "" ? "" : self.gsub("\t", '').gsub("\n", '').gsub("\r", '')
  end

  def get_id_from_url
    self.split("-").first
  end

  def change_plus
    self.gsub("+7", "8")
  end

  def to_keywords
    self.split(" ").collect {|e| Unicode.downcase(e)}.join(", ")
  end

  def remove_extension
    File.basename(self, '.*')
  end

  def get_extension
    File.extname(self)
  end

  def remove_promo
    self.include?("::") ? self.split("::")[1] : self
  end

  #def join
  #  # "[\"z\", \"y\", \"z\", \"d\", \"d\", \"p\"]"
  #  self.blank? ? "" : self.gsub(/[^a-z]/, '')
  #end

  def to_slug
    Russian.translit(self).downcase.gsub(/[^a-z0-9]+/, '-').strip.chomp('-')

    # другой вариант
    #initial = Russian::translit(self.name).gsub(/[^A-Za-z0-9\s\-]/, "")[0,40].strip.gsub(/\s+/, "-").downcase
  end
end