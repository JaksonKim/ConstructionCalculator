package ua.ksstroy.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import ua.ksstroy.logic.work.*;
import ua.ksstroy.logic.worktype.WorkTypeManagerImpl;
import ua.ksstroy.logic.zone.ZoneManagerImpl;

import javax.annotation.Resource;
@Controller
public class WorkController {

    @Resource(name = "WorkManagerImpl")
    WorkManager workManager;

    @Resource(name = "WorkTypeManagerImpl")
    WorkTypeManagerImpl workTypeManager;

    @Resource(name = "ZoneManagerImpl")
    ZoneManagerImpl zoneManager;

    ModelAndView workModelView;

    @RequestMapping(value = "/projects/{projectId}/work", method = RequestMethod.GET)
    public ModelAndView showZHD(@PathVariable("projectId") String projectId) {
        workModelView = new ModelAndView("works");
        workModelView.addObject("projectId", projectId);
        workModelView.addObject("WorkHierarchy", workManager.getWorkHierarchy(projectId));
        workModelView.addObject("workType", workTypeManager.getWorkTypeHierarchy());
        workModelView.addObject("ZoneHierarchy", zoneManager.getRootZoneHierarchy(projectId));

        return workModelView;
    }

    @RequestMapping(value = "/projects/addInnerWorkGroup", method = RequestMethod.POST)
    public String addInnerWorkGroup(@RequestParam("name") String innerWorkTypeGroupName,
                                    @RequestParam("parentId") String parentWorkTypeGroupId,
                                    @RequestParam("projectId") String projectId) {

        workManager.addWorkGroup(innerWorkTypeGroupName, parentWorkTypeGroupId);

        return "redirect:" + projectId + "/work";
    }

    @RequestMapping(value = "/projects/removeWorkGroup", method = RequestMethod.POST)
    public String removeWorkGroup(@RequestParam("groupId") String id,
                                  @RequestParam("projectId") String projectId) {

        workManager.removeWorkTypeGroup(id);

        return "redirect:" + projectId + "/work";
    }

    @RequestMapping(value = "/projects/updateWorkGroupName", method = RequestMethod.POST)
    public String updateWorkGroupName(@RequestParam("groupId") String groupId,
                                      @RequestParam("newGroupName") String newGroupName,
                                      @RequestParam("projectId") String projectId) {

        workManager.updateWorkGroupName(groupId, newGroupName);

        return "redirect:" + projectId + "/work";
    }


    @RequestMapping(value = "/projects/addWork", method = RequestMethod.POST)
    public String addWork(/*@RequestParam("name") String name,*/
                          @RequestParam("parentId") String parentWorkTypeGroupId,
                          @RequestParam("projectId") String projectId,
                          @RequestParam("workTypeId") String workTypeId,
                          @RequestParam("zoneId") String zoneId) {

        Work work = new Work();
        //work.setName(name);

        work.setWorkZone(zoneManager.getZoneById(zoneId));

        work.setType(workTypeManager.getWorkTypeById(workTypeId));

        workManager.addWork(work, parentWorkTypeGroupId);
        System.out.println("add work");
        return "redirect:" + projectId + "/work";
    }


    @RequestMapping(value = "/projects/removeWork", method = RequestMethod.POST)
    public String removeWork(@RequestParam("id") String id,
                             @RequestParam("projectId") String projectId) {

        workManager.remoteWork(id);

        return "redirect:" + projectId + "/work";
    }

    @RequestMapping(value = "/projects/updateWork", method = RequestMethod.POST)
    public String updateWork(@RequestParam("id") String id,
                             /*@RequestParam("name") String name,*/
                             @RequestParam("projectId") String projectId,
                             @RequestParam("workTypeId") String workTypeId,
                             @RequestParam("zoneId") String zoneId) {

        Work work = new Work();
        //work.setName(name);

        work.setWorkZone(zoneManager.getZoneById(zoneId));

        work.setType(workTypeManager.getWorkTypeById(workTypeId));


        workManager.updateWork(id, work);

        return "redirect:" + projectId + "/work";
    }


}
