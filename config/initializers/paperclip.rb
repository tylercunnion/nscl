Paperclip::Attachment.interpolations[:year] = proc do |attachment, style|
  attachment.instance.year
end

Paperclip::Attachment.interpolations[:date] = proc do |attachment, style|
  attachment.instance.date
end

Paperclip::Attachment.interpolations[:pub_type] = proc do |attachment, style|
  attachment.instance.pub_type.gsub(' ', '_')
end

Paperclip.options[:image_magick_path] = APP_CONFIG['imagemagick_dir']