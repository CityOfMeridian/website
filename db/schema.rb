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

ActiveRecord::Schema.define(version: 20180119220628) do

  create_table "contacts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.text     "message",      limit: 65535
    t.string   "contact_type"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "message",         limit: 65535
    t.datetime "date"
    t.boolean  "approved"
    t.integer  "organization_id"
    t.integer  "place_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["organization_id"], name: "index_events_on_organization_id", using: :btree
    t.index ["place_id"], name: "index_events_on_place_id", using: :btree
  end

  create_table "fae_changes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "changeable_id"
    t.string   "changeable_type"
    t.integer  "user_id"
    t.string   "change_type"
    t.text     "updated_attributes", limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["changeable_id"], name: "index_fae_changes_on_changeable_id", using: :btree
    t.index ["changeable_type"], name: "index_fae_changes_on_changeable_type", using: :btree
    t.index ["user_id"], name: "index_fae_changes_on_user_id", using: :btree
  end

  create_table "fae_files", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "asset"
    t.string   "fileable_type"
    t.integer  "fileable_id"
    t.integer  "file_size"
    t.integer  "position",      default: 0
    t.string   "attached_as"
    t.boolean  "on_stage",      default: true
    t.boolean  "on_prod",       default: false
    t.boolean  "required",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attached_as"], name: "index_fae_files_on_attached_as", using: :btree
    t.index ["fileable_type", "fileable_id"], name: "index_fae_files_on_fileable_type_and_fileable_id", using: :btree
  end

  create_table "fae_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "asset"
    t.string   "imageable_type"
    t.integer  "imageable_id"
    t.string   "alt"
    t.string   "caption"
    t.integer  "position",       default: 0
    t.string   "attached_as"
    t.boolean  "on_stage",       default: true
    t.boolean  "on_prod",        default: false
    t.integer  "file_size"
    t.boolean  "required",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attached_as"], name: "index_fae_images_on_attached_as", using: :btree
    t.index ["imageable_type", "imageable_id"], name: "index_fae_images_on_imageable_type_and_imageable_id", using: :btree
  end

  create_table "fae_options", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "time_zone"
    t.string   "colorway"
    t.string   "stage_url"
    t.string   "live_url"
    t.integer  "singleton_guard"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["singleton_guard"], name: "index_fae_options_on_singleton_guard", unique: true, using: :btree
  end

  create_table "fae_roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fae_roles_organizations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "fae_role_id"
    t.integer "organization_id"
  end

  create_table "fae_static_pages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "class_name"
    t.integer  "position",             default: 0
    t.boolean  "on_stage",             default: true
    t.boolean  "on_prod",              default: false
    t.string   "slug"
    t.boolean  "active"
    t.integer  "meridian_template_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["slug"], name: "index_fae_static_pages_on_slug", using: :btree
  end

  create_table "fae_static_pages_organizations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "fae_static_page_id"
    t.integer "organization_id"
  end

  create_table "fae_text_areas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "label"
    t.text     "content",          limit: 65535
    t.integer  "position",                       default: 0
    t.boolean  "on_stage",                       default: true
    t.boolean  "on_prod",                        default: false
    t.integer  "contentable_id"
    t.string   "contentable_type"
    t.string   "attached_as"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attached_as"], name: "index_fae_text_areas_on_attached_as", using: :btree
    t.index ["contentable_id"], name: "index_fae_text_areas_on_contentable_id", using: :btree
    t.index ["contentable_type"], name: "index_fae_text_areas_on_contentable_type", using: :btree
    t.index ["on_prod"], name: "index_fae_text_areas_on_on_prod", using: :btree
    t.index ["on_stage"], name: "index_fae_text_areas_on_on_stage", using: :btree
    t.index ["position"], name: "index_fae_text_areas_on_position", using: :btree
  end

  create_table "fae_text_fields", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "contentable_type"
    t.integer  "contentable_id"
    t.string   "attached_as"
    t.string   "label"
    t.string   "content"
    t.integer  "position",         default: 0
    t.boolean  "on_stage",         default: true
    t.boolean  "on_prod",          default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attached_as"], name: "index_fae_text_fields_on_attached_as", using: :btree
    t.index ["contentable_type", "contentable_id"], name: "index_fae_text_fields_on_contentable_type_and_contentable_id", using: :btree
    t.index ["on_prod"], name: "index_fae_text_fields_on_on_prod", using: :btree
    t.index ["on_stage"], name: "index_fae_text_fields_on_on_stage", using: :btree
    t.index ["position"], name: "index_fae_text_fields_on_position", using: :btree
  end

  create_table "fae_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "role_id"
    t.boolean  "active"
    t.string   "language"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["confirmation_token"], name: "index_fae_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_fae_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_fae_users_on_reset_password_token", unique: true, using: :btree
    t.index ["role_id"], name: "index_fae_users_on_role_id", using: :btree
    t.index ["unlock_token"], name: "index_fae_users_on_unlock_token", unique: true, using: :btree
  end

  create_table "meetings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.datetime "date"
    t.integer  "organization_id"
    t.integer  "place_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["organization_id"], name: "index_meetings_on_organization_id", using: :btree
    t.index ["place_id"], name: "index_meetings_on_place_id", using: :btree
  end

  create_table "members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description",     limit: 65535
    t.string   "email"
    t.datetime "term_start"
    t.datetime "term_end"
    t.boolean  "active",                        default: false
    t.integer  "organization_id"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.index ["organization_id"], name: "index_members_on_organization_id", using: :btree
  end

  create_table "meridian_templates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "content",         limit: 65535
    t.boolean  "approved"
    t.integer  "organization_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["organization_id"], name: "index_news_items_on_organization_id", using: :btree
  end

  create_table "organization_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "leader_title",            default: "mayor"
    t.string   "second_leader_title",     default: "mayor pro tem"
    t.string   "members_collection_name", default: "City Council"
    t.string   "default_member_title",    default: "Council Member"
    t.string   "website"
    t.string   "admin_prefix"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.integer  "leader_id"
    t.integer  "second_leader_id"
    t.integer  "organization_type_id"
    t.index ["leader_id"], name: "index_organizations_on_leader_id", using: :btree
    t.index ["organization_type_id"], name: "index_organizations_on_organization_type_id", using: :btree
    t.index ["second_leader_id"], name: "index_organizations_on_second_leader_id", using: :btree
  end

  create_table "places", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "public_notices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "description",     limit: 65535
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "noticeable_type"
    t.integer  "noticeable_id"
    t.integer  "organization_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["noticeable_type", "noticeable_id"], name: "index_public_notices_on_noticeable_type_and_noticeable_id", using: :btree
    t.index ["organization_id"], name: "index_public_notices_on_organization_id", using: :btree
  end

  add_foreign_key "meetings", "organizations"
end
