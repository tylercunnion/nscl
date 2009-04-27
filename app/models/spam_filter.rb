class SpamFilter
  
  require 'classifier'
  require 'madeleine'
  
  def initialize
    @m = SnapshotMadeleine.new("bayes_data") {
      Classifier::Bayes.new :categories => ['Spam', 'Legit']
    }
  end
  
  def stringify(subject)
    if subject.respond_to?('gsub')
      return subject
    elsif subject.respond_to?('values')
      return stringify(subject.values)
    elsif subject.respond_to?('join')
      return subject.join(" ")
    else
      raise ArgumentError
    end
  end
  
  def train_spam(spam)
    spam = stringify(spam)
    @m.system.train_spam spam
    @m.take_snapshot
  end
  
  def train_legit(legit)
    legit = stringify(legit)
    @m.system.train_legit legit
    @m.take_snapshot
  end
  
  def is_legit?(subject)
    subject = stringify(subject)
    return case @m.system.classify subject
    when "Legit":
      true
    when "Spam":
      false
    end
  end
  
end