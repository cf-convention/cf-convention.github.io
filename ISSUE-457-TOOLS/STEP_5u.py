# -*- coding: utf-8 -*-

import re
from datetime import datetime, UTC
from pathlib import Path


MY_PATH = "../"
BASE_PATH = MY_PATH + "cf-conventions/cf-convention.github.io/Data/cf-standard-names/"


def prettify(line):
    fmt = {
        "<?xml ": (0, 2),
        "<standard_name_table>": (0, 1),
        "<version_number>": (2,1),
        "<conventions>": (2,1),
        "<first_published_date>": (2, 1),
        "<last_modified>": (2, 1),
        "<institution>": (2, 1),
        "<contact>": (2,3),
        "<entry id": (2, 1),
        "<canonical_units>": (4, 1),
        "<description>": (4, 1),
        "<amip>": (4, 1),
        "<grib>": (4, 1),
        "</entry>": (2, 2),
        "<alias id": (2, 1),
        "<entry_id": (4, 1),
        "</alias>": (2, 2),
        "</standard_name_table>": (0, 1),
    }
    line2 = line.strip()
    for k in fmt.keys():
        if k in line2:
            indent, newlines = fmt[k]
            pretty = ' '*indent + line2 + '\n'*newlines
            return pretty
    return line2

def cleanup(in_xml):
    in_xml = in_xml.replace("\n>", ">")
    return in_xml


def extract_header(in_xml):
    header = re.search(".+?(?=<entry id)", in_xml, re.S)
    header = header.group().split("\n")
    header = "\n".join([h.strip() for h in header])
    return header

def maybe_sorted(d):
    return d
    #return sorted(d)


def extract_entries(in_xml):
    tags = ["canonical_units", "description", "amip", "grib"]
    entry_dict = {}
    for entry in re.finditer(r'<entry id=\".+?\">.+?</entry>', in_xml, re.S):
        entry1 = entry.group()
        entry1 = entry1.split("\n")
        entry1 = "\n".join([t.strip() for t in entry1 if t])
        e = re.search(r'(?<=\").+?(?=\")', entry1)
        std_name = e.group()
        entry2 = f'<entry id="{std_name}">\n'
        for t in tags:
            payload = re.search(rf"(?<=\<{t}>).*?(?=</{t}>)", entry1, re.S)
            if payload:
                p = payload.group()
                if t == "description":
                    p = re.sub(" *\n *", " ", p, re.S)
                entry2 += f"<{t}>{p}</{t}>\n"
            elif t in ["canonical_units", "description"]:
                entry2 += f"<{t}></{t}>\n"
                print(f"ADDED: {std_name}  '{t}'")
        entry2 += "  </entry>\n\n"
        entry_dict[std_name] = entry2
    out_xml = "\n".join([entry_dict[k] for k in maybe_sorted(entry_dict)])
    return out_xml


def extract_aliases(in_xml):
    alias_dict = {}
    for alias in re.finditer(r'<alias id=.+?</alias>', in_xml, re.S):
        alias1 = alias.group()
        a = re.search(r'(?<=\").+?(?=\")', alias1)
        std_name = a.group()
        alias1 = "\n".join([a.strip() for a in alias1.split("\n") if a])
        alias_dict[std_name] = alias1
    out_xml = "\n".join([alias_dict[k] for k in maybe_sorted(alias_dict)])
    return out_xml


def do_the_work(version):
    xml_file = f"{BASE_PATH}{version}/src/cf-standard-name-table.xml"
    with open(xml_file, "r") as fh:
        in_xml = fh.read()
    print(xml_file[58:])

    in_xml = cleanup(in_xml)
    out_xml = extract_header(in_xml)
    out_xml += extract_entries(in_xml)
    out_xml += extract_aliases(in_xml)
    out_xml += "\n</standard_name_table>\n"
    out_xml = out_xml.split("\n")

    with open(xml_file, "w") as fh:
        for line in out_xml:
            fh.write(prettify(line))
    
    #for line in out_xml: # [:100]:
    #    #print(f"1§{line}§")
    #    print(prettify(line), end="")
    #raise RuntimeError

if __name__ == "__main__":
    for version in range(1, 100):
        try:
            if version != 38:
                print("\n")
                do_the_work(version)
        except:
            break
