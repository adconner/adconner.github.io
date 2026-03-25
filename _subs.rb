require 'liquid'
require 'yaml'

cv = YAML.load_file('_cv.yml')

template = Liquid::Template.parse($stdin.read)
$stdout.write((template.render(cv)))
