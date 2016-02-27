package ua.ksstroy.logic.work;

public interface WorkDao {

	void addWork(Work work, String parentGroupId);

	void updateWork(String workId, Work work);

	void remoteWork(String workId);

}