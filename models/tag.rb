class Tag

  include DataMapper::Resource

  property :id,   Serial
  property :tname,  String

 has n, :links, :through => Resource

end
