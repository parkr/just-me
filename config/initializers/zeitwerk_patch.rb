# Zeitwerk calls `thing.config.eager_load_paths` for all
# eager_load_namespaces. This includes I18n. Unfortunately, it explodes:
#
# NoMethodError: undefined method `eager_load_paths' for #<I18n::Config:0x00007f9c751ffdd8>
class I18n::Config
  def eager_load_paths
  end
end
