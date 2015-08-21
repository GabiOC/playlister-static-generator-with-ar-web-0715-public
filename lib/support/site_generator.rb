class SiteGenerator
  attr_accessor :rendered_path

  def initialize(path)
    @rendered_path = path
  end

  def build_index
    FileUtils.mkdir_p @rendered_path unless Dir.exist? @rendered_path
    template = File.read('app/views/index.html.erb')

    File.open("#{@rendered_path}/index.html", "w+") { |f| f.write ERB.new(template).result(binding)}
  end

  def build_artists_index
    FileUtils.mkdir_p "#{@rendered_path}/artists/" unless Dir.exist? "#{@rendered_path}/artists/"
    template = File.read('app/views/artists/index.html.erb')

    File.open("#{@rendered_path}/artists/index.html", "w+") { |f| f.write ERB.new(template).result(binding)}
  end

  def build_artist_page
    FileUtils.mkdir_p "#{@rendered_path}/artists/" unless Dir.exist? "#{@rendered_path}/artists/"
    template = File.read('app/views/artists/show.html.erb')

    erb = ERB.new(template)

    Artist.all.each do |artist|
      @artist = artist
      artist_page = erb.result(binding)
      File.open("#{@rendered_path}/artists/#{artist.to_slug}.html", "w+") {|f| f.write(artist_page)}
    end
  end

  def build_genres_index
    FileUtils.mkdir_p "#{@rendered_path}/genres/" unless Dir.exist? "#{@rendered_path}/genres/"
    template = File.read('app/views/genres/index.html.erb')

    File.open("#{@rendered_path}/genres/index.html", "w+") { |f| f.write ERB.new(template).result(binding)}
  end

  def build_genre_page
    FileUtils.mkdir_p "#{@rendered_path}/genres/" unless Dir.exist? "#{@rendered_path}/genres/"
    template = File.read('app/views/genres/show.html.erb')

    erb = ERB.new(template)

    Genre.all.each do |genre|
      @genre = genre
      genre_page = erb.result(binding)
      File.open("#{@rendered_path}/genres/#{genre.to_slug}.html", "w+") {|f| f.write(genre_page)}
    end
  end

  def build_songs_index
    FileUtils.mkdir_p "#{@rendered_path}/songs/" unless Dir.exist? "#{@rendered_path}/songs/"
    template = File.read('app/views/songs/index.html.erb')

    File.open("#{@rendered_path}/songs/index.html", "w+") { |f| f.write ERB.new(template).result(binding)}
  end

  def build_song_page
    FileUtils.mkdir_p "#{@rendered_path}/songs/" unless Dir.exist? "#{@rendered_path}/songs/"
    template = File.read('app/views/songs/show.html.erb')

    erb = ERB.new(template)

    Song.all.each do |song|
      @song = song
      song_page = erb.result(binding)
      File.open("#{@rendered_path}/songs/#{song.to_slug}.html", "w+") {|f| f.write(song_page)}
    end
  end
end
