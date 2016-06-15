class AddProjectsTable < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
    end

    create_table :builds do |t|
      t.references :project, index: true
      t.string :build_num
      t.string :branch
      t.string :committer_name
      t.string :subject
      t.string :body
      t.string :dont_build
      t.datetime :start_time
      t.datetime :stop_time
      t.integer :build_time_millis
      t.string :reponame
      t.string :lifecycle
      t.string :outcome
      t.string :status
    end

  end
end
