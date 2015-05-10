module PublicActivity
  # Handles creation of Activities upon destruction and update of tracked model.
  module Update
    extend ActiveSupport::Concern

    included do
      after_update :activity_on_update
    end

    private

    # Creates activity upon modification of the tracked model
    def activity_on_update
      create_activity(:update) if (self.respond_to?(:changed?) && self.changed?) || (!self.respond_to?(:changed?))
    end
  end
end
