package ua.ksstroy.logic.work;

import ua.ksstroy.logic.material.Material;
import ua.ksstroy.logic.worktype.WorkType;
import ua.ksstroy.logic.zone.Zone;

import java.util.List;

public class Work {

    private String id;

    //private String name;

    private WorkType type;

    private Zone workZone;

    private double costForAllMaterials;

    private double costForJob;

    private double planedCost;

    public WorkType getType() {
        return type;
    }

    public void setType(WorkType type) {

        this.type = type;
    }

    public Zone getWorkZone() {
        return workZone;
    }

    public void setWorkZone(Zone workZone) {
        this.workZone = workZone;
    }

    public String getId() {
        return id;
    }

    
    public void setId(String id) {
        this.id = id;

    }

    /*public String getName() {
        // TODO Auto-generated method stub
        return name;
    }
    
    public void setName(String name) {
        this.name = name;

    }*/

    public Double getCostForAllMaterials() {
        double costForAllMaterials=0;
        List<Material> listMaterials = type.getMaterials();

        for (Material listMaterial : listMaterials) {
            costForAllMaterials = costForAllMaterials + listMaterial.getPlanedCost();
        }
        return costForAllMaterials;
    }

    public void setCostForAllMaterials(Double costForAllMaterials) {
        this.costForAllMaterials = costForAllMaterials;
    }

    public double getCostForJob() {
        return type.getUnitPrice();
    }

    public void setCostForJob(double costForJob) {
        this.costForJob = costForJob;
    }

    public Double getPlanedCost() {

        planedCost = getCostForJob() + (getCostForAllMaterials() * getWorkZone().getValue());

        return planedCost;
    }

    public void setPlanedCost(Double planedCost) {
        this.planedCost = planedCost;

    }
}