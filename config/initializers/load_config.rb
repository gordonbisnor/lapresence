# encoding: utf-8

APP_CONFIG = YAML.load_file("#{Rails.root}/config/settings.yml", aliases: true)[Rails.env].symbolize_keys

NAVIGATION = [
 	["Lorraine Desmarais", "bio"],
	["Son Approche", "approche"],
	["Bibliographie", "bibliographie"],
	["Les Ateliers", "ateliers"],
	["Les Groupes", "groupes"],
	["Méditations", "meditations"],
	["Coordonnées", "coordonnees"]
]

TINY_MCE_OPTIONS = {
                             :theme => 'advanced',
                             :theme_advanced_resizing => true,
                             :theme_advanced_resize_horizontal => false,
                             :plugins => %w{ table fullscreen paste},
                           	 :paste_create_paragraphs => false,
                             :paste_create_linebreaks => false,
                             :paste_use_dialog =>  true,
                             :paste_auto_cleanup_on_paste =>  true,
                             :paste_convert_middot_lists  => false,
                             :paste_unindented_list_class  => "unindentedList",
                             :paste_convert_headers_to_strong => true,
                             :theme_advanced_buttons3_add => %w{ pastetext,pasteword,selectall,fullscreen, advimage }
                             
                           }