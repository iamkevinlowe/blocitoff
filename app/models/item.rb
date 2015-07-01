class Item < ActiveRecord::Base
  belongs_to :user

  def days_left
    7 - (DateTime.now.utc.to_date - created_at.to_date).to_i
  end

  def delete_if_older_than_7_days
    delete if days_left < 0
  end
end
