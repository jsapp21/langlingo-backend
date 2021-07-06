class WordsController < ApplicationController

    #### word of the day ####
    def show
        word = Word.find(params[:id])
        # iso = [ 'es', 'fr', 'de', 'pt', 'ru', 'th', 'vi']

        # project_id = ENV['GOOGLE_PROJECT_ID']
        # text = word.name
        # language_code = iso.sample

        # translate   = Google::Cloud::Translate.translation_v2_service project_id: project_id
        # translation = translate.translate text, to: language_code

        render json: { word: word.name } 

        # render json: { text: text,  translate: translation.text.inspect, language: language_code }
    end

    def create
        project_id = ENV['GOOGLE_PROJECT_ID']
        text = params[:text]
        language_code = params[:language]
            
        translate   = Google::Cloud::Translate.translation_v2_service project_id: project_id
        translation = translate.translate text, to: language_code

        render json: { text: text,  translate: translation.text.inspect, language: language_code }
    end



    def text_to_speech
        client = Google::Cloud::TextToSpeech.text_to_speech
        
        input_text = { text: params[:text] }

        one = params[:voice]
        dash = '-'
        two = params[:voice].upcase
        code = one + dash + two
       
        voice = {
            language_code: code,
            ssml_gender:   "MALE"
          }
        
        audio_config = { audio_encoding: "MP3" }

        response = client.synthesize_speech(
            input:        input_text,
            voice:        voice,
            audio_config: audio_config
          )
        

        save_path = Rails.root.join("public/testfile.mp3")
        
        File.open save_path, "wb" do |file|
            file.write response.audio_content
        end

        send_file save_path, :type => 'audio/mp3'
    end

end
