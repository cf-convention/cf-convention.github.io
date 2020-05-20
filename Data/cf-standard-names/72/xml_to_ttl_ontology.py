#!/usr/bin/python

from xml.dom import pulldom

srcXmlFile = 'src/cf-standard-name-table.xml'
rdfOutputFile = 'build/cf-standard-name-table.ttl'

# helper method to get an XML element text value
def getXmlNodeValue(node):
  text = ''
  for child in node.childNodes:
    text += child.data
  return text


with open(rdfOutputFile, 'w') as ttl:

  ttl.write('@base          <http://cfconventions.org/ont/parameter> .\n')
  ttl.write('@prefix :      <http://cfconventions.org/ont/parameter/> .\n')
  ttl.write('@prefix skos:  <http://www.w3.org/2004/02/skos/core#> .\n')
  ttl.write('@prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> .\n')
  ttl.write('@prefix owl:   <http://www.w3.org/2002/07/owl#> .\n')
  ttl.write('@prefix dct:   <http://purl.org/dc/terms/> .\n')
  ttl.write('\n')

  ttl.write('<>  a  owl:Ontology ;\n')
  ttl.write('        rdfs:label          "CF Standard Names" ;\n')
        
  # parse XML and add an RDF tuple for each entry and alias
  doc = pulldom.parse(srcXmlFile)
  for event, node in doc:
    if event == pulldom.START_ELEMENT:
      if node.tagName == 'version_number':
        doc.expandNode(node)
        version = getXmlNodeValue(node)
        ttl.write('        owl:versionInfo     "' + version + '" ;\n')
      elif node.tagName == 'last_modified':
        doc.expandNode(node)
        date = getXmlNodeValue(node)
        ttl.write('        dct:modified        "' + date + '" .\n')
        ttl.write('\n')
      if node.tagName == 'entry':
        id = node.getAttribute('id')
        label = id.replace('_', ' ').capitalize()
        uri = id.replace(' ', '_')
        ttl.write(':' + uri + '  a  :Standard_Name ;\n')
        ttl.write('        rdfs:label          "' + label + '" ;\n')
        ttl.write('        skos:exactMatch     <http://mmisw.org/ont/cf/parameter/' + uri + '> ;\n')
        ttl.write('        skos:exactMatch     <http://vocab.nerc.ac.uk/standard_name/' + uri + '/> ;\n')
      elif node.tagName == 'canonical_units':
        doc.expandNode(node)
        text = getXmlNodeValue(node)
        ttl.write('        :canonical_units    "' + text.replace('"', '\\"').encode('utf8') + '" ;\n')
      elif node.tagName == 'description':
        doc.expandNode(node)
        text = getXmlNodeValue(node)
        ttl.write('        skos:definition     "' + text.replace('"', '\\"').encode('utf8') + '" .\n\n')
      elif node.tagName == 'alias':
        doc.expandNode(node)
        id = node.getAttribute('id')
        uri = id.replace(' ', '_')
        node = node.getElementsByTagName('entry_id').item(0)        
        entryId = getXmlNodeValue(node)
        entryId = entryId.replace(' ', '_')
        if entryId != uri:
          ttl.write(':' + uri + '  a  :Standard_Name ;\n')
          ttl.write('        skos:exactMatch     :' + entryId + ' ;\n')
          ttl.write('        skos:note           "deprecated" .\n\n')

  # also add static definitions  
  ttl.write(':Standard_Name  a  owl:Class ;\n')
  ttl.write('        rdfs:label          "Standard Name" ;\n')
  ttl.write('        rdfs:subClassOf     skos:Concept .\n')
  ttl.write('\n')
        
  ttl.write(':canonical_units  a  owl:DatatypeProperty ;\n')
  ttl.write('        rdfs:domain         :Standard_Name .\n')
  ttl.write('\n')

