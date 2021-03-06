package ua.ksstroy.converter.worktype;

import ua.ksstroy.converter.Converter;
import ua.ksstroy.logic.worktype.WorkType;
import ua.ksstroy.logic.worktype.WorkTypeGroup;
import ua.ksstroy.models.worktype.WorkTypeGroupModel;
import ua.ksstroy.models.worktype.WorkTypeModel;

import java.util.ArrayList;
import java.util.List;

public class WorkTypeGroupModelToWorkTypeGroupHierarchyConverter implements Converter<WorkTypeGroupModel, WorkTypeGroup> {

    public WorkTypeGroup convert(WorkTypeGroupModel model) {
        WorkTypeGroup workTypeGroup = new WorkTypeGroup();
        workTypeGroup.setId(Integer.parseInt(model.getId()));
        workTypeGroup.setName(model.getName());

        List<WorkTypeGroup> workTypeGroupList = new ArrayList<>();
        for (WorkTypeGroupModel group : model.getSubGroups()) {
            workTypeGroupList.add(convert(group));
        }
        workTypeGroup.setWorkTypeGroups(workTypeGroupList);

        List<WorkType> workTypes = new ArrayList<>();
        for (WorkTypeModel workTypeModel : model.getWorkTypeGroup()) {
            workTypes.add(new WorkTypeModelToWorkTypeConverter().convert(workTypeModel));
        }
        workTypeGroup.setWorkTypes(workTypes);

        return workTypeGroup;
    }
}
