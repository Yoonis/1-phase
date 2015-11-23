class FileParser
  attr_reader :file_name

  def initialize(file_name)
    @file_name = file_name
  end

  def parse()
    File.new(file_name)
        .readlines.map {|line| line.chomp}
        .delete_if {|line| line.empty?}
        .each_slice(2).to_a
  end

end

# flashcard_text = FileParser.new("flashcard_samples.txt")
# flashcard_text.parse
