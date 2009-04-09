class SpamFilter
  
  require 'classifier'
  require 'madeleine'
  
  def initialize
    @m = SnapshotMadeleine.new("bayes_data") {
      Classifier::Bayes.new 'Spam', 'Legit'
    }
  end
  
  def train_spam(spam)
    spam = spam.values.join(" ") if spam.class == Hash
    @m.system.train_spam spam
    @m.take_snapshot
  end
  
  def train_legit(legit)
    legit = legit.values.join(" ") if legit.class == Hash
    @m.system.train_legit legit
    @m.take_snapshot
  end
  
  def is_legit?(subject)
    subject = subject.values.join(" ") if subject.class == Hash
    return case @m.system.classify subject
    when "Legit":
      true
    when "Spam":
      false
    end
  end
  
end