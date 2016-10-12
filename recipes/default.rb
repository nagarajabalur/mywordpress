
# recipe to install apache2
include_recipe 'mywordpress::apache'

# recipe to install mysql
include_recipe 'mywordpress::database'

# recipe to install php
include_recipe 'mywordpress::php'

# recipe to install wordpress app
include_recipe 'mywordpress::app'
