class CategoriesController < ApplicationController

    def show
        category = Category.find(params[:id])
        
        shuffWordArr = category.words.shuffle
        slicedWordArr = shuffWordArr[0..5] 
        
        imgArr = slicedWordArr.map do |obj|
            category.images.select { |i| i.id == obj.id }
        end.flatten
        
        mergedArr = imgArr + slicedWordArr
        finalArr = mergedArr.shuffle 


        ########### TRANSLATION API START ###########
        project_id = ENV['GOOGLE_PROJECT_ID']
        language_code = params[:language]

        translatedArr = finalArr.map do |obj|
            
            if obj[:name] 
                translate   = Google::Cloud::Translate.translation_v2_service project_id: project_id
                translation = translate.translate obj[:name], to: language_code

                obj.name = obj[:name] = translation.text
                obj
            else 
                 obj
            end
            
        end
        ########### TRANSLATION API END ###########

        render json: translatedArr
    end
    
end
