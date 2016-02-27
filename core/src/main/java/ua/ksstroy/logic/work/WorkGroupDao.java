package ua.ksstroy.logic.work;

public interface WorkGroupDao {

    void addWorkGroup(String workGroupName, String parentGroupId);

    void addRootWorkGroup(String groupName, Integer projectId);

    void removeWorkTypeGroup(String groupId);

    WorkGroup getWorkHierarchy(final String projectId);

    void updateWorkGroupName(String groupId, String newName);

    WorkGroup getWorkGroup(final String id);
}