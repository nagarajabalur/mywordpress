name              'mywordpress'
maintainer        'reancloud'
maintainer_email  'nagaraj.as@reancloud.com'
license           'all rights reserved'
description       'install wordpress'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '1.0.0'
source_url        'https://github.com/nagarajabalur/mywordpress.git'
issues_url        'https://github.com/nagarajabalur/mywordpress.git'
supports          'centos'
depends 		  'database', '>= 1.6.0'
depends           'mysql', '>= 6.0'
depends           'mysql2_chef_gem', '~> 1.0.1'


