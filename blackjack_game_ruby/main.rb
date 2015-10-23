require_relative './gambler.rb'
require_relative './player.rb'
require_relative './diler.rb'
require_relative './carts.rb'
require_relative './action.rb'

player    = Players.new
diler     = Diler.new
carts     = Carts.create_deck
action    = Action.new(player, diler, carts)

action.money_player   = 100
action.money_diler    = 100
action.money_bet      = 10
action.game_begin
