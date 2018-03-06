class Api::V1::RequestController < ApplicationController
  def fetch_data
    url = 'http://gutendex.com/books'
    pages = []
    page = JSON.parse(RestClient.get(url))
    pages << page
    next_page = page["next"]
    @status = "seeding"
    until(page["next"] == nil) do#while next page isn't null

      page = JSON.parse(RestClient.get(next_page))
      # puts "new_page"
      next_page = page["next"]
      pages << page
      # puts pages.length
      @status = "On page #{pages.length}"

    end
    pages.each do |page|
      save_page(page)
    end
    @status = "done"
    render html: @status

  end

  def save_page(page)
    page["results"].each do |book|
      parse_book(book)
    end
  end

  def parse_book(book)
    book_format = ""
    book["formats"].keys.each do |key|
      if key.to_s.include?("text/html")
        book_format = key
      end
    end

    if book_format != ""
      if !book["formats"][book_format].include?(".zip")
        new_author = save_author(book["authors"])
        new_book = save_book(new_author, book, book_format)
        save_subjects(new_book, book["subjects"])
        save_bookshelves(new_book, book["bookshelves"])
      end
    end

  end

  def save_author(authors)
    current_authors = []
    if authors.length > 0
      authors.each do |author|
        current_authors << Author.find_or_create_by(name: author["name"]) do |auth|

          auth.name = author["name"]
          auth.birth_year = author["birth_year"].to_s
          auth.death_year = author["death_year"].to_s
          render html: "rendering #{author['name']}"
        end

      end
      return current_authors
    else
      current_authors << Author.find_or_create_by(name: "Unknown") do |author|
        author.birth_year = "Unknown"
        author.death_year = "Unknown"
      end

      return current_authors
    end
  end



  def save_book(authors, book, book_format)
    # authors.each do |author|
      new_book = Book.find_or_create_by(title: book["title"]) do |bk|

        if book["formats"].key?("image/jpeg")
          bk.img_url = book["formats"]["image/jpeg"]
        else
          bk.img_url = "No Image"
        end
        bk.title = book["title"]
        bk.html_url = book["formats"][book_format]
        bk.author_id = authors[0].id
      end
      return new_book
  end

  def save_bookshelves(new_book, bookshelves)
    bookshelves.each do |bookshelf|
      new_bookshelf = Bookshelf.find_or_create_by(name: bookshelf)
      new_bookshelf.books << new_book
    end
  end

  def save_subjects(new_book, subjects)
    subjects.each do |subject|
      new_subject = Subject.find_or_create_by(name: subject)
      new_book.subjects << new_subject
    end
  end

  def get_book
    html = RestClient.get(params[:html_url])

    render plain: html.to_s, status: 200
  end

end
