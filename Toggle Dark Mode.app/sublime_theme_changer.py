import re

pref_file_path = r"/Users/apple/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
theme_setting_to_change = r'"color_scheme":.*,'

def replace_file_text( file_path, pattern, replacement_text ):
	with open(file_path, "r+") as f:
		contents = f.read()
		contents_new = re.sub(pattern, replacement_text, contents)

		f.seek(0)
		f.write(contents_new)
		f.truncate()

def apply_prefered_dark_theme():
	replacement = r'"color_scheme": "Packages/Color Scheme - Default/Monokai.sublime-color-scheme",'
	replace_file_text( pref_file_path, theme_setting_to_change, replacement)

def apply_prefered_light_theme():
	replacement = r'"color_scheme": "Packages/Color Scheme - Default/Celeste.sublime-color-scheme",'
	replace_file_text( pref_file_path, theme_setting_to_change, replacement)