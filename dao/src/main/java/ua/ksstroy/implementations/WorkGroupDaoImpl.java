package ua.ksstroy.implementations;

import org.springframework.stereotype.Component;
import ua.ksstroy.converter.work.WorkGroupModelToWorkGroupConvertor;
import ua.ksstroy.logic.work.WorkGroup;
import ua.ksstroy.logic.work.WorkGroupDao;
import ua.ksstroy.models.project.ProjectModel;
import ua.ksstroy.models.work.WorkGroupModel;
import ua.ksstroy.persistence.DoInTransaction;
import ua.ksstroy.persistence.GetInTransaction;
import ua.ksstroy.persistence.SessionWrapper;
import ua.ksstroy.persistence.TransactionHelper;

@Component
public class WorkGroupDaoImpl implements WorkGroupDao {
    TransactionHelper helper = new TransactionHelper();

    @Override
    public void addWorkGroup(final String workGroupName, final String parentGroupId) {
        helper.doWithCommit(new DoInTransaction() {
            @Override
            public void process(SessionWrapper session) {
                WorkGroupModel model = new WorkGroupModel();
                model.setName(workGroupName);
                model.setWorkGroupModel(session.get(WorkGroupModel.class, "1"));
                session.save(model);
            }
        });
    }

    @Override
    public void addRootWorkGroup(final String groupName, final Integer projectId) {
        helper.doWithCommit(new DoInTransaction() {
            @Override
            public void process(SessionWrapper session) {
                ProjectModel projectModel = session.get(ProjectModel.class, projectId);
                WorkGroupModel rootGroup = new WorkGroupModel(groupName);
                projectModel.setWorkGroupModel(rootGroup);

                session.save(rootGroup);
                session.saveOrUpdate(projectModel);
            }
        });
    }

    @Override
    public void removeWorkTypeGroup(final String groupId) {
        helper.doWithCommit(new DoInTransaction() {
            @Override
            public void process(SessionWrapper session) {
                session.delete(session.get(WorkGroupModel.class, groupId));
            }
        });
    }

    @Override
    public WorkGroup getWorkHierarchy(final String projectId) {
        return helper.simpleAction(new GetInTransaction<WorkGroup>() {
            public WorkGroup process(SessionWrapper session) {
                ProjectModel project = session.get(ProjectModel.class, projectId);
                return new WorkGroupModelToWorkGroupConvertor().convert(project.getWorkGroupModel());
            }
        });
    }

    @Override
    public void updateWorkGroupName(final String groupId, final String newName) {
        helper.doWithCommit(new DoInTransaction() {
            @Override
            public void process(SessionWrapper session) {
                WorkGroupModel workGroupModel = session.get(WorkGroupModel.class, groupId);
                workGroupModel.setId(groupId);
                workGroupModel.setName(newName);
                session.saveOrUpdate(workGroupModel);
            }
        });
    }

    @Override
    public WorkGroup getWorkGroup(final String id) {
        return helper.simpleAction(new GetInTransaction<WorkGroup>() {
            public WorkGroup process(SessionWrapper session) {
                WorkGroup workHierarchy = new WorkGroupModelToWorkGroupConvertor().convert(session.get(WorkGroupModel.class, id));
                return workHierarchy;
            }
        });
    }
}
