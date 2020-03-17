class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 10}
    validates :summary, length: { maximum: 200 }
    validates :category, inclusion: {in: %w(Fiction Nonfiction)}
    validate :clickbait

    def clickbait
        if !title.nil? && (!title.include?("You Won't" || "Secret" || "Top" || "Guess")) 
            errors.add(:clickbait, "That is not a clickbait worthy title. Try again.")
        end
    end 

end
