module Developers::SharksHelper
  def shark_status_collection
    KeyValues::Shark::Status.id_options[0..-2]
  end
end
