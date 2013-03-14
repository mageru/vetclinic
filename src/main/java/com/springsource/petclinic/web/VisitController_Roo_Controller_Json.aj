// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.petclinic.web;

import com.springsource.petclinic.domain.Visit;
import com.springsource.petclinic.web.VisitController;
import java.util.Date;
import java.util.List;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

privileged aspect VisitController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{id}", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> VisitController.showJson(@PathVariable("id") Long id) {
        Visit visit = Visit.findVisit(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (visit == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(visit.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> VisitController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<Visit> result = Visit.findAllVisits();
        return new ResponseEntity<String>(Visit.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> VisitController.createFromJson(@RequestBody String json) {
        Visit visit = Visit.fromJsonToVisit(json);
        visit.persist();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> VisitController.createFromJsonArray(@RequestBody String json) {
        for (Visit visit: Visit.fromJsonArrayToVisits(json)) {
            visit.persist();
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> VisitController.updateFromJson(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        Visit visit = Visit.fromJsonToVisit(json);
        if (visit.merge() == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> VisitController.updateFromJsonArray(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        for (Visit visit: Visit.fromJsonArrayToVisits(json)) {
            if (visit.merge() == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> VisitController.deleteFromJson(@PathVariable("id") Long id) {
        Visit visit = Visit.findVisit(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (visit == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        visit.remove();
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByDescriptionAndVisitDate", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> VisitController.jsonFindVisitsByDescriptionAndVisitDate(@RequestParam("description") String description, @RequestParam("visitDate") @DateTimeFormat(style = "M-") Date visitDate) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Visit.toJsonArray(Visit.findVisitsByDescriptionAndVisitDate(description, visitDate).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByDescriptionLike", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> VisitController.jsonFindVisitsByDescriptionLike(@RequestParam("description") String description) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Visit.toJsonArray(Visit.findVisitsByDescriptionLike(description).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByVisitDateBetween", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> VisitController.jsonFindVisitsByVisitDateBetween(@RequestParam("minVisitDate") @DateTimeFormat(style = "M-") Date minVisitDate, @RequestParam("maxVisitDate") @DateTimeFormat(style = "M-") Date maxVisitDate) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Visit.toJsonArray(Visit.findVisitsByVisitDateBetween(minVisitDate, maxVisitDate).getResultList()), headers, HttpStatus.OK);
    }
    
}