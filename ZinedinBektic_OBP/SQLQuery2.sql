select Project.projectid, project.projectname, project.maxhours, sum(assignment.hoursworked)as totalhours, sum(assignment.hoursworked)*100/maxhours as percentagerealization
from assignment inner join project on assigment.projectid=project.projectid
group by project.projectid, project.projectname, project.maxhours