package org.springframework.samples.petclinic.model;

import javax.persistence.*;

@Entity
@Table(name = "causes")
public class Cause extends BaseEntity{

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "b_target")
    private Integer bTarget;

    @Column(name = "current_b")
    private Integer currentB;

    @Column(name = "org")
    private String org;

    @Column(name = "status")
    @Enumerated(EnumType.STRING)
    private CauseStatus status = CauseStatus.OPEN;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getbTarget() {
        return bTarget;
    }

    public void setbTarget(Integer bTarget) {
        this.bTarget = bTarget;
    }

    public Integer getCurrentB() {
        return currentB;
    }

    public void setCurrentB(Integer currentB) {
        this.currentB = currentB;
        if(currentB >= this.bTarget){
            this.status = CauseStatus.CLOSED;
        }
    }

    public CauseStatus getStatus() {
        return status;
    }

    public void setStatus(CauseStatus status) {
        this.status = status;
    }

    public String getOrg() {
        return org;
    }

    public void setOrg(String org) {
        this.org = org;
    }
}
