# Manage Bashrc Aliases

# Setup
```
echo 'ruby $HOME/git/manage_bashrc_aliases/update_aliases.rb' >> ~/.bashrc
echo 'source $HOME/.aliases.sh' >> ~/.bashrc
touch ~/.aliases.yaml
```

# Configuration
* Configure paths within the script.

* Configure aliases within the config script.

the format is key: value, where key is the alias and value is the bash command to execute

# Example
if the bash alias is: alias shut='shutdown -h now'
you would add the following line to the aliases yaml file: shut: 'shutdown -h now'


# Limitations
* At the moment the script doesn't put double quotes around values. That may or may not be a problem.
* Don't add comments to the aliases yaml file, they will be wiped when you run the script. Pull request welcome to fix this!