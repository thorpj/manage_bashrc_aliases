# Manage Bashrc Aliases

# Setup
```
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


# Notes
* Most of the time you won't even need to put single or double quotes around your values in the yaml file. Check yaml syntax to find out where you need to
* Don't add comments to the aliases yaml file, they will be wiped when you run the script. Pull request welcome to fix this!