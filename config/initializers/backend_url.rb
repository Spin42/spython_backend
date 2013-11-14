if Rails.env == "production"
  ENV["BACKEND_URL"] = "http://spython.herokuapp.com/api"
else
  ENV["BACKEND_URL"] = "http://localhost:3000/api"
end