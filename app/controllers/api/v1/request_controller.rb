class Api::V1::RequestController < ApplicationController
  def fetch_data
    url = 'http://gutendex.com/books?page=1600'
    pages = []
    page = JSON.parse(RestClient.get(url))
    pages << page
    next_page = page["next"]

    until(page["next"] == nil) do#while next page isn't null

      page = JSON.parse(RestClient.get(next_page))
      puts "new_page"
      next_page = page["next"]
      pages << page
      puts pages.length
    end
    byebug
    pages.each do |page|
      save_page(page)
    end
  end

  def save_page(page)
    page["results"].each do |book|
      parse_book(book)
    end
  end

  def parse_book(book)

    if book["formats"].key?("application/pdf")
      new_author = save_author(book["authors"])
      new_book = save_book(new_author, book)
      save_subjects(new_book, book["subjects"])
      save_bookshelves(new_book, book["bookshelves"])
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
        end

      end
      return current_authors
    else
      current_authors << Author.create(name: "Unknown", birth_year: "Unknown", death_year: "Unknown")
      return current_authors
    end
  end



  def save_book(authors, book)
    # authors.each do |author|
      new_book = Book.find_or_create_by(title: book["title"]) do |bk|
        if book["formats"].key?("image/jpeg")
          bk.img_url = book["formats"]["image/jpeg"]
        else
          bk.img_url = "No Image"
        end
        bk.title = book["title"]
        bk.pdf_url = book["formats"]["application/pdf"]
        bk.language = book["language"][0]
        bk.author_id = authors[0].id
      end
      return new_book
  end

  def save_bookshelves(gutenbook, mybook)

    Bookself.find_or_create_by(name:)
  end
  def save_subjects(new_book, subjects)
    subjects.each do |subject|
      new_subject = Subject.find_or_create_by(name: subject)
      new_book.subject_id
    end
  end

end
