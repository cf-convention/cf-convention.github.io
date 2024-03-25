import os
import re
import argparse
import urllib.request
from io import BytesIO

from cfunits import Units as cfUnits
from cf_units import Unit as uuUnits
from lxml import etree



PATH0 = "../"
BASE_PATH = PATH0 + "cf-conventions/cf-convention.github.io/Data/cf-standard-names/"

def parse_xml(xml_raw):
    try:
        xml_tree = etree.parse(BytesIO(xml_raw))
    except etree.XMLSyntaxError:
        print(f"{':'*100}\n{xml_raw[:1000]}")
        raise
    return xml_tree


def get_schema(xml_tree):
    root = xml_tree.getroot()
    xsd_uri = root.values()[0]
    link = urllib.request.urlopen(xsd_uri)
    xsd_raw = link.read()
    xsd_tree = parse_xml(xsd_raw)
    schema = etree.XMLSchema(xsd_tree)
    return schema


def find_xml_errors(xml_tree, schema, xml_raw):
    try:
        schema.assertValid(xml_tree)
        print("  ---- Valid and Well-formed")         
    except etree.DocumentInvalid:
        xml_list = xml_raw.split(b"\n")
        for error in schema.error_log:
            for element in ["description", "canonical_units"]:
                if f"( {element}" in error.message:
                    std_name = xml_list[error.line - 1].split(b'"')[1].decode("utf-8)")
                    print(f"Line {error.line} : Standard name entry for '{std_name}' has no <{element}>")
                    break
            else:
                print(f"Line {error.line} :  {error.message}")


def check_units(can_units, std_name):
    uu = cfUnits(can_units)
    if not uu.isvalid:
        print(f"Canonical units '{can_units}' is not accepted by CF-UNITS for '{std_name}'")
    else:
        try:
            uu = uuUnits(can_units)
            if " -" in can_units:
                try:
                    uu = uuUnits(can_units.replace(" -", "-"))
                    print(f"Canonical units '{can_units}' has a spurious space for '{std_name}'")
                except ValueError:
                    print(f"Canonical unit '{can_units}' is really weird for '{std_name}'")
            elif "/" in can_units:
                print(f"Canonical units '{can_units}' used '/' for  '{std_name}'")
        except ValueError:
            print(f"Canonical unit '{can_units} is a special CF unit for  '{std_name}'")


def find_missing_and_duplicates(xml_raw, old_entry_list, old_alias_list):
    def _extract_entries(xml_raw):
        entry_list = []
        for entry in re.finditer(rb'<entry id=\".+?\">.+?</entry>', xml_raw, re.S):
            e = re.search(rb'(?<=\").+?(?=\")', entry.group())
            std_name = e.group().decode("utf-8")
            entry_list.append(std_name)
            can_units = re.search(rb'(?<=_units>).+?(?=</canonical)', entry.group())
            if can_units:
                can_units = can_units.group().decode("utf-8")
                check_units(can_units, std_name)
        return entry_list

    def _extract_aliases(xml_raw):
        alias_dict = {}
        for alias in re.finditer(rb'<alias id=.+?</alias>', xml_raw, re.S):
            alias_from = re.search(rb'(?<=\").+?(?=\")', alias.group())
            alias_to = re.search(rb'(?<=entry_id>).+?(?=</entry_id)', alias.group())
            alias_to = alias_to.group().decode("utf-8")
            alias_from = alias_from.group().decode("utf-8")
            alias_dict[alias_from] = alias_to
        return alias_dict

    new_entry_list = _extract_entries(xml_raw)
    alias_dict = _extract_aliases(xml_raw)
    new_alias_list = sorted(alias_dict.keys())
    for alias_from, alias_to in alias_dict.items():
        if alias_from in new_entry_list:
            print(f"Both defining and aliasing standard name  '{alias_from}'  into  '{alias_to}'")
        elif (alias_from not in old_entry_list) and (alias_from not in old_alias_list):
            print(f"Aliasing the undefined standard name  '{alias_from}'  into  '{alias_to}'")
        elif alias_to not in new_entry_list:
            print(f"Aliasing standard name  '{alias_from}'  into into the non-existing  '{alias_to}'")
    _ = [print(f"Standard name  '{s}' is discontinued") for
         s in sorted(list(set(old_entry_list) - 
                          (set(new_entry_list) | set(new_alias_list))))]
    return new_entry_list, new_alias_list


def do_the_work(version, severity, entry_list, alias_list):
    xml_file = f"{BASE_PATH}{version}/src/cf-standard-name-table.xml"
    with open(xml_file, "rb") as fh:
        xml_raw = fh.read()
    print(xml_file)

    xml_tree = parse_xml(xml_raw)
    schema = get_schema(xml_tree)
    if severity != 1:
        find_xml_errors(xml_tree, schema, xml_raw)
    if severity:
        entry_list, alias_list = find_missing_and_duplicates(xml_raw, entry_list, alias_list)
    return entry_list, alias_list


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        prog="LIST_ERRORS",
        description=("\nList (most) XML errors in standard name files.")
    )
    parser.add_argument("-v", "--version", type=int, default = 0,
                        help="Check a specific version (default is 0 (='all').")
    parser.add_argument("-s", "--severity", type=int, default = 0,
                        help="Level of error checks (0=xml (default), 1=CF, 2=both.")
    args = parser.parse_args()
    severity = args.severity

    if args.version == 0:
        version_list = range(1, 100)
    elif severity > 0:
        version_list = range(1, args.version + 1)
    else:
        version_list = [args.version]

    entry_list = []
    alias_list = []
    for version in version_list:
        try:
            if version != 38:
                print("\n")
                entry_list, alias_list = do_the_work(
                    version, args.severity, entry_list, alias_list
                )
        except:
            break
    print()
