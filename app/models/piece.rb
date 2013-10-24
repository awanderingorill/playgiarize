require 'wordnik'
require 'active_record'

class Piece < ActiveRecord::Base
  attr_accessible :orig_title, :orig_author, :orig_body, :title, :body, :user_id
  belongs_to :user

  def plagiarize
# as long as there is an input in the title field, do this
      orig_title_downcase = orig_title.downcase
      words = orig_title_downcase.split(/ /)
      plagiarized_words = []
      words.each do |w|
# if 'w' does not equal any of the words in the exception list, do this
# otherwise, just copy the existing word into the new array
        synonyms = Wordnik.word.get_related(w, :type => 'synonym')
        if synonyms.any?
          synonym = synonyms.first["words"].sample
          plagiarized_words << synonym
        else plagiarized_words << w
        end
        plagiarized_title = plagiarized_words.join(" ")
        self.title = plagiarized_title
      end

# raise error if no body text is inputted
      orig_body_downcase = orig_body.downcase
      words = orig_body_downcase.split(/ /)
      plagiarized_words = []
      words.each do |w|
        synonyms = Wordnik.word.get_related(w, :type => 'synonym')
        if synonyms.any?
          synonym = synonyms.first["words"].sample
          plagiarized_words << synonym
        else plagiarized_words << w
        end
        plagiarized_body = plagiarized_words.join(" ")
        self.body = plagiarized_body
      end
    end
  end
