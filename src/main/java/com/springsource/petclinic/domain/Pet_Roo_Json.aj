// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.petclinic.domain;

import com.springsource.petclinic.domain.Pet;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect Pet_Roo_Json {
    
    public String Pet.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static Pet Pet.fromJsonToPet(String json) {
        return new JSONDeserializer<Pet>().use(null, Pet.class).deserialize(json);
    }
    
    public static String Pet.toJsonArray(Collection<Pet> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<Pet> Pet.fromJsonArrayToPets(String json) {
        return new JSONDeserializer<List<Pet>>().use(null, ArrayList.class).use("values", Pet.class).deserialize(json);
    }
    
}
