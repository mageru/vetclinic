package com.springsource.petclinic.domain;

import java.util.Date;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(sequenceName = "VISIT_SEQ", finders = { "findVisitsByDescriptionAndVisitDate", "findVisitsByVisitDateBetween", "findVisitsByDescriptionLike" })
@RooJson
public class Visit {

    @Size(max = 255)
    private String description;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date visitDate;

    @NotNull
    @ManyToOne
    private Pet pet;

    @ManyToOne
    private Vet vet;
}
