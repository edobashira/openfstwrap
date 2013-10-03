
all: stdvectorfst.cc logvectorfst.cc StdVectorFst.cs LogVectorFst.cs

stdvectorfst.cc:
	mustache std.yml vectorfst.cc.tpl > stdvectorfst.cc

logvectorfst.cc:
	mustache log.yml vectorfst.cc.tpl > logvectorfst.cc

StdVectorFst.cs:
	mustache std.yml VectorFst.cs.tpl > StdVectorFst.cs

LogVectorFst.cs:
	mustache log.yml VectorFst.cs.tpl > LogVectorFst.cs

clean:
	rm -rf stdvectorfst.cc logvectorfst.cc StdVectorFst.cs LogVectorFst.cs
