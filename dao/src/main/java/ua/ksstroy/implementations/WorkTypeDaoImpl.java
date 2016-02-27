package ua.ksstroy.implementations;

import org.springframework.stereotype.Component;
import ua.ksstroy.converter.worktype.WorkTypeGroupModelToWorkTypeGroupHierarchyConverter;
import ua.ksstroy.converter.worktype.WorkTypeModelToWorkTypeConverter;
import ua.ksstroy.converter.worktype.WorkTypeToWorkTypeModelConverter;
import ua.ksstroy.logic.worktype.WorkType;
import ua.ksstroy.logic.worktype.WorkTypeDao;
import ua.ksstroy.logic.worktype.WorkTypeGroup;
import ua.ksstroy.logic.worktype.WorkTypeGroupDao;
import ua.ksstroy.models.worktype.WorkTypeGroupModel;
import ua.ksstroy.models.worktype.WorkTypeModel;
import ua.ksstroy.persistence.DoInTransaction;
import ua.ksstroy.persistence.GetInTransaction;
import ua.ksstroy.persistence.SessionWrapper;
import ua.ksstroy.persistence.TransactionHelper;

@Component
public class WorkTypeDaoImpl implements WorkTypeGroupDao, WorkTypeDao {

    private TransactionHelper helper = new TransactionHelper();

    @Override
    public WorkTypeGroup getWorkTypeHierarchy() {
        return helper.simpleAction(new GetInTransaction<WorkTypeGroup>() {
            public WorkTypeGroup process(SessionWrapper session) {
                WorkTypeGroup workTypeHierarchy = new WorkTypeGroupModelToWorkTypeGroupHierarchyConverter().
                        convert(session.get(WorkTypeGroupModel.class, "1"));
                return workTypeHierarchy;
            }
        });
    }

    public WorkType getWorkTypeById(final String workTypeId) {
        return helper.simpleAction(new GetInTransaction<WorkType>() {
            public WorkType process(SessionWrapper session) {
                return new WorkTypeModelToWorkTypeConverter().convert(session.get(WorkTypeModel.class, Integer.parseInt(workTypeId)));

            }
        });
    }

    @Override
    public void addWorkTypeGroup(final String workTypeGroupName, final String parentGroupId) {
        helper.doWithCommit(new DoInTransaction() {
            @Override
            public void process(SessionWrapper session) {
                WorkTypeGroupModel model = new WorkTypeGroupModel();
                model.setName(workTypeGroupName);
                model.setSubGroupsToRootGroup(session.get(WorkTypeGroupModel.class, parentGroupId));
                session.save(model);
            }
        });

    }

    @Override
    public void addWorkTypeGroup(final String groupName) {
        helper.doWithCommit(new DoInTransaction() {
            @Override
            public void process(SessionWrapper session) {
                WorkTypeGroupModel model = new WorkTypeGroupModel();
                model.setName(groupName);
                session.save(model);
            }
        });

    }

    @Override
    public void removeWorkTypeGroup(final String groupId) {
        helper.doWithCommit(new DoInTransaction() {
            @Override
            public void process(SessionWrapper session) {
                session.delete(session.get(WorkTypeGroupModel.class, groupId));
            }
        });

    }

    @Override
    public void updateWorkTypeGroupName(final String groupId, final String newName) {
        helper.doWithCommit(new DoInTransaction() {
            @Override
            public void process(SessionWrapper session) {
                WorkTypeGroupModel workTypeGroupModel = session.get(WorkTypeGroupModel.class, groupId);
                workTypeGroupModel.setId(groupId);
                workTypeGroupModel.setName(newName);

                session.saveOrUpdate(workTypeGroupModel);

            }
        });
    }

    @Override
    public void addWorkType(final WorkType workType, final String parentGroupId) {
        helper.doWithCommit(new DoInTransaction() {
            @Override
            public void process(SessionWrapper session) {
                WorkTypeModel model = new WorkTypeToWorkTypeModelConverter().convert(workType);
                WorkTypeGroupModel parentGroup = session.get(WorkTypeGroupModel.class, parentGroupId);
                parentGroup.getWorkTypeGroup().add(model);
                session.saveOrUpdate(parentGroup);

            }
        });

    }

    @Override
    public void removeWorkType(final String workTypeId) {
        helper.doWithCommit(new DoInTransaction() {
            @Override
            public void process(SessionWrapper session) {
                session.delete(session.get(WorkTypeModel.class, Integer.parseInt(workTypeId)));
            }
        });

    }

    @Override
    public void updateWorkType(final String WorkTypeId, final WorkType newWorkType) {
        helper.doWithCommit(new DoInTransaction() {
            @Override
            public void process(SessionWrapper session) {
                WorkTypeModel workTypeModel = session.get(WorkTypeModel.class, Integer.parseInt(WorkTypeId));
                workTypeModel.setId(Integer.parseInt(WorkTypeId));
                workTypeModel.setDescription(newWorkType.getDescription());
                workTypeModel.setName(newWorkType.getName());
                workTypeModel.setUnitPrice(newWorkType.getUnitPrice());
                session.saveOrUpdate(workTypeModel);
            }
        });
    }

}