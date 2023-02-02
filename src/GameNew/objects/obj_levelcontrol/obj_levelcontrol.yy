{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "obj_levelcontrol",
  "eventList": [
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":2,"isDnD":false,},
  ],
  "managed": true,
  "overriddenProperties": [],
  "parent": {
    "name": "Important Objects",
    "path": "folders/Objects/Important Objects.yy",
  },
  "parentObjectId": {
    "name": "par_alwaysactive",
    "path": "objects/par_alwaysactive/par_alwaysactive.yy",
  },
  "persistent": false,
  "physicsAngularDamping": 0.1,
  "physicsDensity": 0.5,
  "physicsFriction": 0.2,
  "physicsGroup": 1,
  "physicsKinematic": false,
  "physicsLinearDamping": 0.1,
  "physicsObject": false,
  "physicsRestitution": 0.1,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsShapePoints": [],
  "physicsStartAwake": true,
  "properties": [
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"levelbiome","filters":[],"listItems":[
        "biome.plains",
        "biome.forest",
        "biome.bog",
      ],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"biome.plains","varType":6,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"inside","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"False","varType":3,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"cave","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"0","varType":3,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"loopAudio[0]","filters":[
        "GMSound",
      ],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"snd_none","varType":5,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"loopAudio[1]","filters":[
        "GMSound",
      ],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"snd_none","varType":5,},
  ],
  "solid": false,
  "spriteId": {
    "name": "spr_control",
    "path": "sprites/spr_control/spr_control.yy",
  },
  "spriteMaskId": null,
  "visible": false,
}