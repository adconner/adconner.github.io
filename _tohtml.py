import subprocess
import json

cv = subprocess.check_output('yq . _data/cv.yml', shell=True)
cv = eval(cv)
def to_html(cur):
    if isinstance(cur, str):
        res = subprocess.check_output('pandoc --wrap none -f latex -t html', shell=True, input=cur.encode()).decode()
        res = res.strip().removeprefix('<p>').removesuffix('</p>')
        return res
    if isinstance(cur, list):
        return [to_html(e) for e in cur]
    if isinstance(cur, dict):
        return { k : to_html(v) for k,v in cur.items() }
    return cur

print(json.dumps(to_html(cv),indent=4))
