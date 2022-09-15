class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  #users
  get "/users" do
    users=User.all
    users.to_json
  end
  post "/users" do
    users= User.create(
      name: params[:name],
    )
    users.to_json
  end

  #quotes
  get "/quotes" do
    quotes=Quote.all
    quotes.to_json(include: :comments, include: :users)
  end

  post "/quotes" do
    quotes = Quote.create(
      content: params[:content],
      author: params[:author],
    )
    quotes.to_json
  end



  #comments
  get "/comments" do
    comments= Comment.all
    comments.to_json
   end
 
    post "/comments" do
      comments = Comment.create(
       comment: params[:comment],
       like: params[:like]
     )
     comments.to_json
   end
 
   patch "/comments/:id" do
     comment= Comment.find(params[:id])
     comment.update(
       body: params[:body]
     )
     comment.to_json
   end
 
   delete "/comments/:id" do
     comment = Comment.find(params[:id])
     comment.destroy
     comment.to_json
   end

end
