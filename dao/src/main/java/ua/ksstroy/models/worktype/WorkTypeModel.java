package ua.ksstroy.models.worktype;

import ua.ksstroy.models.material.MaterialModel;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "worktypes", catalog = "ksstroy")
public class WorkTypeModel implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "worktype_id", unique = true, nullable = false)
    private Integer id;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "unit_price")
    private Double unitPrice;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "parent_group_id")
    private WorkTypeGroupModel parentGroupId;

    @ManyToMany(fetch = FetchType.LAZY, cascade = {CascadeType.ALL})
    @JoinTable(name = "worktype_material_rel", joinColumns = @JoinColumn(name = "worktype_id"), inverseJoinColumns = @JoinColumn(name = "material_id"))
    private List<MaterialModel> materials;

    public WorkTypeModel() {
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }


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

    public Double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(Double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public List<MaterialModel> getMaterials() {
        return materials;
    }

    public void setMaterials(List<MaterialModel> materials) {
        this.materials = materials;
    }

    public WorkTypeGroupModel getParentGroupId() {
        return parentGroupId;
    }

    public void setParentGroupId(WorkTypeGroupModel parentGroupId) {
        this.parentGroupId = parentGroupId;
    }



	/*
    public Set<MaterialModel> getMaterials() {
		return materials;
	}

	public void setMaterials(Set<MaterialModel> materials) {
		this.materials = materials;
	}*/

}

