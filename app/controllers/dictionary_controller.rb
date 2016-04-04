class DictionaryController < ApplicationController

  def index
    if params[:word]
      word = params[:word].downcase.gsub(/[^a-z]/i,"")
      if @definitions = Search.definitions(word)
        BulkDictionary.populate(word, @definitions)
      else
        flash[:alert] = "No matches found"
        render status: :not_found
      end
    end
  end

end
