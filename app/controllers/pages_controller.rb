# frozen_string_literal: true

class PagesController < ApplicationController
  def extrait_impr
    @page = Page.find_by_slug('extrait_impr')
    render template: 'pages/extrait_impr', layout: false
  end

  def show
    banned = %w[approche bibliographie ateliers groupes coordonnees]
    if banned.include? params[:id]
      render template: 'pages/maintenance'
      return
    end

    @page = Page.find_by_slug(params[:id])
    @seo_image = @page.seo_image if @page.seo_image.present?
    @seo_description = @page.seo_description if @page.seo_description.present?
    @seo_title = @page_title = @page.title
    record_not_found if @page.blank?

    #  "Biographie",
    #  "Totalement human, totalement divin",
    #  "Approche",
    #  "Extrait Impr",
    #  "Téléchargement des méditations ",
    #  "Admin storage des méditations",
    #  "Page personnelle de Lorraine",
    #  "Méditations",
    #  "broken - touchez pas",
    #  "Méditations Lecture du Guide 20-21",
    #  "Conférence Vivre Éveillé et Lâcher Prise 16 octobre 2020",
    #  "Méditations VIVRE ÉVEILLÉ",
    #  "Lâcher Prise 2020 Belgique",
    #  "TEST PAGE",
    #  "Lâcher Prise le 9 Janvier 2021 Belgique",
    #  "Lâcher Prise fèvrier 2021",
    #  "LÂCHER PRISE BONUS 2021",
    #  "Draft",
    #  "RETRAITE VIVRE ÉVEILLÉ 2021",
    #  "MÉDITATIONS  HEBDOMADAIRES VIVRE ÉVEILLÉ ",
    #  "MÉDITATIONS-LECTURE-DU-GUIDE-2021_2022",
    #  "RETRAITE VIVRE ÉVEILLÉ 2022",
    #  "GROUPE VIVRE ÉVEILLÉ 2022",
    #  "MÉDITATIONS LECTURE DU GUIDE 2022-2023",
    #  "Zoom Belgique octobre 2022",
    #  "CONFÉRENCE sur LE CHEMIN DU HÉROS, LE CHEMIN DU COEUR novembre 2022",
    #  "RETRAITE VIVRE ÉVEILLÉ 2023",
    #  "MÉDITATIONS  LECTURES DU GUIDE 2023-2024",
    #  "Oser dire NON pour se dire OUI",
    #  "Oser dire NON pour se dire OUI!",
    #  "Infolettre vidéo du 7 février 2024 ",
    #  "Infolettre vidéo du 28 février 2024",
    #  "Infolettre vidéo du 13 mars 2024",
    #  "JE LAISSE MON CORPS SE LIBÉRER ET MON COEUR S'OUVRIR",
    #  "JE PRENDS LE RISQUE DE SORTIR DE MES LIMITES",
    #  "JOURNÉES D'APPROFONDISSEMENT",
    #  "MÉDITATIONS LECTURE DU GUIDE 2024-2025"]
  end

  def index
    render template: 'pages/index', layout: false
  end
end
