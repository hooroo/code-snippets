module FlashHelper
  def flash_messages
    flash.to_hash.slice("alert", "error", "notice", "success")
  end
end
