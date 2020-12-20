def ascii_title
  File.readlines('../docs/ascii_title.txt') do |line|
    puts line
  end
end

