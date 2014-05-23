[![Build Status](https://travis-ci.org/psyreactor/rhn_channel-cookbook.svg?branch=master)](https://travis-ci.org/psyreactor/rhn_channel-cookbook)

rhn_channel Cookbook
===============

This cookbook register red hat network channels on rhel.

Recomend
------------
#### Cookbooks:

- rhn - https://github.com/bflad/chef-rhn


The following platforms and versions are tested and supported using Opscode's test-kitchen.

- Red Hat >= 6.3

Recipes
-------

#### rhn_channel::default
Add repository from red hat network.

Attributes
----------
#### rhn_channel::default
#####Basic Config
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>node[:rhn_channel][:username]</tt></td>
    <td>String</td>
    <td>User for red hat network</td>
    <td><tt>user</tt></td>
  </tr>
  <tr>
    <td><tt>node[:rhn_channel][:password]</tt></td>
    <td>String</td>
    <td>Password for user of red hat network</td>
    <td><tt>password</tt></td>
  </tr>
  <tr>
    <td><tt>node[:rhn_channel][:channels]</tt></td>
    <td>array</td>
    <td>repository to add</td>
    <td><tt>rhel-x86_64-rhev-agent-6-server rhel-x86_64-server-optional-6 rhel-x86_64-server-supplementary-6 rhel-x86_64-server-optional-fastrack-6</tt></td>
  </tr>
</table>

##Atention
*** Is set node[:rhn][:username] and node[:rhn][:password] the cookbook use this settinga and dont use node[:rhn_channel][:username] and node[:rhn_channel][:password]***

Usage
-----
#### icinga::default
Just include `icinga` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[rhn_channeñl]"
  ]
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

[More details](https://github.com/psyreactor/glpi-cookbook/blob/master/CONTRIBUTING.md)

License and Authors
-------------------
Authors:
Lucas Mariani (Psyreactor)
- [Gmail](mailto:marianiluca@gmail.com)
- [Github](https://github.com/psyreactor)
