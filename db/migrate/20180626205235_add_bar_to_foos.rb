class AddBarToFoos < ActiveRecord::Migration[5.1]
  def up
    add_column :foos, :bar, :bigint

    Foo.find_each do |foo|
      foo.bar = 2147483647 + rand(9223372034707292159)
      foo.save!
    end
  end

  def down
    remove_column :foos, :bar
  end
end
