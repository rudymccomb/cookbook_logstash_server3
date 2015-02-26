name 'cookbook_logstash_server3'
maintainer 'Rudy McComb'
maintainer_email 'Rudy McComb <rudy.mccomb@thnkbig.com>'
license 'All rights reserved'
description 'Installs/Configures cookbook_logstash_server3'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.0'

supports 'redhat'
supports 'ubuntu'

depends 'apt'
depends 'java'
depends 'nginx'
depends 'elasticsearch'
depends 'ark'
#depends 'kibana'
