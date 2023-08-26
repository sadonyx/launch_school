require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

def split_chapter(text)
  text.split("\n\n")
end

def each_chapter
  @contents.each_with_index do |name, index|
    number = index + 1
    contents = split_chapter(File.read("data/chp#{index + 1}.txt"))
    yield number, name, contents
  end
end

def chapters_matching(query)
  results = []

  return results if !query || query.empty?

  each_chapter do |number, name, contents|
    matches = {}
    contents.each_with_index { |paragraph, index| matches[index] = paragraph if paragraph.include? query }
    results << {number: number, name: name, matches: matches} if !matches.empty?
  end

  results
end

before do
  @contents = File.readlines("data/toc.txt")
end

get "/" do
  @title = "The Adventures of Sherlock Holmes"
  erb :home
end

get "/search" do
  @results = chapters_matching(params[:query])
  erb :search
end

get "/chapters/:number" do
  @contents = File.readlines("data/toc.txt")

  number = params[:number]
  chapter_name = @contents[number.to_i - 1]

  #redirect "/" unless (1..@contents.size).cover? number

  @title = "Chapter #{number}: #{chapter_name}"
  @chapter = File.read("data/chp#{number}.txt")

  erb :chapter
end

not_found do
  redirect "/"
end

helpers do
  def paragraphify(text)
    text.split("\n\n").each_with_index.map do |paragraph, index|
      "<p id=paragraph#{index}>#{paragraph}</p>"
    end.join
  end

  def highlight_search_term(term, paragraph)
    paragraph.gsub(term, %(<strong>#{term}</strong>))
  end
end