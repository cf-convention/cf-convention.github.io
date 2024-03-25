# -*- coding: <encoding name> -*-

import re
from datetime import datetime, UTC
from pathlib import Path

MY_PATH = "../"
BASE_PATH = MY_PATH + "cf-conventions/cf-convention.github.io/Data/cf-standard-names/"
# NEW_XSD = b"../../schema-files/cf-standard-name-table-2.0.xsd"
NEW_XSD = (b"https://raw.githubusercontent.com/larsbarring/cf-convention.github.io/"
           b"test-all-issue-457/Data/schema-files/cf-standard-name-table-2.0.xsd")

def fix_v1_datetime(xml_raw):
    txt1 = b">1</version_number>\n"
    txt2 = txt1 + b"  <last_modified>2002-04-02T12:00:00Z</last_modified>\n"
    xml_raw = xml_raw.replace(txt1, txt2)
    print("ADDED    :  DATETIME in version 1")
    return xml_raw


def fix_v71_datetime(xml_raw):
    if b"2020-02-04T12:00Z" in xml_raw:
        xml_raw = xml_raw.replace(b"2020-02-04T12:00Z", b"2020-02-04T12:00:00Z")
        print("FIXED    :  DATETIME in version 71")
    return xml_raw

def fix_v12_duplicate_entry(xml_raw):
    pat = rb'\n *<entry id="sea_surface_height_above_reference_ellipsoid">.+?</entry> *?(?=\n)'
    xml_raw = re.sub(pat, b"", xml_raw, 1, re.S)
    print("FIXED    :  Removed first duplicate of 'sea_surface_height_above_reference_ellipsoid'")
    return xml_raw


def add_modified_date(xml_raw):
    time_stamp = datetime.now(UTC).strftime("%Y-%m-%dT%H:%M:%SZ").encode("utf-8")
    modified = b"last_modified"
    modified_start = b"<" + modified + b">"
    modified_end = modified_start.replace(b"<", b"</")
    modified_element = modified_start + time_stamp + modified_end
    inst_text = b"<institution>"
    n = len( inst_text)
    inst = re.search((b"\n( *)" + inst_text), xml_raw)
    spaces = inst.group()[1: -n]
    position = inst.span()[0]
    xml_raw = xml_raw[:position] + b"\n" + spaces + modified_element + xml_raw[position:]
    print("ADDED    :  MODIFIED DATE")
    return xml_raw


def do_the_work(version):
    xml_original = f"{BASE_PATH}{version}/src/cf-standard-name-table.xml"
    xml_saved = xml_original.replace("-table", "-table__SAVED")

    my_file = Path(xml_saved)
    if my_file.is_file():
        # work on original files that are already saved
        with open(xml_saved, "rb") as fh:
            xml_raw = fh.read()
        print(f"READING  SAVED ORIGINAL FILE:  {xml_original}")
    else:
        # work on original files that have not yet been saved
        with open(xml_original, "rb") as fh:
            xml_raw = fh.read()
        # then save the original before changing the original
        with open(xml_saved, "wb") as fh:
            fh.write(xml_raw)
        print(f"READING AND SAVING ORIGINAL FILE:  {xml_original}")

    if xml_raw[:6] != b"<?xml ":
        xml_raw = b'<?xml version="1.0"?>\n' + xml_raw
        print("ADDED    :  '<?xml ...>")
    for old_xsd in [b"CFStandardNameTable-1.0.xsd", 
                    b"CFStandardNameTable-1.1.xsd", 
                    b"cf-standard-name-table-1.1.xsd"]:
        if old_xsd in xml_raw: 
            xml_raw = xml_raw.replace(old_xsd, NEW_XSD)
            print(f"CHANGED  :  XSD FILE NAME   {old_xsd.decode('utf-8')}  -->  {NEW_XSD.decode('utf-8')}")

    if version == 1:
        xml_raw = fix_v1_datetime(xml_raw)
    elif version == 12:
        xml_raw = fix_v12_duplicate_entry(xml_raw)
    elif version == 71:
        xml_raw = fix_v71_datetime(xml_raw)

    xml_raw = xml_raw.replace(b"last_modified", b"first_published_date")
    print("CHANGED  :  'last_modified'  -->  'first_published_date'")

    xml_raw = add_modified_date(xml_raw)

    with open(xml_original, "wb") as fh:
        fh.write(xml_raw)


if __name__ == "__main__":
    for version in range(1, 100):
        try:
            if version != 38:
                print("\n")
                do_the_work(version)
        except:
            break
