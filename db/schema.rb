# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2026_05_09_101835) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "evaluations", force: :cascade do |t|
    t.bigint "solution_id", null: false
    t.text "result"
    t.integer "rating"
    t.date "published_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["solution_id"], name: "index_evaluations_on_solution_id"
  end

  create_table "policy_proposals", force: :cascade do |t|
    t.bigint "owner_id", null: false
    t.bigint "related_project_id"
    t.string "title"
    t.string "slug"
    t.text "summary"
    t.text "background"
    t.text "problem"
    t.text "proposal"
    t.text "target_users"
    t.text "system_outline"
    t.text "expected_effect"
    t.text "risks"
    t.text "pilot_plan"
    t.string "status"
    t.string "visibility"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_policy_proposals_on_owner_id"
    t.index ["related_project_id"], name: "index_policy_proposals_on_related_project_id"
    t.index ["slug"], name: "index_policy_proposals_on_slug", unique: true
  end

  create_table "post_tags", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_post_tags_on_post_id"
    t.index ["tag_id"], name: "index_post_tags_on_tag_id"
  end

  create_table "posting_queue_items", force: :cascade do |t|
    t.bigint "posting_queue_id", null: false
    t.bigint "post_id", null: false
    t.integer "position"
    t.string "status"
    t.datetime "scheduled_at"
    t.datetime "published_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_posting_queue_items_on_post_id"
    t.index ["posting_queue_id"], name: "index_posting_queue_items_on_posting_queue_id"
  end

  create_table "posting_queues", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.integer "interval_minutes"
    t.datetime "start_at"
    t.datetime "next_run_at"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posting_queues_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "project_id"
    t.bigint "policy_proposal_id"
    t.bigint "parent_post_id"
    t.string "post_type"
    t.string "title"
    t.text "body"
    t.string "visibility"
    t.string "status"
    t.datetime "published_at"
    t.datetime "scheduled_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_post_id"], name: "index_posts_on_parent_post_id"
    t.index ["policy_proposal_id"], name: "index_posts_on_policy_proposal_id"
    t.index ["project_id"], name: "index_posts_on_project_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.bigint "owner_id", null: false
    t.string "title"
    t.string "slug"
    t.text "summary"
    t.text "description"
    t.string "status"
    t.string "visibility"
    t.string "demo_url"
    t.string "github_url"
    t.string "cover_image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_projects_on_owner_id"
    t.index ["slug"], name: "index_projects_on_slug", unique: true
  end

  create_table "reports", force: :cascade do |t|
    t.bigint "reporter_id", null: false
    t.bigint "post_id", null: false
    t.text "reason"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_reports_on_post_id"
    t.index ["reporter_id"], name: "index_reports_on_reporter_id"
  end

  create_table "scheduled_posts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "post_id", null: false
    t.bigint "posting_queue_id"
    t.datetime "scheduled_at"
    t.string "status"
    t.text "error_message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_scheduled_posts_on_post_id"
    t.index ["posting_queue_id"], name: "index_scheduled_posts_on_posting_queue_id"
    t.index ["user_id"], name: "index_scheduled_posts_on_user_id"
  end

  create_table "solutions", force: :cascade do |t|
    t.string "title"
    t.string "category"
    t.text "summary"
    t.text "evidence"
    t.text "impact"
    t.string "url"
    t.boolean "published"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_tags_on_slug", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "display_name"
    t.string "username"
    t.text "bio"
    t.string "website_url"
    t.string "avatar_url"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "evaluations", "solutions"
  add_foreign_key "policy_proposals", "projects", column: "related_project_id"
  add_foreign_key "policy_proposals", "users", column: "owner_id"
  add_foreign_key "post_tags", "posts"
  add_foreign_key "post_tags", "tags"
  add_foreign_key "posting_queue_items", "posting_queues"
  add_foreign_key "posting_queue_items", "posts"
  add_foreign_key "posting_queues", "users"
  add_foreign_key "posts", "policy_proposals"
  add_foreign_key "posts", "posts", column: "parent_post_id"
  add_foreign_key "posts", "projects"
  add_foreign_key "posts", "users"
  add_foreign_key "projects", "users", column: "owner_id"
  add_foreign_key "reports", "posts"
  add_foreign_key "reports", "users", column: "reporter_id"
  add_foreign_key "scheduled_posts", "posting_queues"
  add_foreign_key "scheduled_posts", "posts"
  add_foreign_key "scheduled_posts", "users"
end
