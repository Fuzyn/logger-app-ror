class LogWorkerJob < ApplicationJob
  queue_as :default

  def perform(message)
    Log.create!(message: message)
  end
end
