package ua.ksstroy.logic.material;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MaterialManagerImpl implements MaterialManager {

    @Autowired
    MaterialDao materialDao;

    @Override
    public List<Material> getAllMaterials() {
        return materialDao.getAllMaterials();
    }

    @Override
    public void purchaseMaterial(Material materialData, String materialTypeId) {
        Material material = new Material();
        material.setUnitsPerSquareMeter(materialData.getUnitsPerSquareMeter());
        this.materialDao.purchaseMaterial(material, materialTypeId);
    }



}
