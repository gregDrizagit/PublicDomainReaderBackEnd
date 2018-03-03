# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180212190532) do

  create_table "authors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "birth_year"
    t.string "death_year"
  end

  create_table "book_subjects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "book_id"
    t.bigint "subject_id"
    t.index ["book_id"], name: "index_book_subjects_on_book_id"
    t.index ["subject_id"], name: "index_book_subjects_on_subject_id"
  end

  create_table "bookmarks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.integer "book_id"
    t.integer "paragraph"
  end

  create_table "books", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "title", limit: 4294967295
    t.integer "author_id"
    t.integer "collection_id"
    t.integer "bookshelf_id"
    t.string "img_url"
    t.string "html_url"
  end

  create_table "bookshelf_books", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "bookshelf_id"
    t.bigint "book_id"
    t.index ["book_id"], name: "index_bookshelf_books_on_book_id"
    t.index ["bookshelf_id"], name: "index_bookshelf_books_on_bookshelf_id"
  end

  create_table "bookshelves", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
  end

  create_table "collections", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "subjects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "user_name"
    t.string "password_digest"
  end

  add_foreign_key "book_subjects", "books"
  add_foreign_key "book_subjects", "subjects"
  add_foreign_key "bookshelf_books", "books"
  add_foreign_key "bookshelf_books", "bookshelves"
  add_foreign_key "collections", "users"
end
