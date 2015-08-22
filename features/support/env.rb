
require 'page-object'
require 'page-object/page_factory'
require 'random_data'
require 'clipboard'
require 'rspec/expectations'
require 'ap'
require 'logger'
require 'singleton'
require 'har'
require "net/http"
#require 'browsermob/proxy'
require 'watir-webdriver-performance'
require_relative '../../lib/util/har_parser'
require_relative '../../lib/util/utility_methods'



$: << File.dirname(__FILE__)+'/../../lib'
World PageObject::PageFactory
require 'pages.rb'
PageObject.javascript_framework = :jquery



