// Connect to MongoDB
conn = new Mongo();
// Create a database instance
db = conn.getDB("appdb");

db.apps.insertMany([
{"AppName":"Mat Lam Tam","FileName":"ElementumPellentesqueQuisque.mp3","Sha1":"b3a51cecd0187e8575e762c65bd058ae6b4386f1"},
{"AppName":"Tresom","FileName":"LiberoNonMattis.mp3","Sha1":"8c679f8aed2700f5c01e86a7fa94a3984fa2758a"},
{"AppName":"It","FileName":"Aliquam.txt","Sha1":"55c2a6e0bed1d3165f9538ef413c262d35a9ce21"},
{"AppName":"Stringtough","FileName":"CumSociisNatoque.gif","Sha1":"f655ce0eb4edf875b39045a56d71a7fd972c86ba"},
{"AppName":"Konklux","FileName":"SapienVarius.mp3","Sha1":"7475c403d77dfd7f34938951d09f20c6a80c2655"},
{"AppName":"Tin","FileName":"AtTurpisA.tiff","Sha1":"9e161975c44eebe78cd891a421cf123326b3bcee"},
{"AppName":"Solarbreeze","FileName":"PellentesqueUltricesPhasellus.xls","Sha1":"09f998d8a26b54250dab75afe0022e2928facf85"},
{"AppName":"Stronghold","FileName":"DictumstMorbiVestibulum.ppt","Sha1":"92fb957f605e31bc9e5bf2ced6eee123f9a9374e"},
{"AppName":"Aerified","FileName":"DuisBibendumFelis.tiff","Sha1":"d29b6bc34135da382c11c12f86903dcc3dd5d126"},
{"AppName":"Subin","FileName":"OdioElementum.mov","Sha1":"e2e4eee7cc642a41186e6de9ed75dda11f886d25"}
])