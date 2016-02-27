package ua.ksstroy.converter.material;

import ua.ksstroy.converter.Converter;
import ua.ksstroy.logic.material.Material;
import ua.ksstroy.models.material.MaterialModel;

public class MaterialModelToImplConverter implements Converter<MaterialModel, Material> {
    @Override
    public Material convert(MaterialModel materialModel) {
        Material material = new Material();
        material.setId(materialModel.getId());
        material.setUnitsPerSquareMeter(materialModel.getUnitsPerSquareMeter());
        material.setMaterialType(new MaterialTypeModelToMaterialTypeConverter().convert(materialModel.getMaterialType()));
        return material;
    }
}
