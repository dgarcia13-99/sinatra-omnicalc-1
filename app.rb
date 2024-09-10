require "sinatra"
require "sinatra/reloader"

get("/") do
 erb(:square)
end

get("/square/new") do
  erb(:square)
end

get("/square/results") do
  @input_number= params.fetch("square_number").to_f
  @squared=@input_number ** 2.0
  erb(:square_results)
end

get("/square_root/new") do
  erb(:square_root)
end

get("/square_root/results") do
  @input_number= params.fetch("root_number").to_f
  @square_rooted=@input_number ** 0.5
  erb(:square_root_results)
end

get("/payment/new") do
  erb(:payment)
end

get("/payment/results") do
  @apr= params.fetch("apr_input").to_f
  @years= params.fetch("years_input").to_i
  @principal= params.fetch("principal_input").to_i
  r=(@apr/100)/12
  n=@years * 12
  numerator= r * @principal
  denominator= 1 - ((1 + r)**(-n))
  @payment= numerator / denominator
  erb(:payment_results)
end

get("/random/new") do
  erb(:random)
end

get("/random/results") do
  @min= params.fetch("min_input").to_f
  @max= params.fetch("max_input").to_f
  @random_number=rand(@min..@max)
  erb(:random_results)
end
