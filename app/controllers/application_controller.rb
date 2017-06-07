require 'sinatra/base'
require_relative '../models/hero.rb'
require_relative'../models/team.rb'


class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    post '/teams' do
      @team = Team.new(params[:team])
      #binding.pry
      #binding.pry
      params[:team][:members].each do |member_params|
        Hero.new(member_params)
      end
      @heros = Hero.all
      erb :team
    end

end
