
include_recipe 'mywordpress::apache'

include_recipe 'mywordpress::php'

include_recipe 'mywordpress::database'

include_recipe 'mywordpress::app'
