package ua.ksstroy.models.material;

import ua.ksstroy.models.worktype.WorkTypeModel;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name = "materials", catalog = "ksstroy")
public class MaterialModel implements Serializable {
    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private String id;

    @Column(name = "units_per_square_meter")
    private Double unitsPerSquareMeter;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "material_type_id")
    private MaterialTypeModel materialType;

    @ManyToMany(fetch = FetchType.LAZY, mappedBy = "materials")
    private List<WorkTypeModel> workTypeModels;

    public MaterialModel() {

    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Double getUnitsPerSquareMeter() {
        return unitsPerSquareMeter;
    }

    public void setUnitsPerSquareMeter(Double unitsPerSquareMeter) {
        this.unitsPerSquareMeter = unitsPerSquareMeter;
    }

    public MaterialTypeModel getMaterialType() {
        return materialType;
    }

    public void setMaterialType(MaterialTypeModel materialType) {
        this.materialType = materialType;
    }

    public List<WorkTypeModel> getWorkTypeModels() {
        return workTypeModels;
    }

    public void setWorkTypeModels(List<WorkTypeModel> workTypeModels) {
        this.workTypeModels = workTypeModels;
    }

}