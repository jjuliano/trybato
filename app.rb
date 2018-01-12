# encoding: utf-8

require 'sinatra'
require 'bato/tagatala'

get '/' do
  erb :index
end

post '/' do
  $stdout = StringIO.new
  code = code_formatting(params[:code])
  eval Bato::Tagatala.new.sa_ruby(code)
  $stdout.string
end

private

  def code_formatting(code)
    code = code.gsub('`', '\'')
    code = 'puts \'wag mo gawin iyan! ikaw naman eh!\'' if code.include?('%x{')
    code
  end