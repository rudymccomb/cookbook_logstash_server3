name '_logstash_server3_rm'
maintainer ', Inc.'
maintainer_email 'Paul MacDougall <pmacdougall@newcontext.com>'
license 'All rights reserved'
description 'Installs/Configures _logstash_server3_rm'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.0'

supports 'redhat'
supports 'ubuntu'

depends 'apt'
depends 'java'
depends 'elasticsearch'
depends 'kibana'
