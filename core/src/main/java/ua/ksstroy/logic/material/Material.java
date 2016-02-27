package ua.ksstroy.logic.material;

public class Material {

    private String id;

    private MaterialType materialType;

    private Double unitsPerSquareMeter;

    private Double planedCost;

    public MaterialType getMaterialType() {
        return materialType;
    }


    public void setMaterialType(MaterialType materialType) {
        this.materialType = materialType;
    }


    public Double getUnitsPerSquareMeter() {
        return unitsPerSquareMeter;
    }


    public void setUnitsPerSquareMeter(Double unitsPerSquareMeter) {
        this.unitsPerSquareMeter = unitsPerSquareMeter;
    }

    /*
    Calculate quantity on price for unit
     */

    public Double getPlanedCost() {
        planedCost = unitsPerSquareMeter * materialType.getPricePerUnit();
        return planedCost;
    }

    public void setPlanedCost(Double planedCost) {
        this.planedCost = planedCost;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

}