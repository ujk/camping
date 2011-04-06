Camping.goes :Dnm

module Dnm::Controllers
    class Index < R '/'
        def get
            @time = Time.now
            render :sundial
        end
    end
end

module Dnm::Views
    def layout
        html do
            head do
                title {"Dene dene nereye kadar"}
            end
            body {self << yield}
        end
    end
    
    def sundial
        p "Şu anda zaman : #{@time.strftime('%H%M%S')}"
    end
end