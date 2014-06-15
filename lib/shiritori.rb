require "shiritori/version"
require "shiritori/search_method"
require "shiritori/error"
require 'shiritori/view'
require 'shiritori/convert'
require "shiritori/shiritori"

module Shiritori
  def self.env
    :production
  end
end