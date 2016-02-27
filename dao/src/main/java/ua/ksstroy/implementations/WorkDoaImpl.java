package ua.ksstroy.implementations;

import org.springframework.stereotype.Component;
import ua.ksstroy.converter.work.WorkToWorkModelConverter;
import ua.ksstroy.converter.worktype.WorkTypeToWorkTypeModelConverter;
import ua.ksstroy.converter.zone.ZoneToZoneModelConverter;
import ua.ksstroy.logic.work.Work;
import ua.ksstroy.logic.work.WorkDao;
import ua.ksstroy.models.work.WorkGroupModel;
import ua.ksstroy.models.work.WorkModel;
import ua.ksstroy.persistence.DoInTransaction;
import ua.ksstroy.persistence.SessionWrapper;
import ua.ksstroy.persistence.TransactionHelper;

@Component
public class WorkDoaImpl implements WorkDao {
    private TransactionHelper helper = new TransactionHelper();

    @Override
    public void addWork(final Work work, final String parentGroupId) {
        helper.doWithCommit(new DoInTransaction() {
            @Override
            public void process(SessionWrapper session) {
                WorkModel workModel = new WorkToWorkModelConverter().convert(work);
                WorkGroupModel workGroupModel = session.get(WorkGroupModel.class, parentGroupId);
                workGroupModel.getWorks().add(workModel);
                session.saveOrUpdate(workGroupModel);
            }
        });
    }

    @Override
    public void updateWork(final String workId, final Work work) {
        helper.doWithCommit(new DoInTransaction() {
            @Override
            public void process(SessionWrapper session) {
                WorkModel newWorkModel = session.get(WorkModel.class, workId);
                //newWorkModel.setName(work.getName());
                newWorkModel.setType(new WorkTypeToWorkTypeModelConverter().convert(work.getType()));
                newWorkModel.setZonesModel(new ZoneToZoneModelConverter().convert(work.getWorkZone()));

                session.saveOrUpdate(newWorkModel);
            }
        });
    }

    @Override
    public void remoteWork(final String workId) {
        helper.doWithCommit(new DoInTransaction() {
            @Override
            public void process(SessionWrapper session) {
                session.delete(session.get(WorkModel.class, workId));
            }
        });
    }

}
