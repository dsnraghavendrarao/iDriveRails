FactoryBot.define do
    factory :create_user, class: User do 
        first_name {"tester"} 
        last_name {"test"}
        email {"tester@mailinator.com"}
        password {"12345678"}
        password_confirmation {"12345678"}
    end
    factory :user_with_out_first_name, class: User do 
        last_name {"test"}
        email {"tester@mailinator.com"}
        password {"12345678"}
        password_confirmation {"12345678"}
    end
end