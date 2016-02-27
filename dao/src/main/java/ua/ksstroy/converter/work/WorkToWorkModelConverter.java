package ua.ksstroy.converter.work;

import ua.ksstroy.converter.Converter;
import ua.ksstroy.converter.worktype.WorkTypeToWorkTypeModelConverter;
import ua.ksstroy.converter.zone.ZoneToZoneModelConverter;
import ua.ksstroy.logic.work.Work;
import ua.ksstroy.models.work.WorkModel;

public class WorkToWorkModelConverter implements Converter<Work, WorkModel> {

    @Override
    public WorkModel convert(Work work) {
        WorkModel workModel = new WorkModel();
        workModel.setId(work.getId());
        //workModel.setName(work.getName());
        workModel.setType(new WorkTypeToWorkTypeModelConverter().convert(work.getType()));
        workModel.setPlanedCost(work.getPlanedCost());
        workModel.setZonesModel(new ZoneToZoneModelConverter().convert(work.getWorkZone()));

        return workModel;
    }

}