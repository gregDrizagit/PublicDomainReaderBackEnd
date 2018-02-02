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
      save_book(new_author, book)
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
      new_author = Author.create(name: "Unknown", birth_year: "Unknown", death_year: "Unknown")
      return new_author
    end
  end



  def save_book(authors, book)
    # authors.each do |author|
      Book.find_or_create_by(title: book["title"]) do |bk|
        if book["formats"].key?("image/jpeg")
          bk.img_url = "No Image"
        else
          bk.img_url = book["formats"]["image/jpg"]
        end
        bk.title = book["title"]
        bk.pdf_url = book["formats"]["application/pdf"]
        bk.author_id = authors[0].id
      end

  end

end
