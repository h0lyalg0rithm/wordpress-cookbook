Wordpress Cookbook
==================
This cookbook installs and sets up the database for wordpress on the apache2 server


Requirements
------------
#### packages
- `apache2` - apache2 server cookbok
- `mysql` - mysql cookbook
- `php` - PHP version 5 and above
- `database` - Database cookbook

Attributes
----------
#### wordpress::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['wordpress']['path']</tt></td>
    <td>String</td>
    <td>Location to install wordpress</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['wordpress']['database']</tt></td>
    <td>String</td>
    <td>Database Wordpress should use</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### wordpress::default

e.g.
Just include `wordpress` in your node's `run_list`:

``json
{
  "name":"my_node",
  "run_list": [
    "recipe[wordpress]"
  ]
}
``

License and Authors
-------------------
Authors: [Suraj Shirvankar](http://surajms.com)
