class LanguageController < ApplicationController
    def persian
        I18n.locale = 'fa'
        redirect_to(:controller => 'home', :action => 'index')
    end
    def english
        I18n.locale = 'en'
        redirect_to(:controller => 'home', :action => 'index')
    end

end
