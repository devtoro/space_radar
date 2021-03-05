# frozen_string_literal: true

module SpaceRadar
  # Defines a Radar object that will search for space invader. Inherits from board
  # noise_threshold defines the tollerance for inncorrect matches for evey scan itteration
  # found invaders is a counter
  class Radar < Board
    attr_reader :noise_threshold, :found_invaders

    # Default noise_threshold is set to 1
    def initialize(input, noise_threshold: 1)
      super
      @noise_threshold = noise_threshold
      @found_invaders = 0
    end
  end
end