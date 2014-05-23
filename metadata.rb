name             'rhn_channel'
maintainer       'Mariani Lucas'
maintainer_email 'marianilucas@gmail.com'
license          'Apache 2.0'
description      'Configures Red Hat network channels'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version IO.read(File.join(File.dirname(__FILE__), 'VERSION')) rescue "0.1.0"

recommends 'rhn'