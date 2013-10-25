require 'wordnik'
require 'active_record'

STOP_WORDS = ["lot", "I", "i" "negro", "Negro", "mirror", "like", "well", "hold", "one,", "just","we'll","go","a", "about", "above", "above", "across", "after", "afterwards", "again", "against", "all", "almost", "alone", "along", "already", "also","although","always","am","among", "amongst", "amoungst", "amount",  "an", "and", "another", "any","anyhow","anyone","anything","anyway", "anywhere", "are", "around", "as",  "at", "back","be","became", "because","become","becomes", "becoming", "been", "before", "beforehand", "behind", "being", "below", "beside", "besides", "between", "beyond", "bill", "both", "bottom","but", "by", "call", "can", "cannot", "cant", "co", "con", "could", "couldnt", "cry", "de", "describe", "detail", "do", "done", "down", "due", "during", "each", "eg", "eight", "either", "eleven","else", "elsewhere", "empty", "enough", "etc", "even", "ever", "every", "everyone", "everything", "everywhere", "except", "few", "fifteen", "fify", "fill", "find", "fire", "first", "five", "for", "former", "formerly", "forty", "found", "four", "from", "front", "full", "further", "get", "give", "go", "had", "has", "hasnt", "have", "he", "hence", "her", "here", "hereafter", "hereby", "herein", "hereupon", "hers", "herself", "him", "himself", "his", "how", "however", "hundred", "i","ie", "if", "in", "inc", "indeed", "interest", "into", "is", "it", "its", "itself", "keep", "last", "latter", "latterly", "least", "less", "ltd", "made", "many", "may", "me", "meanwhile", "might", "mill", "mine", "more", "moreover", "most", "mostly", "move", "much", "must", "my", "myself", "name", "namely", "neither", "never", "nevertheless", "next", "nine", "no", "nobody", "none", "noone", "nor", "not", "nothing", "now", "nowhere", "of", "off", "often", "on", "once", "one", "only", "onto", "or", "other", "others", "otherwise", "our", "ours", "ourselves", "out", "over", "own","part", "per", "perhaps", "please", "put", "rather", "re", "same", "see", "seem", "seemed", "seeming", "seems", "serious", "several", "she", "should", "show", "side", "since", "sincere", "six", "sixty", "so", "some", "somehow", "someone", "something", "sometime", "sometimes", "somewhere", "still", "such", "system", "take", "ten", "than", "that", "the", "their", "them", "themselves", "then", "thence", "there", "thereafter", "thereby", "therefore", "therein", "thereupon", "these", "they", "thickv", "thin", "third", "this", "those", "though", "three", "through", "throughout", "thru", "thus", "to", "together", "too", "top", "toward", "towards", "twelve", "twenty", "two", "un", "under", "until", "up", "upon", "us", "very", "via", "was", "we", "well", "were", "what", "whatever", "when", "whence", "whenever", "where", "whereafter", "whereas", "whereby", "wherein", "whereupon", "wherever", "whether", "which", "while", "whither", "who", "whoever", "whole", "whom", "whose", "why", "will", "with", "within", "without", "would", "yet", "you", "your", "yours", "yourself", "yourselves", "the", "feel", "ain't", "em", "don't", "him", "her", "smart", "something", "go", "use", "doing", "important", "somebody", "him", "again", "got", "loud", "he's", "one", "i'm", "he", "boy", "I've", "well", "mind", "him", "passed", "ago", "long", "go", "try", "girl", "you're", "having", "make", "sure", "you", "You'd", "one", "year", "heard"]

class Piece < ActiveRecord::Base
  attr_accessible :orig_title, :orig_author, :orig_body, :title, :body, :user_id
  belongs_to :user

  def plagiarize

      orig_title_downcase = orig_title.downcase
      words = orig_title_downcase.split(/ /)
      plagiarized_words = []
      words.each do |w|
        if w != "[]"
          synonyms = Wordnik.word.get_related(w, :type => 'synonym')
          if synonyms.any? && !STOP_WORDS.include?(w) && synonyms.class == Array
            synonym = synonyms.first["words"].sample
            plagiarized_words << synonym
          else plagiarized_words << w
          end
        end
        plagiarized_title = plagiarized_words.join(" ")
        self.title = plagiarized_title
      end

      orig_body_downcase = orig_body
      words = orig_body_downcase.split(/ /)
      plagiarized_words = []
      words.each do |w|
        if w != "[]"
          synonyms = Wordnik.word.get_related(w, :type => 'synonym')
          if synonyms.any? && !STOP_WORDS.include?(w) && synonyms.class == Array
            synonym = synonyms.first["words"].sample
            plagiarized_words << synonym
          else plagiarized_words << w
          end
        end
        plagiarized_body = plagiarized_words.join(" ")
        self.body = plagiarized_body
      end
    end

  end
