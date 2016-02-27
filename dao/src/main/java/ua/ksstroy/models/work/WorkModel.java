package ua.ksstroy.models.work;

import ua.ksstroy.models.worktype.WorkTypeModel;
import ua.ksstroy.models.zone.ZonesModel;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "works", catalog = "ksstroy")
public class WorkModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "work_id", unique = true, nullable = false)
    private String id;

    /*@Column(name = "name")
    private String name;*/

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "work_type_id")
    private WorkTypeModel type;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "zone_id")
    private ZonesModel zoneModel;

    /*@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "work_zone_rel", catalog = "ksstroy", joinColumns = {
            @JoinColumn(name = "work_id", nullable = false, updatable = false)},
            inverseJoinColumns = {@JoinColumn(name = "zone_id",
                    nullable = false, updatable = false)})
    private List<ZonesModel> workZones;*/

    @Column(name = "planed_cost")
    private Double planedCost;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "parent_group_id")
    private WorkGroupModel workGroupModel;

    public WorkModel() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    /*public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }*/

    public WorkTypeModel getType() {
        return type;
    }

    public void setType(WorkTypeModel type) {
        this.type = type;
    }

    public ZonesModel getZonesModel() {
        return zoneModel;
    }

    public void setZonesModel(ZonesModel zonesModel) {
        this.zoneModel = zonesModel;
    }

    /*public List<ZonesModel> getWorkZones() {
        return workZones;
    }

    public void setWorkZones(List<ZonesModel> workZones) {
        this.workZones = workZones;
    }*/

    public Double getPlanedCost() {
        return planedCost;
    }

    public void setPlanedCost(Double planedCost) {
        this.planedCost = planedCost;
    }

    public WorkGroupModel getWorkGroupModel() {
        return workGroupModel;
    }

    public void setWorkGroupModel(WorkGroupModel workGroupModel) {
        this.workGroupModel = workGroupModel;
    }
}
