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

ActiveRecord::Schema.define(version: 20180131213735) do

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.string "birth_year"
    t.string "death_year"
  end

  create_table "book_subjects", force: :cascade do |t|
    t.integer "book_id"
    t.integer "subject_id"
    t.index ["book_id"], name: "index_book_subjects_on_book_id"
    t.index ["subject_id"], name: "index_book_subjects_on_subject_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.integer "author_id"
    t.integer "collection_id"
    t.integer "bookshelf_id"
    t.string "language"
    t.string "img_url"
    t.string "pdf_url"
    t.index ["author_id"], name: "index_books_on_author_id"
    t.index ["bookshelf_id"], name: "index_books_on_bookshelf_id"
    t.index ["collection_id"], name: "index_books_on_collection_id"
  end

  create_table "bookshelves", force: :cascade do |t|
    t.string "name"
  end

  create_table "collections", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "user_name"
    t.string "password_digest"
  end

end
