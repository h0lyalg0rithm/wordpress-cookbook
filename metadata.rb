name             'wordpress'
maintainer       'Suraj Shirvankar'
maintainer_email 'surajshirvankar@gmail.com'
license          'All rights reserved'
description      'Installs/Configures wordpress'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "apache2"
depends "mysql"
depends "php"
depends "database"
