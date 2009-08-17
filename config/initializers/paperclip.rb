Paperclip.interpolates :year do |attachment, style|
  attachment.instance.year
end

Paperclip.interpolates :date do |attachment, style|
  attachment.instance.date
end

Paperclip.interpolates :pub_type do |attachment, style|
  attachment.instance.pub_type.gsub(' ', '_')
end