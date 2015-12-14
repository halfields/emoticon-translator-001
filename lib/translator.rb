require 'yaml'

def load_library(file_path)
  table = YAML.load_file(file_path)
 # puts "table = #{table}"
  hash = {"get_meaning" => {}, "get_emoticon" => {}}
  meaning = {}; emoticons = {}
  table.each do |key, value|
    meaning[value[1]] = key
    emoticons[value[0]] = value[1]
  end
  hash["get_meaning"] = meaning
  hash["get_emoticon"] = emoticons
  puts "returned hash = #{hash}"
  hash
end

def get_japanese_emoticon(file_path, english_emoticon)
  hash = load_library(file_path)
  answer = ""
  if hash["get_emoticon"].key?(english_emoticon)
    hash["get_emoticon"].each do |key, value|
      if key == english_emoticon
        answer = value
      end
    end
  else
    answer = "Sorry, that emoticon was not found"
  end
  answer
end

def get_english_meaning(file_path, japanese_emoticon)
  hash = load_library(file_path)
  answer = ""
  if hash["get_meaning"].key?(japanese_emoticon)
    hash["get_meaning"].each do |key, value|
      if key == japanese_emoticon
        answer = value
      end
    end
  else
    answer = "Sorry, that emoticon was not found"
  end
  answer
end