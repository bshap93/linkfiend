require './config/environments'
require_all './app'

use Rack::Static, :urls => ['/css'], :root => 'public'

use Rack::MethodOverride
use ListsController
use BookmarksController
run ApplicationController
