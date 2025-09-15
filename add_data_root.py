
import os, sys, json

infile = sys.argv[1]
data_root = sys.argv[2]

data = json.load(open(infile, "r"))
print(data)

data["data-root"] = data_root

print(data)

outfile = infile
# outfile = os.path.basename(infile) # for test
print(outfile)
with open(outfile, "w", encoding="utf-8") as f:
    json.dump(data, f, indent=2, ensure_ascii=False)

