#!/bin/python
import sys
import json


class Entity:
    def __init__(self,name,ide,pos,relation=None):
        self.name = name
        self.id = ide
        self.attribs = []
        self.rels = []
        self.relation = relation
        self.pos = pos

    def is_relation(self):
        return self.relation != None
    def add_attrib(self,attrib):
        self.attribs.append(attrib)

    def add_relation(self, slotIndex, target):
        self.rels.append((slotIndex, target))
        
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
        pos = (f['details']['x'] / 50, f['details']['y'] / 50)
        if f['type'] == "Entity":
            entities.append(Entity(name,ide,pos))

        if f['type'] == "Relationship":
            slots = f['details']['slots']
            a = slots[0]['cardinality']
            at = slots[0]['entityId']
            b = slots[1]['cardinality']
            bt = slots[1]['entityId']
            entities.append(Entity(name, ide, pos, ((a,at), (b,bt))))
            
        if f['type'] == "Attribute":
            attributes.append((name, ide, pos))

    for f in obj['connectors']:
        source = f['source']
        target = f['destination']
        e = next(entity for entity in entities if entity.id == target)
        
           
        if f['type'] == "Connector":
            attrib = next((n,i,p) for (n,i,p) in attributes if i == source)
            e.add_attrib(attrib)
            
    return entities


def picture(ents):
    s = "\\begin{tikzpicture}[auto,node distance=1.5cm]\n"
    prevnode = None
    for e in ents:
        t = 'relationship' if e.is_relation() else 'entity'
        pos = f" at {e.pos} "
        s+= f"\\node[{t}] ({e.id}) {pos} { {e.name} };\n"

        for (a,n,p) in e.attribs:
            s+= f"\\node[attribute] ({n}) at {p} { {a} };\n"
            s+= f"\\draw[solid] ({e.id}) to ({n});\n"

    for e in ents:
        if e.is_relation():
            ((a,at), (b,bt)) = e.relation

            s+= f"\\draw[{b} to one] ({at}) to ({e.id});\n"
            s+= f"\\draw[one to {a}] ({e.id}) to ({bt});\n"
        
    s += "\end{tikzpicture}"
    
    return s

if __name__ == '__main__':
    file = open(sys.argv[1], "r")
    js = json.loads(file.read())
    shapes = js['shapes']
    print(picture(entities(js)))
