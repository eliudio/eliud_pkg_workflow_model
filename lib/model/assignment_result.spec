{
  "id": "AssignmentResult",
  "packageName": "eliud_pkg_workflow_model",
  "packageFriendlyName": "workflow",
  "generate": {
    "generateComponent": false,
    "generateRepository": true,
    "generateCache": true,
    "hasPersistentRepository": false,
    "generateFirestoreRepository": false,
    "generateRepositorySingleton": false,
    "generateModel": true,
    "generateEntity": true,
    "generateForm": true,
    "generateList": true,
    "generateDropDownButton": true,
    "generateInternalComponent": false,
    "generateEmbeddedComponent": true
  },
  "fields": [
    {
      "fieldName": "documentID",
      "required": true,
      "displayName": "Document ID",
      "fieldType": "String",
      "defaultValue": "IDENTIFIER",
      "iconName": "vpn_key",
      "hidden": true
    },
    {
      "fieldName": "key",
      "displayName": "Key",
      "fieldType": "String"
    },
    {
      "fieldName": "value",
      "displayName": "Value",
      "fieldType": "String"
    }
  ],
  "listFields": {
    "title": "value.key != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.key!)) : Container()",
    "subTitle": "value.value != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.value!)) : Container()"
  }
}
