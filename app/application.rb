
class Application

  def call(env)

    @@items = []

    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      search = req.path.split("/items/").last
      if Item.all.find{|i| i.name == search}
        resp.write Item.all.find{|i| i.name == search}.price
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end

end
