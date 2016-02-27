package ua.ksstroy.converter.work;

import ua.ksstroy.converter.Converter;
import ua.ksstroy.converter.worktype.WorkTypeModelToWorkTypeConverter;
import ua.ksstroy.converter.zone.ZonesModelToZoneConverter;
import ua.ksstroy.logic.work.Work;
import ua.ksstroy.models.work.WorkModel;
public class WorkModelToWorkConverter implements Converter<WorkModel, Work> {

    @Override
    public Work convert(WorkModel workModel) {
        Work work = new Work();
        work.setId(workModel.getId());
        //work.setName(workModel.getName());
        work.setPlanedCost(workModel.getPlanedCost());
        work.setType(new WorkTypeModelToWorkTypeConverter().convert(workModel.getType()));
        work.setWorkZone(new ZonesModelToZoneConverter().convert(workModel.getZonesModel()));

        return work;
    }

}