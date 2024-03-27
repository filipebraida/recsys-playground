module Recsys

using Downloads
using BinDeps
using CSV
using DataFrames

const defdir = joinpath(dirname(@__FILE__), "..", "datasets")

function getmovielensdata(dir)
   	mkpath(dir)
   	path = Downloads.download("http://files.grouplens.org/datasets/movielens/ml-100k.zip")
   	run(unpack_cmd(path, dir, ".zip", ""))
end


function MovieLens()
    filename = "$(defdir)/ml-100k/u.data"

   	isfile(filename) || getmovielensdata(defdir)

    
   	file = CSV.read(filename, DataFrame, delim = '\t',
            header = [:user, :item, :rating, :timestamp],
            types = [Int, Int, Int, Int])

end


end # module Recsys
