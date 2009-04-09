class SpamFilter
  
  require 'classifier'
  require 'madeleine'
  
  def initialize
    @m = SnapshotMadeleine.new("bayes_data") {
      Classifier::Bayes.new 'Spam', 'Legit'
    }
  end
  
  def train_spam(spamhash)
    @m.system.train_spam spamhash.values.join(" ")
    @m.take_snapshot
  end
  
  def train_legit(legithash)
    @m.system.train_legit legithash.values.join(" ")
    @m.take_snapshot
  end
  
  def is_legit?(hash)
    return case @m.system.classify hash.values.join(" ")
    when "Legit":
      true
    when "Spam":
      false
    end
  end
  
end