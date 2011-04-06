
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

