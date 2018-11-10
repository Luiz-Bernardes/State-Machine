module DocumentStateMachine
  extend ActiveSupport::Concern

  included do
    include AASM

    aasm column: 'state' do
      state :unverified, initial: true
      state :verified
      state :rejected
      state :published
      state :archived

      event :verify do
        transitions from: [:unverified], to: :verified
      end

      event :reject do
        transitions from: [:unverified], to: :rejected
      end

      event :reverify do
        transitions from: [:verified], to: :unverified
      end

      event :publish do
        transitions from: [:verified], to: :published
      end

      event :unpublish do
        transitions from: [:published], to: :verified
      end

      event :archive do
        transitions from: [:published, :verified, :unverified], to: :archived
      end
    end

    
  end


end
