# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111017064845) do

  create_table "administrators", :force => true do |t|
    t.string   "first_name", :limit => 30,                   :null => false
    t.string   "last_name",  :limit => 30,                   :null => false
    t.string   "email",                                      :null => false
    t.string   "username",   :limit => 30,                   :null => false
    t.string   "password",   :limit => 50,                   :null => false
    t.boolean  "active",                   :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "artist_image_lists", :force => true do |t|
    t.string   "image_code",      :limit => 30
    t.integer  "price"
    t.string   "file_name",       :limit => 30
    t.integer  "image_type_id"
    t.integer  "artist_image_id"
    t.boolean  "active",                        :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "artist_images", :force => true do |t|
    t.string   "name",        :limit => 30,                   :null => false
    t.text     "description",                                 :null => false
    t.integer  "artist_id"
    t.boolean  "active",                    :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "artists", :force => true do |t|
    t.string   "name",        :limit => 30,                   :null => false
    t.text     "description"
    t.boolean  "active",                    :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "image_type_lists", :force => true do |t|
    t.string   "name",        :limit => 30
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "card_type"
    t.string   "card_expires_on"
    t.integer  "transaction_id"
    t.integer  "artist_id"
    t.integer  "member_id"
    t.integer  "total_price"
    t.boolean  "success",         :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name",      :limit => 30,                   :null => false
    t.string   "last_name",       :limit => 30,                   :null => false
    t.string   "email",                                           :null => false
    t.string   "username",        :limit => 30,                   :null => false
    t.string   "password",        :limit => 50,                   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "activation_code"
    t.datetime "activated_at"
    t.boolean  "active",                        :default => true
  end

end
