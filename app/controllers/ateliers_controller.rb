# frozen_string_literal: true

# These are workshops
class AteliersController < ApplicationController
  before_action :french

  def index
    @seo_description = 'Horaire Des Ateliers par Lorraine Desmarais'
    @items = Atelier.published.all
    @seo_title = 'Ateliers'
  end

  def show
    @item = Atelier.published.find(params[:id])
    @seo_title = @page_title = @item.title
  end
end
