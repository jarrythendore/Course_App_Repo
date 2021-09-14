({
    onCourseClick : function(component, event, helper) {
        var courseSelectedEvt = $A.get("e.c:CourseSelected");
        courseSelectedEvt.setParams({"courseId" : component.get("v.course")});
        courseSelectedEvt.fire();
    }
})