# encoding: utf-8

APP_CONFIG = YAML.load_file("#{Rails.root}/config/settings.yml")[Rails.env].symbolize_keys

NAVIGATION = [
 	["Lorraine Desmarais", "bio"],
	["Son Approche", "approche"],
	["Bibliographie", "bibliographie"],
	["Les Ateliers", "ateliers"],
	["Les Groupes", "groupes"],
	["Formation", "http://www.coeurenergetique.ca/formation"],
	["Coordonnées", "coordonnees"]
]
