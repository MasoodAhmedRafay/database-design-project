#!/bin/python
import sys
import json


class Entity:
    def __init__(self,name,ide,is_relation=False):
        self.name = name
        self.id = ide
        self.attribs = []
        self.is_relation = is_relation

    def add_attrib(self,attrib):
        self.attribs.append(attrib)

    def __repr__(self):
        s = f"{self.name}, {self.id}:\n"
        for a in self.attribs:
            s += f"\t {a}\n"

        return s
    
def entities(obj):
    entities = []
    attributes = []
    for f in obj['shapes']:
        ide = f['details']['id']
        name= f['details']['name']
        if f['type'] == "Entity":
            entities.append(Entity(name,ide))

        if f['type'] == "Relationship":
            e = Entity(name,ide)
            e.is_relation = True
            entities.append(e)
            
        if f['type'] == "Attribute":
            attributes.append((name, ide))

    for f in obj['connectors']:
        if f['type'] == "Connector":
            source = f['source']
            target = f['destination']
            e = next(entity for entity in entities if entity.id == target)
            attrib = next((n,i) for (n,i) in attributes if i == source)
            e.add_attrib(attrib)
    return entities


def picture(ents):
    s = "\\begin{tikzpicture}[auto,node distance=1.5cm]\n"
    prevnode = None
    for e in ents:
        t = 'entity' if e.is_relation else 'entity'
        if prevnode == None:
            pos = ""
        else:
            pos = f"[below right = of {prevnode}]"
        s+= f"\\node[{t}] ({e.name}) {pos} { {e.name} }\n"
        s+= "[grow=up, sibling distance=3cm]"

        for (a,n) in e.attribs:
            s+= "\n\t child {node[attribute] {" + a + "} }"
        s+=";\n"
        prevnode = e.name


    s += "\end{tikzpicture}"

    
    return s

if __name__ == '__main__':
    file = open(sys.argv[1], "r")
    js = json.loads(file.read())
    shapes = js['shapes']
    print(picture(entities(js)))
