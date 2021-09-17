({
    
    onCourseSelected : function(component, event, helper){
		var courseIdMsg = event.getParam("courseId");
		component.set("v.course",courseIdMsg);
		component.set("v.id",courseIdMsg.Id);
        component.set("v.course.Description__c",courseIdMsg.Description__c);
		component.find("service").reloadRecord();
	}
})