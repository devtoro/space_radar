# frozen_string_literal: true

module SpaceRadar
  # Defines a standard space invader
  class SpaceInvader
    attr_reader :size, :invader

    ACCEPTABLE_TYPE = 'text/plain'

    # Expects input to be a txt file or a path to a txt file
    def initialize(input)
      raise ArgumentError, 'Input should be a file or a path to a file' unless input.is_a?(File) || input.is_a?(String)

      @invader = parse_input(input)
      rows_lengths = @invader.map(&:length).uniq

      raise 'Invader is not symetrical' unless rows_lengths.count.equal? 1

      @size = "#{rows_lengths.first}x#{@invader.count}"
    end

    def show
      @invader.each { |row| puts row }
      self
    end

    private

    def parse_input(input)
      file = File.open input
      check_file_type(file)
      invader = File.readlines(file)

      invader.map(&:chomp)
    rescue Errno::ENOENT
      raise 'File not found'
    end

    def check_file_type(file)
      path = file.path
      mime_type = IO.popen(['file', '--brief', '--mime-type', path], &:read).chomp

      raise ArgumentError, "File should be of type #{ACCEPTABLE_TYPE}" unless mime_type.eq? ACCEPTABLE_TYPE
    end
  end
end
