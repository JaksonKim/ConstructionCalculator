package ua.ksstroy.logic.work;

public interface WorkManager {

    void addWork(Work work, String parentGroupId);

    void updateWork(String workId, Work work);

    void remoteWork(String workId);

    void addWorkGroup(String workGroupName, String parentGroupId);

    void addRootWorkGroup(String groupName, Integer projectId);

    void removeWorkTypeGroup(String groupId);

    WorkGroup getWorkHierarchy(String projectId);

    void updateWorkGroupName(String groupId, String newName);

}