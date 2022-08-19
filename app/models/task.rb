class Task < ApplicationRecord
  validates :title, presence: { message: "タイトルが未入力です" }
  validate :length_count
  validate :time_comparison
  
  private
  def length_count
     errors.add(:title, "30文字以内で入力してください") if title&.length > 30
  end
  
  private
  def time_comparison
    if day_end
      errors.add(:day_start, "日付及び時間設定を見直してください") if day_start&.after?(day_end) 
    end
  end
    
end
