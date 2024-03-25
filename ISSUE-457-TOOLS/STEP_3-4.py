# -*- coding: utf-8 -*-

import re
from datetime import datetime, UTC
from pathlib import Path


MY_PATH = "../"
BASE_PATH = MY_PATH + "cf-conventions/cf-convention.github.io/Data/cf-standard-names/"
NL = b"\n"


def find_duplicate_aliases(xml_raw):
    pat = (rb' +?<alias id=".+?</alias> *?\n')
    alias_dict = {}
    for found in re.finditer(pat, xml_raw, re.S):
        res = re.search(rb'(?<=").+?(?=">)', found.group())
        res = res.group()
        if res in alias_dict:
            alias_dict[res] += 1
        else:
            alias_dict[res] = 1
    for k in list(alias_dict):
        if alias_dict[k] == 1:
            _ = alias_dict.pop(k, 0)
    # _ = [print(f'     {k.decode("utf-8")}: {v}') for k,v in alias_dict.items()]
    return list(alias_dict.keys())


def fix_duplicate_aliases(xml_raw, std_name):
    pat = (rb' +?<alias id="' + std_name + rb'".+?</alias> *?\n')
    result = [r for r in re.finditer(pat, xml_raw, re.S)]
    if len(result) > 1:
        collected_entries = []
        for k, r in enumerate(result):
            lines = r.group().splitlines()
            for s in lines:
                if b"<entry_id>" in s and s not in collected_entries:
                    collected_entries.append(s)
        new_alias = []
        for line in result[0].group().splitlines():
            if b"entry_id" in line:
                new_alias.extend(collected_entries)
            elif line:
                new_alias.append(line)
        _ = [print(f'   {line.decode("utf-8")}') for line in new_alias]
        result_0 = NL.join(new_alias)
        for r in reversed(result[1:]):
            span = r.span()
            xml_raw = xml_raw[: span[0]] + xml_raw[span[1]: ]
        span = result[0].span()
        xml_raw = xml_raw[: span[0]] + NL + NL.join(new_alias) + NL + xml_raw[span[1]: ]
    else:
        xml_raw = ""
    return xml_raw


def add_conventions(xml_raw):
    pat = rb"\n +?<version_number>\d+?</version_number>"
    old_elem = re.search(pat, xml_raw)
    old_elem = old_elem.group()
    version = re.search(rb"\d{1,3}", old_elem)
    version = version.group()
    new_elem = old_elem + b"\n  <conventions>CF-StandardNameTable-" + version + b"</conventions>"
    xml_raw = xml_raw.replace(old_elem, new_elem)
    return xml_raw


def update_last_modified(xml_raw):
    time_stamp = datetime.now(UTC).strftime("%Y-%m-%dT%H:%M:%SZ").encode("utf-8")
    pat = rb"<last_modified>.+?Z</last_modified>"
    new = rb"<last_modified>" + time_stamp + rb"</last_modified>"
    xml_raw = re.sub(pat, new, xml_raw)
    return xml_raw


def do_the_work(version):
    xml_file = f"{BASE_PATH}{version}/src/cf-standard-name-table.xml"
    with open(xml_file, "rb") as fh:
        xml_raw = fh.read()
    print(f"..../{xml_file[58:]}")

    duplicate_aliases = find_duplicate_aliases(xml_raw)
    for std_name in duplicate_aliases:
        result = fix_duplicate_aliases(xml_raw, std_name)
        if result:
            xml_raw = result
        else:
            print("    No change")

    xml_raw = add_conventions(xml_raw)

    xml_raw = update_last_modified(xml_raw)
    with open(xml_file, "wb") as fh:
        fh.write(xml_raw)
    

if __name__ == "__main__":
    # update_schema()
    for version in range(1, 100):
        try:
            if version != 38:
                print("\n")
                do_the_work(version)
        except:
            break
