module Admin
  class PagesController < Fae::BaseController
    before_action :set_page, only: [:edit]

    def new
      @item = Fae::StaticPage.new
    end

    def create
      unless page_already_exists?
        Rails::Generators.invoke("fae:page", generator_params)
        if page_created?
          @item = fae_page_klass.instance
          @item.main_content = Fae::TextArea.new(content: pages_params[:main_content])
          @item.subfield_1 = Fae::TextArea.new(content: pages_params[:subfield_1]) unless pages_params[:subfield_1].nil?
          @item.subfield_2 = Fae::TextArea.new(content: pages_params[:subfield_2]) unless pages_params[:subfield_2].nil?
          @item.subfield_3 = Fae::TextArea.new(content: pages_params[:subfield_3]) unless pages_params[:subfield_3].nil?
          @item.meridian_template = page_model_params["template"]
          @item.page_class_name = page_model_params["title"].titleize.delete(' ')
          @item.slug = @item.page_class_name.underscore

          if @item.save
            @item.update_attributes(page_model_params)
            flash[:info] = "The page was successfully created."
            redirect_to fae.edit_content_block_path(@item.slug)
          else
            flash[:info] = role.errors.full_messages.first
            redirect_to new_admin_page_path
          end
        end
      else
        flash[:info] = "Please choose a different title."
        redirect_to new_admin_page_path
      end
    end

    def destroy
      if @item.present?
        File.delete Rails.root.join('app','models', "#{@item.page_class_name.underscore}_page.rb").to_s
        File.delete Rails.root.join('app','views', 'admin', 'content_blocks',"#{@item.page_class_name.underscore}.html.slim").to_s
        @item.delete
      end
      redirect_to admin_pages_path
    end

    private

    def pages_params
      params.require(:static_page).permit(:title, :organizations, :main_content, :subfield_1, :subfield_2, :subfield_3)
    end

    def page_model_params
      params.require(:static_page).permit(:title, :organizations, :template, :slug)
    end

    def set_class_variables(class_name = 'Pages')
      klass_base = params[:controller].split('/').last
      @klass_name = class_name || klass_base               # used in form views
      @klass = "Fae::StaticPage".constantize             # used as class reference in this controller
      @klass_singular = klass_base.singularize             # used in index views
      @klass_humanized = klass_base.singularize.humanize  # used in index views
      @index_path = '/' + params[:controller]              # used in form_header and form_buttons partials
      @new_path = @index_path + '/new'                     # used in index_header partial
    end 

    def fae_page_klass_generator_name
      page_model_params[:title].titleize.delete(' ')
    end

    def fae_page_klass
      fae_page_klass_name.constantize
    end 

    def fae_page_klass_name
      "#{page_model_params[:title].titleize.delete(' ').classify}Page"
    end

    def generator_params
      params_array = [fae_page_klass_generator_name]
      params_array << "main_content:text"
      params_array << "subfield_1:text"
      params_array << "subfield_2:text"
      params_array << "subfield_3:text"
    end

    def page_already_exists?
      File.exist? Rails.root.join('app','models', "#{fae_page_klass_name.underscore}.rb").to_s
    end

    def page_created?
      page_already_exists?
    end
  end
end