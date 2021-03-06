# frozen_string_literal: true

require_relative 'player'
require_relative 'hand'
require_relative 'user'
require_relative 'dealer'
require_relative 'interface'
require_relative 'deck'
require_relative 'card'
require_relative 'controller'
require_relative 'bank'

interface = Interface.new
interface.run
