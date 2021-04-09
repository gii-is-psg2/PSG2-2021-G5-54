package org.springframework.samples.petclinic.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "donations")
public class Donation extends BaseEntity{

    @Column(name = "quantity")
    private Integer quantity;

    @Column(name = "date")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime date;

    @JoinColumn(name = "payer_id")
    @ManyToOne(optional = false, cascade = CascadeType.ALL)
    private Owner payer;

    @JoinColumn(name = "cause_id")
    @ManyToOne(optional = false, cascade = CascadeType.ALL)
    private Cause cause;

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }

    public Owner getPayer() {
        return payer;
    }

    public void setPayer(Owner payer) {
        this.payer = payer;
    }

    public Cause getCause() {
        return cause;
    }

    public void setCause(Cause cause) {
        this.cause = cause;
    }
}
