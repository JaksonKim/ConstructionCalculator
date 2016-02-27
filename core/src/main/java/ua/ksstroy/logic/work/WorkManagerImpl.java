package ua.ksstroy.logic.work;

import org.springframework.stereotype.Component;

import javax.annotation.Resource;

@Component(value = "WorkManagerImpl")
public class WorkManagerImpl implements WorkManager {

    @Resource
    WorkDao workDao;
    @Resource
    WorkGroupDao workGroupDao;

    @Override
    public void addWork(Work work, String parentGroupId) {
        workDao.addWork(work, parentGroupId);
    }

    @Override
    public void updateWork(String workId, Work work) {
        workDao.updateWork(workId, work);
    }

    @Override
    public void remoteWork(String workId) {
        workDao.remoteWork(workId);
    }

    @Override
    public void addWorkGroup(String workGroupName, String parentGroupId) {
        workGroupDao.addWorkGroup(workGroupName, parentGroupId);
    }

    @Override
    public void addRootWorkGroup(String groupName, Integer projectId) {
        workGroupDao.addRootWorkGroup(groupName, projectId);
    }

    @Override
    public void removeWorkTypeGroup(String groupId) {
        workGroupDao.removeWorkTypeGroup(groupId);
    }

    @Override
    public WorkGroup getWorkHierarchy(String projectId) {
        WorkGroup workGroup = workGroupDao.getWorkHierarchy(projectId);
        return workGroup;
    }

    @Override
    public void updateWorkGroupName(String groupId, String newName) {
        workGroupDao.updateWorkGroupName(groupId, newName);
    }







}