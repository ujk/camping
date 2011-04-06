Camping.goes :Nuts

module Nuts::Controllers
    class Index2 < R '/'
        def get
            @time = Time.now
            render :sundial
        end
    end
    # localhost:3301/welcome/yo/my/site adresi
    class Words < R '/welcome/to/my/site'
        def get
            "You got here by: /welcome/to/my/site"
        end
    end
    
    # localhost:3301/nuts/1 veya nuts/234 vs. sayı metoda parametre oluyor
    class Digits < R '/nuts2/(\d+)'
        def get(number)
            "You got here by: /nuts/#{number}"
        end
    end

    # slash ( / ) içermeyen herşeyi seçmek
    class Segment < R '/gorp2/([^/]+)'
        def get(everything_else_than_a_slash)
            "You got here by: /gorp/#{everything_else_than_a_slash}"
        end
    end
    
    # bir sayı arkasından herşey (localhost:3301/5/hasan gibi)
    class DigitsAndEverything < R '/nuts/(\d+)/([^/]+)'
        def get(number, everything)
            "You got here by: /nuts2/#{number}/#{everything}"
        end
    end

    class Index
        def get
           "Buraya '/' ile geldiniz."
        end
    end
    
    class WelcomeToMyPage
        def get
            "Buraya '/welcome/to/my/page' ile geldiniz."
        end
    end
    
    class NutsN
        def get(number)
            "Buraya '/nuts/#{number}' ile geldiniz."
        end
    end
    
    class GorpX
        def get(everything_else_than_a_slash)
            "Buraya '/gorp/#{everything_else_than_a_slash}' ile geldiniz."
        end
    end
    
    class NutsNX
        def get(number, everything)
            "Buraya '/nuts/#{number}/#{everything}' ile geldiniz."
        end
    end
end


module Nuts::Views
    def layout
        html do
            head do
                title { "Nuts And GORP" }
            end
            body { self << yield }
        end
    end

    def sundial
        p "The current time is: #{@time.strftime('%H:%M:%S')}"
    end
end
