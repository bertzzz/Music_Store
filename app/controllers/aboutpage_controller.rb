# frozen_string_literal: true

class AboutpageController < ApplicationController
  def index
    @about = AboutPage.first
  end
end
