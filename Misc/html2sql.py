import os
import re

p = re.compile(r"<b>([^<]*)</b> \(([^(]*)\)<br>([0-9]*)")

for path, _, fns in os.walk('files'):
    for fn in fns:
        with open(os.path.join(path, fn)) as file:
            txt = file.read()

        for disc, codigo, ano in p.findall(txt):
            print(f"INSERT INTO `Disciplina`(`nome`, `serie`, `curso_id`, `codigo`) VALUES ('{disc}', {ano}, 4, '{codigo}');")
