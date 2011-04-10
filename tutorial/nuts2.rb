Camping.goes :Nuts

module Nuts::Models
    class Page < Base
        
    end

    class BasicFields < V 1.0
        def self.up
            create_table Page.table_name do |t|
                t.string :title
                t.text   :content
                # bununla created_at ve updated_at sütunları oluşur
                t.timestamps
            end
        end
        
        def self.down
            drop_table Page.table_name
        end
    end
end
  
def Nuts.create
    Nuts::Models.create_schema
end

module Nuts::Controllers
    class Pages
        def get
            # Sadece sayfa etiketlerini seç.
            @pages = Page.all(:select => "title")
            render :list
        end
    end

    class PageX
        def get(title)
            if @page = Page.find_by_title(title)
                render :view
            else
                redirect PageXEdit, title
            end
        end
        
        def post(title)
            # Eğer yoksa yenisini üret:
            @page = Page.find_or_initialize_by_title(title)
            # Süper! dimi? Bu şu satırla aynı:
            # @page = Page.find_by_title(title) || Page.new(:title => title)
            
            @page.content = @input.content
            @page.save
            redirect PageX, title
        end
    end
    
    class PageXEdit
        def get(title)
            @page = Page.find_or_initialize_by_title(title)
            render :edit
        end
    end
end

module Nuts::Views
    def list
        h1 "Tüm Sayfalar"
        ul do
            @pages.each do |page|
                li do
                    a page.title, :href => R(PageX, page.title)
                end
            end
        end
    end

    def view
        h1 @page.title
        self << @page.content
    end
    
    def edit
		h1 @page.title
		form :action => R(PageX, @page.title), :method => :post do
			textarea @page.content, :name => :content,
				:rows => 10, :cols => 50
			br
			input :type => :submit, :value => "Gönder!"
		end
    end
end
