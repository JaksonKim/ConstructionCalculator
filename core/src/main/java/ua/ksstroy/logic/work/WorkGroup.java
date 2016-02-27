package ua.ksstroy.logic.work;

import java.util.ArrayList;
import java.util.List;

public class WorkGroup{

    private String id;

    private String name;

    private List<WorkGroup> groups;

    private List<Work> works;

    private double costForAllMaterials;

    private double costForJob;

    private double planedCost;

    
    public String getName() {
        return name;
    }

    
    public void setName(String name) {
        this.name = name;
    }

    
    public String getId() {
        return id;
    }

    
    public void setId(String id) {
        this.id = id;
    }

    
    public List<WorkGroup> getGroups() {
        return groups;
    }

    
    public void setGroups(List<WorkGroup> groups) {
        this.groups = groups;
    }

    
    public List<Work> getWork() {
        return works;
    }

    
    public void setWork(List<Work> works) {
        this.works = works;
    }

    public List<Work> getWorks() {
        return works;
    }

    public void setWorks(List<Work> works) {
        this.works = works;
    }

    public double getCostForAllMaterials() {
        double costForAllMaterials = 0;
        for(Work work : works){
            costForAllMaterials += work.getCostForAllMaterials();
        }

        return costForAllMaterials;
    }

    public void setCostForAllMaterials(double costForAllMaterials) {
        this.costForAllMaterials = costForAllMaterials;
    }

    public double getCostForJob() {
        double costForJobs = 0;
        for(Work work : works){
            costForJobs += work.getCostForJob();
        }
        return costForJobs;
    }

    public void setCostForJob(double costForJob) {
        this.costForJob = costForJob;
    }

    public double getPlanedCost() {
        double planedCost = 0;

        for(Work work : works){
            planedCost += work.getPlanedCost();
        }
        return planedCost;
    }

    public void setPlanedCost(double planedCost) {
        this.planedCost = planedCost;
    }
}