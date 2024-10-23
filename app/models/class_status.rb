class ClassStatus < ApplicationRecord
  belongs_to :user
  belongs_to :class_list
	
  # 수강 신청 여부 확인하는 메서드
  def self.applied?(user_id, class_list_id)
	  exists?(user_id: user_id, class_list_id: class_list_id)
  end
  
  # 수강 인원 초과 확인하는 메서드
  def self.exceeds_capacity?(class_list_id)
	  current_size = where(class_list_id: class_list_id).size
	  max_capacity = ClassList.find(class_list_id).c_account
	  current_size >= max_capacity
  end
	
  # 학점 초과 확인하는 메서드
  def self.exceeds_credit?(user_id, max_credits = 20)
    current_credits = ClassStatus.where(user_id: user_id).joins(:class_list).sum('class_lists.credits')
    current_credits >= max_credits
  end
	
  # 신청 취소 시 학점 차감하는 메서드
  def self.minus_credits(user_id, class_list_id)
    class_list = ClassList.find(class_list_id)
    class_credit = class_list.credits
    current_credits = ClassStatus.where(user_id: user_id).joins(:class_list).sum('class_lists.credits')
    
    if current_credits >= class_credit
      current_credits -= class_credit
    end
    current_credits
  end
end